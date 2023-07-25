# DB設計
## usersテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| name | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association
- has_many :blogs

## blogssテーブル
| Column | Type | Option |
|-|-|-|
| id(PK) | integer | null: false |
| title | string | null: false |
| content | text | 
| price | integer | 
| start_time | datetime | 
| user(FK) | references | null: false, foreign_key: true |

### Association
- belongs_to :user

