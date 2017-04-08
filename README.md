commit-log
====

人気の高いgithubのリポジトリからコミットメッセージを取得してコミットログを検索できる何か

# 準備

crawler.rbを実行してデータ集め(8時間ぐらいかかったよ☆)
先にgemを入れる必要ある
// TODO: あとで追記する

`$ ruby crawler.rb`

手に入れたcommits.csvをバラす

`$ split -l 10000 commits.txt logs/commits-`

環境用意
`$ docker-compose up -d`

えんばるく実行
`$ docker-compose run embulk run config.yml.liquid`

