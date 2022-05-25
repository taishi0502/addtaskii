# README

# アプリケーション名
meta helper
# URL

# テスト用アカウント
・Basic認証パスワード
・Basic認証ID
・メールアドレス
・パスワード
# 利用方法
・ユーザー新規登録画面からユーザー登録を行う
・課題設定ボタンから課題を設定する
　（課題の内容、期限は後で編集可能）
・課題が設定できたら、その課題を達成するために障壁となるタスクを設定する
　（タスクは後で編集可能）
・課題が達成できたら達成をクリック

# アプリケーションを開発した背景
　自分が普段生活をしていると、様々な課題(学習を集中継続できない時がある、朝早起きできない時があるなど)に直面することが多い。その課題を解決する為には、解決するための課題(障壁)を自らで思考し言語化、記録をするプロセスそのものは、その課題を解決できる行動の内の一つであると考える。
　同様の問題を抱えている方もいると推測し、その課題を解決する為の障壁を言語化するお手伝いをするアプリケーションを開発することにした。
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1d23P1VJI77z0I1MjthOvfvsaufuPnrINVdb5oIqy0wQ/edit#gid=982722306


# 実装した機能についての画像やGIF及びその他の説明


# 実装予定の機能

# データベース設計
https://gyazo.com/ed20691971712b3b05752a0e8863a7fe

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
### Association
- has_many :missions
 belongs_to :count


## missionsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| mission            | string | null: false |
| limit              | integer| null: false |
| user               |references | null: false, foreign_key: true |
### Association
belongs_to :user
has_many :tasks


## tasksテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| task               | string | null: false |
| mission          |references | null: false, foreign_key: true |

### Association
belongs_to :mission

## countsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|  count             | integer | null: false|
| user               |references | null: false, foreign_key: true |

### Association
belongs_to :user





# 画面遷移図
https://gyazo.com/dfd2698feaa78592b7cb4d819fc42247


# 開発環境

# ローカルでの動作方法

# 工夫したポイント

