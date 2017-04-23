commit-log
====

人気の高いgithubのリポジトリからコミットメッセージを取得してコミットログを検索できる何か

# 準備

`.env.template` をコピーして `.env` を作成する

MYSQL_DATABASEはデータベース名になるのでそのままで問題ないはず  
MYSQL_ROOT_PASSWORDは開発用のMySQLのパスワードになるので任意に指定します  

GITHUBAPI_ACCESS_TOKENは下記を参考して埋める  
https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/

crawler.rbを実行してデータ集め(8時間ぐらいかかった)  
[参考](http://d.hatena.ne.jp/minamijoyo/20150128)  
途中でタイムアウトするけど原因わかってない

```
$ gem install octokit
$ gem install parallel
$ ruby crawler.rb
```

手に入れたcommits.csvをバラす

`$ split -l 10000 commits.txt logs/commits-`

環境準備
`$ docker-compose up -d`

えんばるく実行
`$ docker-compose run embulk run config.yml.liquid`

インデックス追加

```
$ docker-compose exec mysql mysql -uroot -ppass commit-log -e'ALTER TABLE messages ADD PRIMARY KEY (`sha`)'
$ docker-compose exec mysql mysql -uroot -ppass commit-log -e'ALTER TABLE messages ADD FULLTEXT INDEX `full-text-index-message` (`message`)'
```

SQLダンプ

`$ docker-compose exec mysql sh -c "MYSQL_PWD=pass mysqldump -uroot commit-log --tables messages" | gzip > container/mysql/commit-log.sql.gz`

# ダンプデータを用いたイメージ作成

`./container/mysql/README.md` に記載
