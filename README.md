# 🌞HINATAZAKA46 APPEARANCE INFOMATION
### 芸能人やアイドルなど（誰でも）の各媒体への出演情報を管理するアプリケーション
[![Image from Gyazo](https://i.gyazo.com/263b43fa47704d2610fb130a73ed2618.jpg)](https://gyazo.com/263b43fa47704d2610fb130a73ed2618)


# 📕概要
芸能人やアイドルや有名人などの出演情報をまとめることが出来るアプリケーションです。  
見本として日向坂46というアイドルの仕様にしています。  
グループ名、写真を変えるだけでお好きな仕様に変更が可能です。


# 🌏URL
http://18.181.58.188/


# 🖋テスト用アカウント
・ユーザー名　　やまだ  
・メール　　　　yamada@yamada  
・パスワード　　yamada1  
・認証名前　　　aihara  
・認証パス　　　051305130513


# 📖利用方法


# ✅目指した課題解決
## 課題
人は皆それぞれ好きな人やグループは違う。その種類も千差万別でメディアも多種多様。それぞれの出演情報を一括で管理出来たらとても便利
## 解決
シンプルなタイムライン形式で

# 📘機能一覧


# ⛏開発環境
・VScode  
・Ruby 2.6.5  
・Rails 6.0.3.4  
・mysql2 0.5.3  
・gem 3.0.3  
・EC2


# 🖇ローカルでの動作方法
% git clone https://github.com/M-Katayama-10/hinata.git  
% cd hinata  
% bundle install  
% rails db:create  
% rails db:migrate  
% rails s
### ⭐️http://localhost:3000


# 📋DB設計
## usersテーブル

| Column     | Type       | Options        |
| ---------- | ---------- | -------------- |
| email      | string     | null false     |
| password   | string     | null false     |
| name       | string     | null false     |
| member     | string     | null false     |
| history    | string     | null false     |

### Association
- has_many :tweets



## tweetsテーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| days       | date       | null false                    |
| member_id  | integer    | null false                    |
| program    | text       | null false                    |
| time       | text       |                               |
| supplement | text       |                               |
| user       | references | null false, foreign_key: true |

### Association
- belongs_to :user
