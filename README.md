# README
# テーブル設計

## users テーブル

| Column                | Type   | Options     |
|-----------------------|--------|-------------|
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birth_date_1i         | date   | null:false  |
| birth_date_2i         | date   | null:false  |
| birth_date_3i         | date   | null:false  |
### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_one    : order
- belongs_to : user

## ordersテーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :pay_form

## pay_forms

|Column        |Type        |Options                         |
|--------------|------------|--------------------------------|
| number       | integer    | null: false                    |
| exp_month    | date       | null: false                    |
| exp_year     | date       | null: false                    |
| cvc          | integer    | null: false                    |
| postal_code  | integer    | null: false                    |
| city         | string     | null: false                    | 
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
- belongs_to :order

