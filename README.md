# 🌞HINATAZAKA46 APPEARANCE INFOMATION
### 芸能人やアイドルなど（誰でも）の各媒体への出演情報を管理するアプリケーション
[![Image from Gyazo](https://i.gyazo.com/263b43fa47704d2610fb130a73ed2618.jpg)](https://gyazo.com/263b43fa47704d2610fb130a73ed2618)

<br>
<br>

# 📕概要
芸能人やアイドルや有名人などの出演情報をまとめることが出来るアプリケーションです。  
見本として日向坂46というアイドルの仕様にしています。  
グループ名、写真を変えるだけでお好きな仕様に変更が可能です。

<br>
<br>

# 🌏URL
http://18.181.58.188/

<br>
<br>

# 🖋テスト用アカウント
・ユーザー名　　やまだ  
・メール　　　　yamada@yamada  
・パスワード　　yamada1  
・認証名前　　　aihara  
・認証パス　　　051305130513

<br>
<br>

# 📖利用方法

<br>
<br>

# ✅目指した課題解決
## 課題
人は皆それぞれ好きな人やグループは違います。その種類も千差万別でメディアも多種多様です。それぞれの出演情報を一括で管理出来たらとても便利だと思いました。
## 解決
タイムライン形式で出演情報を一覧表示し、またその個々のメンバーの出演情報を各メンバーの詳細ページにそれぞれ表示することで、シンプルかつ見やすくしました。

<br>
<br>

# 📘機能一覧
| 機能　　　　　　　　　　 | 概要　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　 |  
| :--------------------|:---------------------------------------------------------- |  
| ユーザー管理機能　　　　 | 新規登録・ログイン・ログアウト　　　　　　　　　　　　　　　　　　　　 |  
| ユーザー詳細表示機能　　 | 各ユーザーのプロフィール　　　　　　　　　　　　　　　　　　　　　　　 |  
| ユーザー情報編集機能　　 | ログイン中のユーザーでアカウント本人であればプロフィール編集が可能　　 |  
| 投稿機能　　　　　　　　 | 出演情報の投稿　　　　　　　　　　　　　　　　　　　　　　　　　　　　 |  
| 投稿詳細表示機能　　　　 | 各投稿詳細を詳細ページで閲覧　　　　　　　　　　　　　　　　　　　　　 |  
| 投稿編集・削除機能　　　 | 編集はログインユーザー、削除は投稿者のみ可能　　　　　　　　　　　　　 |  
| 検索機能　　　　　　　　 | 検索フォームか番組名の検索が可能　　　　　　　　　　　　　　　　　　　 |  

<br>
<br>

# ⛏開発環境
・VScode  
・Ruby 2.6.5  
・Rails 6.0.3.4  
・mysql2 0.5.3  
・gem 3.0.3  
・EC2

<br>
<br>

# 🖇ローカルでの動作方法
% git clone https://github.com/M-Katayama-10/hinata.git  
% cd hinata  
% bundle install  
% rails db:create  
% rails db:migrate  
% rails s
### ⭐️http://localhost:3000

<br>
<br>

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

<br>
<br>

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
