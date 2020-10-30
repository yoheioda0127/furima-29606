#テーブル設計

＃＃usersテーブル
| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| nickname       | string  | null: false, foreign_key: true |
| email          | string  | null: false, foreign_key: true |
| password       | string  | null: false, foreign_key: true |
| first_name     | string  | null: false, foreign_key: true |
| last_name      | string  | null: false, foreign_key: true |
| first_name_jap | string  | null: false, foreign_key: true |
| last_name_jap  | string  | null: false, foreign_key: true |
| birthday       | integer | null: false, foreign_key: true | pulldown

### Association

- has_many :items
- has_many :credit_cards
- belongs_to :address

＃＃itemsテーブル
| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| item_name | string  | null: false, foreign_key: true |
| detail    | text    | null: false, foreign_key: true |
| category  | string  | null: false, foreign_key: true | pulldown
| condition | string  | null: false, foreign_key: true | pulldown
| ship_cost | string  | null: false, foreign_key: true | pulldown
| ship_pref | string  | null: false, foreign_key: true | pulldown
| ship_day  | string  | null: false, foreign_key: true | pulldown
| price     | integer | null: false, foreign_key: true |

### Association

- belongs_to :credit_card
- belongs_to :user

＃＃credit_cardテーブル
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| card_num | integer | null: false, foreign_key: true |
| month    | integer | null: false, foreign_key: true |
| year     | integer | null: false, foreign_key: true |
| sec_cord | integer | null: false, foreign_key: true |

### Association
- has_many :addresses
- has_many :items
- belongs_to :user

＃＃addressesテーブル
| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| post_num  | integer | null: false, foreign_key: true |
| pref      | string  | null: false, foreign_key: true | pulldown
| city      | string  | null: false, foreign_key: true |
| house_num | string  | null: false, foreign_key: true |
| building  | string  | null: false, foreign_key: true |
| tel       | integer | null: false, foreign_key: true | pulldown

### Association

- belongs_to :credit_card
- belongs_to :user