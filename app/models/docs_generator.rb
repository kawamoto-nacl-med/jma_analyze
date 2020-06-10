# 参考：https://qiita.com/aosho235/items/30df83e06c89548e2d46
# 静的ドキュメントファイルを生成するクラス
class DocsGenerator
  # 出力先ディレクトリ
  SAVE_DIR = Rails.root.join('public/static_docs')

  def initialize
    # 静的化したいページのURLと保存先パスをここに書く
    @urls = []
    Dir.glob("**/*.CBL", base: Rails.root.join("app/assets/sources/jma-receipt/cobol/")).each do |source|
      @urls << {
          url_path: "/analyze?source=#{source}",
          save_path: "/#{source.gsub(/\.CBL$/, ".html")}"
      }
    end
  end

  def generate_all
    # Rails consoleで使えるのと同様のappオブジェクトを作成する
    # https://stackoverflow.com/a/20022165/5209556
    app = ActionDispatch::Integration::Session.new(Rails.application)

    @urls.each do |url|
      generate_one(app, url)
    end
  end

  private

  def generate_one(app, url)
    # リクエスト発行
    app.get("http://localhost:3000" + url[:url_path])

    # レスポンスをファイルに保存
    save_path = SAVE_DIR.join(url[:save_path].sub(%r{^/}, ''))
    FileUtils.mkdir_p(File.dirname(save_path))
    File.write(save_path, app.response.body)

    if !File.exist?(save_path)
      puts "Error: #{save_path} を作成できませんでした。"
    elsif File.size(save_path) == 0
      puts "Warning: #{save_path} のファイルサイズが 0 です。"
    else
      puts "Wrote: #{save_path}"
    end
  end
end
