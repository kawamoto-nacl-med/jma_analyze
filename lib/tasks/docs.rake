desc "ページを静的化する"
task "docs:generate" => :environment do
  DocsGenerator.new.generate_all
end
