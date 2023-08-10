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

## アプリケーション名
CAR SCH

## アプリケーション概要
車関連に特化したカレンダー

## URL
https://car-sch.onrender.com

## 洗い出した要件
https://docs.google.com/document/d/1scBKBNW75nYYJ4hY-fMdPltl5DvpJezRzgGWNsI_fdk/edit#heading=h.2vrpmk5apt5