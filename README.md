![Roots](https://user-images.githubusercontent.com/72078024/110114341-cfb3e700-7df7-11eb-9d6d-394c72a80db6.gif)

<h2 align="center">旅行専門動画投稿サイトRoots</h2>

<p align="center">
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/72078024/110115307-3be31a80-7df9-11eb-8df1-5e9efc4b0046.jpeg" width="80px;" /></a>
  <br>
  <a href="https://getbootstrap.jp/"><img src="https://user-images.githubusercontent.com/72078024/110116417-d09a4800-7dfa-11eb-972b-4df98cda6730.png" height="45px; /></a>
</p>


# テーブル設計

## users テーブル

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



## posts テーブル

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


## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| post    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


## favorites テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| post    | references | foreign_key: true |

- belongs_to :user
- belongs_to :post
