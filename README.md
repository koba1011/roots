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

ログイン状態に関わらず、サイトにアクセスするとこの画面に遷移します。
投稿がある場合は、全ユーザーに一覧で表示されます。
<br />
ログイン状態ではないユーザーは投稿の詳細画面には遷移出来ずログイン画面に遷移されます。

投稿がない場合は以下のように表示されます。

![be84753a89467fd21be18958b3cdb787](https://user-images.githubusercontent.com/72078024/110499544-b1255700-813b-11eb-95a1-94c567b58d7c.gif)
<br />
<br />
<br />
<br />
<h3>新規投稿画面</h3>

![e63504f7679799eb9322b37a5c2637d7](https://user-images.githubusercontent.com/72078024/110125581-cc742780-7e06-11eb-840d-1d813d53cdc4.gif)

ここではまず自分の動画を投稿するか、Youtubeの動画を共有するかを選ぶことができます。<br />
・自分の動画の場合はファイルをアップロードします。<br />
・Youtube動画の共有の場合は、共有したい動画のURLを入力します。<br />

ここの選択は必須となっており、どちらも空欄の場合は投稿することができません。また2つとも選択した場合も投稿できないようにしてます。<br />
<img src="https://i.gyazo.com/59384e6d66f00a1f40bc8c1757f56caf.png" />


後はタイトルも必須となっておりますが、その他の情報は無くても投稿できます。<br />
場所をここで入力することで、投稿詳細画面にてその場所をGoogleマップで表示することが可能です。<br />
オススメで入力されたURLは、詳細画面でリンクとして表示されるようになっています。
<br />
<br />
<br />
<br />
<h3>投稿詳細表示画面</h3>

![Roots](https://user-images.githubusercontent.com/72078024/110114341-cfb3e700-7df7-11eb-9d6d-394c72a80db6.gif)

ここでの主な機能は以下の通りです。<br />
・動画再生機能<br />
・動画説明文 (ユーザーに向けて動画の説明を書くところです)<br />
・お気に入り機能 (投稿をお気に入り登録することで、後で容易にアクセスすることができます)<br />
・オススメ (オススメのお店や場所を共有できます。入力されたURLはリンクとして表示されます)<br />
・場所 <br />
・地図 (上記の場所をもとに、その場所をGoogleマップで表示します。) <br />
・コメント機能 (ユーザー同士がコミュニケーションを取れるように非同期で実装しました)<br />
・編集、削除機能 (投稿者本人であれば編集、削除することが可能です)


Youtube動画を共有した場合はこのように表示されます。<br />

<img src="https://i.gyazo.com/3c4a20a2f335d13e6a70dedb299e43b1.jpg" />
<br />
<br />
<br />
<br />
<h3>投稿検索画面</h3>

![eb62cf1ed6753135c24f86447fefaa3a](https://user-images.githubusercontent.com/72078024/110126102-6a67f200-7e07-11eb-8510-d57955b2e6db.gif)

ログイン状態に関わらず投稿の検索をすることができます。タイトルと場所をキーワードにかかるようにしています。<br />
検索結果の画面では、入力したキーワードとヒットした件数、ヒットした投稿の画像をランダムで検索キーワードの横に表示されるようにしています。

検索結果がない場合は、以下のように表示されます。

<image src="https://i.gyazo.com/ed05dfc62b2fdd49158f6ec11085face.png" />
<br />
<br />
<br />
<br />
<h3>ユーザー詳細画面</h3>

![f5f2fd4cfa2548a2e7bf8d14deeea11a](https://user-images.githubusercontent.com/72078024/110507279-35c7a380-8143-11eb-8789-e467faccc751.gif)


ここで表示されるのは以下の通りです。<br />
<br />
・プロフィール画像 (好きな画像にすることができます)<br />
・ユーザネーム<br />
・投稿件数<br/>
・フォロー機能<br/>
・フォロー、フォロワー人数 <br />
・自己紹介<br />
・投稿したもの

投稿がない場合はこのように表示されます。<br />

<image src="https://i.gyazo.com/d755c3d7fabcd3a2e2c278387cc0dc46.png" />
<br />
<br />
<br />
<br />
<h3>ユーザー情報編集画面</h3>

![86d478b3f5b45872fb7991246b71bdd8](https://user-images.githubusercontent.com/72078024/110508251-2ac14300-8144-11eb-9b82-ca55f6cd0742.gif)

ここでユーザーは、各情報を編集することができます。
<br />
<br />
<br />
<br />
<h3>お気に入り投稿一覧画面</h3>

![365cfeae8f1d71f52613381bc29240f4](https://user-images.githubusercontent.com/72078024/110126925-4eb11b80-7e08-11eb-96d2-1e4d37377d8e.gif)

投稿詳細画面でお気に入りした一覧を表示しています。<br />
お気に入り件数と、各投稿の画像、タイトル、ユーザー名が表示されます。

  
## 工夫したポイント
見た目の部分では、シンプルで使いやすくを心がけました。<br />
機能も複雑なものは作らず、最低限の機能にすることで使いやすくゴチャゴチャしないアプリにしています。<br />
お気に入り一覧画面や、ユーザー詳細画面などの投稿の表示のされ方はシンプルかつ綺麗に表示されていると思います。<br />

それと投稿詳細画面でGooglマップを使って場所を表示する機能です。この機能を実装できたことでよりその投稿場所の雰囲気や、情報を得られるようになったと思います。

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
