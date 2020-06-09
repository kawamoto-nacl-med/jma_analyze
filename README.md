# Rubyバージョン

.ruby-versionファイルをご確認ください。予定ではテスト開発と同バージョンにするつもりです。

# 初回セットアップ

## gemのインストール

```
$ bundle install
```

## jma-receiptのソースを取得

こちらのレポジトリにはjma-receiptのソースを同梱していません。
各自取得をお願いします。
以下のファイルが存在するように、app/assets/sources/ 以下に取得をお願いします。

```
$ ls app/assets/sources/jma-receipt/cobol/orca00/ORCGM00.CBL
```

# railsの起動

```
$ bundle exec rails s
```

もしかしたら以下のようなエラーが出るかもしれません。エラー内容に沿って解決してください。
```
$ bundle exec rails s
=> Booting Puma
=> Rails 6.0.3.1 application starting in development
=> Run `rails server --help` for more startup options
error Couldn't find an integrity file
error Found 1 errors.


========================================
  Your Yarn packages are out of date!
  Please run `yarn install --check-files` to update.
========================================


To disable this check, please change `check_yarn_integrity`
to `false` in your webpacker config file (config/webpacker.yml).


yarn check v1.22.4
info Visit https://yarnpkg.com/en/docs/cli/check for documentation about this command.


Exiting

```
（参考） https://qiita.com/NaokiIshimura/items/8203f74f8dfd5f6b87a0
