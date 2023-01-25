
# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false,unique: true      |
| encrypted_password | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthday           | date   | null: false                   |

### Association
has_many:items
has_many:buyers


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | string     | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| days               | date       | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| buyer_id           | references | null: false, foreign_key: true |

### Association

belongs_to:users
has_one:buyers
has_many:images

## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user_id            | string     | null: false, foreign_key: true |
| item_id            | string     | null: false, foreign_key: true |

### Association

belongs_to:users
belongs_to:items

## images テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| items_id           | string     | null: false                    |

### Association

belongs_to:items