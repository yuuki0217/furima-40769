# README

## deviseテーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | string | null: false |

### Association
- has_many :items
- has_many :orders


## itemsテーブル
| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_description | text       | null: false       |
| category            | string     | null: false       |
| product_condition   | string     | null: false       |
| shipping_fee        | string     | null: false       | 
| shipping_origin     | string     | null: false       |
| delivery_days       | string     | null: false       |
| price               | integer    | null: false       |
| seller_id           | references | foreign_key: true |
| devise              | references | foreign_key: true |

### Association
- belongs_to :devise
- has_one :orders


## ordersテーブル
| Column          | Type       | Options           |
| ----------------| ---------- | ----------------- |
| buyer_id        | references | foreign_key: true | 
| purchase_record | datetime   | null: false       |
| devise          | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
- belongs_to :devise
- belongs_to :item
- has_many :shared


## sharedテーブル
| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| delivery_address  | string     | null: false       |
| postal _code      | string     | null: false       |
| prefecture        | string     | null: false       |
| city_town_village | string     | null: false       |
| street_number     | string     | null: false       |
| building_name     | string     | 
| phone_number      | string     | null: false       |
| order             | references | foreign_key: true |

### Association
- belongs_to :orders