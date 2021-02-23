## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| last_name[j]   | string  | null: false |
| family_name[j] | string  | null: false |
| last_name[k]   | string  | null: false |
| family_name[k] | string  | null: false |
| birth_year     | integer | null: false |
| birth_month    | integer | null: false |
| birth_day      | integer | null: false |
<!-- [j]は漢字、[k]はカタカナを意味する -->

### Association

- has_many  :item_displays
- has_many  :comments
- belong_to :ship_address



## comments テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| text            | text      | null: false                    |
| user_id         | reference | null: false, foreign_key: true |
| item_display_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item_display 



## item_displays テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| image        | string    | null: false                    |
| item_name    | string    | null: false                    |
| item_explain | text      | null: false                    |
| ship_burden  | string    | null: false                    |
| ship_source  | string    | null: false                    |
| ship_date    | integer   | null: false                    |
| item_price   | integer   | null: false                    |
| user_id      | reference | null: false, foreign_key: true |
| comment_id   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :item_purchase
- has_many   :details, through: :item_display_details
- has_many   :item_display_details



## details テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| category        | text      | null: false                    |
| status          | text      | null: false                    |
| item_display_id | reference | null: false, foreign_key: true |

### Association

- has_many :items_displays
- has_many :item_display_details, through: :item_display_details


## item_display_details テーブル
| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| detail_id       | reference | null: false, foreign_key: true |
| item_display_id | reference | null: false, foreign_key: true |

### Association

- belong_to :items_display
- belong_to :detail



## item_purchases テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| number_card      | integer   | null: false                    |
| expiration_month | integer   | null: false                    |
| expiration_year  | integer   | null: false                    |
| item_display_id  | reference | null: false, foreign_key: true |

### Association

- belong_to :item_display
- has_one   :ship_addres



## ship_addreses テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| postal_code      | integer   | null: false                    |
| region           | string    | null: false                    |
| city             | string    | null: false                    |
| street           | string    | null: false                    |
| building_name    | string    |                                |
| item_parchase_id | reference | null: false, foreign_key: true |
| user_id          | reference | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_tp :item_purchase

