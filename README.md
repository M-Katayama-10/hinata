### DB設計
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
