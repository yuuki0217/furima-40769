# README

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password |        | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| date               | string | null: false |

### Association
- has_many :items
- has_many :order


## itemsテーブル
| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| product_name         | string     | null: false       |
| product_description  | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| shipping_fee_id      | integer    | null: false       | 
| shipping_origin_id   | integer    | null: false       |
| delivery_days_id     | integer    | null: false       |
| price                | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル
| Column          | Type       | Options           |
| ----------------| ---------- | ----------------- |
| buyer_id        | references | foreign_key: true | 
| purchase_record | datetime   | null: false       |
| devise          | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル
| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| delivery_address  | string     | null: false       |
| postal _code      | string     | null: false       |
| city_town_village | string     | null: false       |
| street_number     | string     | null: false       |
| building_name     | string     | 
| phone_number      | string     | null: false       |
| order             | references | foreign_key: true |

### Association
- belongs_to :order