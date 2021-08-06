# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buys
- 

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null:false  |
| explanation        | text  | null:false  |
| category_id           | integer  | null:false  |
| status_id             | integer  | null:false  |
| load_id               | integer  | null:false  |
| area_id               | integer  | null:false  |
| day_id                | integer  | null:false  |
| price                 | integer  | null:false  |
| user   | references | null: false, foreign_key: true |
belongs_to :users
- has_one :buys

## buys テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| information        | integer | null:false  |
| deadline           | integer | null:false  |
| code               | integer | null:false  |
| post               | string | null:false  |
| prefectures        | string  | null:false  |
| city               | string  | null:false  |
| address            | string  | null:false  |
| building           | string  |             |
| telephone          | string | null:false  |

### Association

- belongs_to :users
- belongs_to :items

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |