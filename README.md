## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name_j        | string  | null: false               |
| family_name_j      | string  | null: false               |
| last_name_k        | string  | null: false               |
| family_name_k      | string  | null: false               |
| birthday           | date    | null: false               |
<!-- _jは漢字、_kはカタカナを意味する -->

### Association

- has_many  :item_displays
- has_many  :comments
- has_many  :item_parchases



## comments テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| text            | text      | null: false                    |
| user            | reference | null: false, foreign_key: true |
| item_display    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item_display 



## item_displays テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| item_name      | string    | null: false                    |
| item_explain   | text      | null: false                    |
| ship_burden_id | integer   | null: false                    |
| ship_source_id | integer   | null: false                    |
| ship_date_id   | integer   | null: false                    |
| item_price     | integer   | null: false                    |
| user           | reference | null: false, foreign_key: true |
| comment        | reference | null: false, foreign_key: true |
| category       | string    | null: false                    |
| status         | string    | null: false                    |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :item_purchase



## item_purchases テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| item_display     | reference | null: false, foreign_key: true |
| user             | reference | null: false, foreign_key: true |

### Association

- belongs_to :item_display
- has_one    :ship_addres
- belongs_to :user




## ship_addreses テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| postal_code      | string    | null: false                    |
| ship_source_id   | integer   | null: false                    |
| city             | string    | null: false                    |
| street           | string    | null: false                    |
| building_name    | string    |                                |
| item_parchase    | reference | null: false, foreign_key: true |
| phone_number     | integer   | null: false                    |

### Association

- belongs_to :item_purchase

