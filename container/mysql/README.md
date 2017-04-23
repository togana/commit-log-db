build
タグは任意

```
$ docker build -t togana/commit-log-db:v1.0 .
```

実行
MYSQL_ROOT_PASSWORDは任意の値設定

```
$ docker run -dp 3306:3306 -e MYSQL_ROOT_PASSWORD=pass togana/commit-log-db:v1.0
```
