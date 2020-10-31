#テーブル設計

＃＃usersテーブル
| Column             | Type    | Options     |
| --------------     | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_jap     | string  | null: false |
| last_name_jap      | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :information
- belongs_to :address

＃＃itemsテーブル
| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      | integer | null: false |
| item_name    | string  | null: false |
| detail       | text    | null: false |
| category_id  | integer | null: false | pulldown
| condition_id | integer | null: false | pulldown
| ship_cost_id | integer | null: false | pulldown
| ship_pref_id | integer | null: false | pulldown
| ship_day_id  | integer | null: false | pulldown
| price        | integer | null: false |

### Association

- belongs_to :user

＃＃addressesテーブル
| Column    | Type    | Options     |
| --------- | ------- | ------------|
| user_id   | integer | null: false |
| post_num  | integer | null: false |
| pref_id   | string  | null: false | pulldown
| city      | string  | null: false |
| house_num | string  | null: false |
| building  | string  |             |
| tel       | string  | null: false |

### Association

- belongs_to :user

＃＃informationテーブル
| Column  | Type    | Options     |
| ------- | ------- | ------------|
| date    | date    | null: false |
| item_id | integer | null: false |
| user_id | string  | null: false |


### Association

- belongs_to :user
- has_one :item