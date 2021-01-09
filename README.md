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