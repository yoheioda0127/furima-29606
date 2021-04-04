# 概要
テックキャンプの最終課題にて作成したアプリケーションを紹介いたします。

## アプリケーション情報
### アプリケーション概要
フリーマーケットのアプリケーションを作成いたしました。
### 接続先情報
URL: http://52.69.69.215/

### ベーシック認証
- ID: furima
- Pass: 4242

### テスト用アカウント等
#### 購入者アカウント
##### （ログイン情報）
- ニックネーム : さとう
- メールアドレス : sato@gamil.com
- パスワード : a025987
##### （購入用カード情報）
- 番号：424242424242424242
- 期限：2月/2030年
- セキュリティコード：123

#### 出品者アカウント
##### （ログイン情報）
- ニックネーム : まいけみ
- メールアドレス : maikemi@gamil.com
- パスワード : a025987

### Githubリポジトリ
https://github.com/yoheioda0127/furima-29606

### 開発状況
#### 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
- HTML
- CSS
- MySQL 5.6
- Github
- Visual Studio Code

#### 開発期間と平均作業時間
- 開発期間：10/20~12/20（2ヶ月間）
- 1日あたりの平均作業時間：平日4時間、休日6時間
- 合計：約270時間

#### 動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
※ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。  
- パソコン環境からのアクセスをお願いいたします。  
※スマホ、タブレットからのアクセスは、正常な画面表示ができません。  
- 接続先およびログイン情報については、上記の通りです。  
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。  
- アカウントへログイン→トップページ内画面右下出品ボタン→商品情報入力→商品出品  
- 確認後、ログアウト処理をお願いいたします。  

# オリジナル追加実装
テックキャンプで定められた要件以外に、以下の点についてアプリケーションの改善を行いました。  
- ①AWS S3の導入
- ②AWS EC2へのデプロイ
上記2点を実施した理由は、1）Tech Camp推奨のherokuでのデプロイでは、画像が長期間保存されないため。2）herokuではサーバーレスポンスが遅く、ユーザーに不快感を与えると考えたためです。


## アプリケーションの課題と今後の解決策
以下のシートをご覧ください。アプリケーションのペルソナが持つ課題を洗い出し、そして解決策となる追加実装の仕様を洗い出しました。  

https://docs.google.com/spreadsheets/d/1kFjJMO3zErLHDZwljewx2ryIPCemJL7kwXFtnNhBcng/edit#gid=60957725  

特に、スマートフォンからのECサイトが一般的になっている今日、本作品がスマートフォンに対応したブラウジングができないことは、大きなユーザーの利用機会損失であると考えています。

# 最終課題を経て
## 得た気づき：「 必要な情報にアクセス＆自分の物にする自走力が大切 」
テストコード記述の際の気づきです。ユーザー管理機能テストの際、「faker-japanese」というgemを自分で見つけ、実装しました。当時、私は、FactoryBotを用いてバリデーションを確認するためには絶対必要と考え、カリキュラムを離れてGoogleでfaker-japaneseを検索・実装を行いました。残念ながら実際は、そこまで実装する必要は無く、達成要件を確認していなかった私の凡ミスで時間を掛けてしまいました。しかし、思えばこの体験はとても貴重でした。なぜなら、これが私にとっての初めての「自走体験」だったからです。お恥ずかしながら、それまではカリキュラムに書いてあることが全てで、カリキュラムに書いてないことはすぐにメンターさんに質問して解決してきました。  
振り返れば、「devise」、「active hash」などもカリキュラムに予め用意されていたものです。実装したい機能を実現するために、世の中に存在する無数の解決手段の中の1つということに気づきました。今後エンジニアとして生きていく中で、この「自走力」は最も大事にしていきたい事の1つです。
## 苦労した点：「 未知の技術を取り入れること 」
初めて触るAWSの概念を掴むことです。実際、AWS EC2はインスタンス（仮想サーバー）に付与されたElastic IPを紐付けてデプロイを行います。最初は浅い知識のまま実装に取り掛かってしまい、1つのElastic IPにアプリを２つ入れてしまい、全く動かなくなってしまいました。  
また、インスタンスの停止、再開にも苦労しました。最初は、再起動してもアプリケーションが正常に動かず、破損したと勘違いして、計5回のデプロイのやり直しを行いました。しかし、Qiitaなどを調べていくと、（１）maria db（本番DB）の再起動。（２）Nginx(アセットを読み込むwebサーバー)のリスタートを行う必要がある事がわかりました。これにより、無事、自分自身で運用できるようになりました。



# テーブル設計

## usersテーブル
| Column             | Type    | Options     |
| --------------     | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :informations

## itemsテーブル
| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| item_name    | string  | null: false                    |
| detail       | text    | null: false                    |
| category_id  | integer | null: false                    |
| condition_id | integer | null: false                    |
| ship_cost_id | integer | null: false                    |
| ship_pref_id | integer | null: false                    |
| ship_day_id  | integer | null: false                    |
| price        | integer | null: false                    |

### Association
- belongs_to :user
- has_one    :information

## addressesテーブル
| Column         | Type    | Options                        |
| -------------- | ------- | -------------------------------|
| information_id | integer | null: false, foreign_key: true |
| post_num       | integer | null: false                    |
| pref_id        | integer | null: false                    |
| city           | string  | null: false                    |
| house_num      | string  | null: false                    |
| building       | string  |                                |
| tel            | string  | null: false                    |

### Association
- belongs_to :information

## informationテーブル
| Column  | Type    | Options                        |
| ------- | ------- | -------------------------------|
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one    :address
