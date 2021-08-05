# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null:false  |
| explanation        | text  | null:false  |
| category           | string  | null:false  |
| status             | string  | null:false  |
| load               | string  | null:false  |
| area               | string  | null:false  |
| day                | date    | null:false  |
| price              | integer | null:false  |

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




