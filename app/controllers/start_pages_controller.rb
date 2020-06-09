class StartPagesController < ApplicationController
  def home
  end

  def analyze
    file_name = File.basename(params[:source], ".CBL")
    @parents = []
    Dir.glob("**/*.CBL", base: "app/assets/sources/jma-receipt/cobol/").each do |source|
      next unless File.read("app/assets/sources/jma-receipt/cobol/" + source, encoding: 'CP51932:UTF-8').match(/^\s*CALL\s+"?#{file_name}"?[\s.\n]/i)
      @parents << source
    end
    @file_path = "app/assets/sources/jma-receipt/cobol/#{params[:source]}"
    @source = CobolSource.new(@file_path)
  end

  def source
    @file_path = "app/assets/sources/jma-receipt/cobol/#{params[:source]}"
    @source = File.read(@file_path, encoding: 'CP51932:UTF-8')
  end
end
