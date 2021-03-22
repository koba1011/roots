![f5ca533ddabbe0b91bc627e80cc583bd](https://user-images.githubusercontent.com/72078024/110615909-46c1f480-81d7-11eb-8213-46bf5a80ed40.gif)

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

![ffa37a1e71445f73cc376549b95bb079](https://user-images.githubusercontent.com/72078024/110650871-438e2f00-81fe-11eb-96dc-2782d13b9e08.gif)

ログイン状態に関わらず、サイトにアクセスするとこの画面に遷移します。<br />
ここでは、投稿されたビデオのサムネイル、キャプション、ユーザーネームが表示されています。<br />
投稿がある場合は、全ユーザーに一覧で表示されます。
<br />
<br />
そして、投稿されたものからランダムで５件を以下のように表示するようにしています。投稿数が少ないと意味がないので、投稿数が５件以下では表示されません。<br />

<img src="https://i.gyazo.com/e61c3978e8827fc7fb63aff745f4223d.jpg" />
<br/>
<br />
ログイン状態ではないユーザーは投稿の詳細画面には遷移出来ずログイン画面に遷移されます。

投稿がない場合は以下のように表示されます。

![592089259c952ba032869eb459419932](https://user-images.githubusercontent.com/72078024/110619285-f8165980-81da-11eb-826d-d56ed7e62b1f.gif)
<br />
<br />
<br />
<br />
<h3>新規投稿画面</h3>

![c68d5696c6cf74db38e92f80cf053479](https://user-images.githubusercontent.com/72078024/110631335-c22ca180-81e9-11eb-97d3-f77f51c03e6f.gif)

ここではまず自分の動画を投稿するか、Youtubeの動画を共有するかを選ぶことができます。<br />
・自分の動画の場合はファイルをアップロードします。<br />
・Youtube動画の共有の場合は、共有したい動画のURLを入力します。<br />

ここの選択は必須となっており、どちらも空欄の場合は投稿することができません。また2つとも選択した場合も投稿できないようにしてます。<br />
<img src="https://i.gyazo.com/f93dd156c60bef11128f7f0b8e71d6d8.png" />


後はタイトルも必須となっておりますが、その他の情報は無くても投稿できます。<br />
場所をここで入力することで、投稿詳細画面にてその場所をGoogleマップで表示することが可能です。<br />
オススメで入力されたURLは、詳細画面でリンクとして表示されるようになっています。
<br />
<br />
<br />
<br />
<h3>投稿詳細表示画面</h3>

![607b1648de17b42d94466f18fd344abd](https://user-images.githubusercontent.com/72078024/110631981-73333c00-81ea-11eb-9b6a-c57f4a07033a.gif)

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

<img src="https://i.gyazo.com/310ddc47e9e44ea57cc8f8895dfc03f3.jpg" />
<br />
<br />
<br />
<br />
<h3>投稿検索画面</h3>

![d6a80d5808b13415d81569faf46dfc89](https://user-images.githubusercontent.com/72078024/110632288-c9a07a80-81ea-11eb-9f09-d331364ab093.gif)

ログイン状態に関わらず投稿の検索をすることができます。タイトルと場所をキーワードにかかるようにしています。<br />
検索結果の画面では、入力したキーワードとヒットした件数、ヒットした投稿の画像をランダムで検索キーワードの横に表示されるようにしています。

検索結果がない場合は、以下のように表示されます。

<image src="https://i.gyazo.com/ee962d1b3e76b707cc56577d3df67714.png" />
<br />
<br />
<br />
<br />
<h3>ユーザー詳細画面</h3>

![edc29416a063c7c2db3c28f56bf81d11](https://user-images.githubusercontent.com/72078024/110626492-1f255900-81e4-11eb-9e02-a9b4d7c7c86d.gif)


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

<image src="https://i.gyazo.com/fdf4e45847124523d97125b3ca687461.png" />
<br />
<br />
<br />
<br />
<h3>ユーザー情報編集画面</h3>

![a7aa2d28c38b3da38eb3b1a0737a8a54](https://user-images.githubusercontent.com/72078024/110632978-927e9900-81eb-11eb-9b09-f0f9fe995e13.gif)

ここでユーザーは、各情報を編集することができます。
<br />
<br />
<br />
<br />
<h3>お気に入り投稿一覧画面</h3>

![bce7ff376e0ac388b5a954d0c1690cdc](https://user-images.githubusercontent.com/72078024/110630389-a1178100-81e8-11eb-8510-641ff73be2b3.gif)

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
今後は、多言語かに対応できるようにしたいです。というのも世界の人と気軽に繋がれるをテーマにしているのですが今のままでは難しいと感じているからです。<br />
後は、今Reactを学習しているのでフロント部分をReactで作り直したいと考えています。今回はほぼ自分でCSSを書いて作成したので、material-uiやsemantic-uiを使ってもっとリッチなUIにできると考えています。<br />
非同期処理もjQueryで実装しているのでそこもReactで実装したいと思っています。

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
| latitude   | float      |                    |
| longitude  | float      |                    |

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
