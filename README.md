![Roots](https://user-images.githubusercontent.com/72078024/110114341-cfb3e700-7df7-11eb-9d6d-394c72a80db6.gif)

<h2 align="center">旅行専門動画投稿サイトRoots</h2>

<p align="center">
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/72078024/110115307-3be31a80-7df9-11eb-8df1-5e9efc4b0046.jpeg" width="80px;" /></a>
  <br>
  <a href="https://getbootstrap.jp/"><img src="https://user-images.githubusercontent.com/72078024/110116417-d09a4800-7dfa-11eb-972b-4df98cda6730.png" height="45px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/72078024/110116914-89608700-7dfb-11eb-89bd-fa00ed1aa171.png" height="40px;" /></a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/72078024/110118264-6e8f1200-7dfd-11eb-813c-382263c74edb.png" height="70px;" /></a>
</p>

## 🌐 App URL

### **https://roots-app-30318.herokuapp.com/**

ログイン情報（テスト用）

- Eメール : **s@s.com**
- パスワード : sasasa1

## 📦 DEMO

<h3>トップページ（投稿一覧画面）</h3>

![top](https://user-images.githubusercontent.com/72078024/110124916-0d1f7100-7e06-11eb-9f08-910647d41996.gif)

<h3>新規投稿画面</h3>

![e63504f7679799eb9322b37a5c2637d7](https://user-images.githubusercontent.com/72078024/110125581-cc742780-7e06-11eb-840d-1d813d53cdc4.gif)

<h3>投稿詳細表示画面</h3>

![Roots](https://user-images.githubusercontent.com/72078024/110114341-cfb3e700-7df7-11eb-9d6d-394c72a80db6.gif)

<h3>投稿検索画面</h3>

![eb62cf1ed6753135c24f86447fefaa3a](https://user-images.githubusercontent.com/72078024/110126102-6a67f200-7e07-11eb-8510-d57955b2e6db.gif)

<h3>ユーザー詳細画面</h3>

![8937a7b4ac2fe04981f1808453ebe2a3](https://user-images.githubusercontent.com/72078024/110126583-e95d2a80-7e07-11eb-8c6d-d64a7b816927.gif)

<h3>お気に入り投稿一覧画面</h3>

![365cfeae8f1d71f52613381bc29240f4](https://user-images.githubusercontent.com/72078024/110126925-4eb11b80-7e08-11eb-96d2-1e4d37377d8e.gif)
  
## 工夫したポイント

## 使用技術（開発環境）

### バックエンド
Ruby,Ruby on Rails

### フロントエンド 
html,CSS,JavaScript,BootStrap4,jQuery,Ajax

### データベース
MySQL

### Webサーバ（本番環境）
heroku

### ソース管理
GitHub, GitHubDesktop

### テスト
RSpec

### エディタ
VSCode

## 課題や今後実装したい機能

## DB設計

### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               |        | null: false               |
| username           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | text   |                           |

### Association

- has_many :posts
- has_many :comments
- has_many :favorites



### posts テーブル

| Column     | Type       | Options            |
| ---------- | ---------- | ------------------ |
| caption    | string     | null: false        |
| describe   | text       |                    |
| place      | string     |                    |
| user       | references | foreign_key: true  |

### Association

- belongs_to :user
- has_many :comments
- has_many :favorites


### comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| post    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


### favorites テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| post    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
