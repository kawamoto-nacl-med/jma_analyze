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
