# README

# アプリケーション名
addtaskii
# URL
 https://addtaskii.herokuapp.com/


# 利用方法
# 1.目標の設定
・ユーザー登録画面からユーザー新規登録もしくはログインする。（ユーザー未登録でも他ユーザーの目標一覧の閲覧は可能。）
・set a goalボタンから目標を設定（タイトル、期限日）する。
・マイページにて自分の目標の一覧管理可能。

# 2.タスクの設定
・その目標を達成するために障壁となる課題（タスク）を設定
・目標が達成できたらAchieved!ボタンをクリック
・ヘッダーの検索機能から、自分と似た目標課題を検索し、他ユーザーの目標に対するタスクの考え方を確認できる。

# 3.他ユーザーを励ます
・各目標にあるwe can do itをクリックして他のユーザーを応援
・our goals画面にて、他ユーザーの目標一覧を表示
・we can do itボタンより他のユーザーを応援

# アプリケーションを開発した背景
　前職ではエンドユーザーの抱える問題解決をすることを主軸として業務に励んだ。
　そこで、解決したい事柄や達成したい目標に対してどのように思考するかを考える機会が多くあった。

　何か解決したい事柄や目標がある時、それらを達成するためには具体的にどのような障壁が発生するのか、
それらを達成するための条件（タスク）を具体的に考え、言語化をする必要があると考える。

　その条件を全てクリアすることで達成できる条件ベースでの目標設定を手助けし、楽しく、モチベーションが上がるような
アプリケーションを開発することにした。

# 『addtaskii』
・使い方はシンプルで、目標に対してのtaskをサクサクadd!していきます。

・addtaskiiのiiは複数人という意味合いを込めました。


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1d23P1VJI77z0I1MjthOvfvsaufuPnrINVdb5oIqy0wQ/edit#gid=982722306


# 実装した機能についての画像及び概要
・トップページ（アプリケーション説明画面）
<img width="1440" alt="スクリーンショット 2022-06-13 15 28 45" src="https://user-images.githubusercontent.com/103736298/173292817-a289a80b-1ddc-4c68-acc4-bd4ad38d84f0.png">


・マイページにて自分の目標一覧
<img width="1437" alt="スクリーンショット 2022-06-13 15 55 03" src="https://user-images.githubusercontent.com/103736298/173296660-b5951fcd-741d-41dc-9e64-ce766ecbc594.png">

・our goalsページにて他ユーザーの目標一覧
<img width="1434" alt="スクリーンショット 2022-06-13 16 12 25" src="https://user-images.githubusercontent.com/103736298/173299206-f8a6413b-1a97-4b35-968a-1c02030c42f1.png">



# 実装予定の機能
# ①ルーム作成機能の実装。
　関係性をもつユーザー同士（チーム）で自分のタスクをシェアできる。

※知人に使用してもらった結果、『目標やタスクは仲間内でシェアし合いたい』とのフィードバックがあったため、ルーム作成機能も追加実装予定です。

# ②目標とタスクの管理状況の見える化
　マイページにおいて現在の自分の目標とタスク状況が管理しやすいように各々の集計を表示。
　これまでの実績の数値も表示。　


# データベース設計
https://gyazo.com/183d90f75145dd4b22d34af6d01f99f1

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true|
| level              | string | null: false |
| encrypted_password | string | null: false |
### Association
- has_many :missions, dependent: :destroy
- has_many :favorites, dependent: :destroy


## missionsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| mission            | string | null: false |
| startdate          | integer| null: false |
| limitdate          | integer| null: false |
| user_id            |references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many :tasks, dependent: :destroy
- has_many :favorites, dependent: :destroy

## tasksテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| task               | string | null: false |
| mission_id         |references | null: false, foreign_key: true |
### Association
- belongs_to :mission

## favotitesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| mission_id         |references | null: false, foreign_key: true |
| user_id            |references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :mission



# 画面遷移図
<img width="642" alt="スクリーンショット 2022-06-13 17 00 05" src="https://user-images.githubusercontent.com/103736298/173307306-a1e4ab39-dcc8-44ff-9835-5dc88fa49546.png">


# 開発環境
HTML, CSS, JavaScript, Ruby, Ruby On Rails, vscode

# ローカルでの動作方法
以下のコマンドを順に実行。
% git clone https://github.com/taishi0502/addtaskii
% cd addtaskii
% bundle install
% yarn install

# 工夫したポイント
# ①『目標を達成するためのタスク設定を促すこと』
 『目標を設定するだけでは達成に至らない可能性がある』という意識を持たせる。

　目標や解決したい事柄を達成するためには、ユーザー自身が達成のための条件を具体的に考え行動に移すことが重要になる。

　そのため、目標や解決したい事柄を記録するだけではなく、目標達成（課題解決など）において、何が障壁となるのか、
目標達成のためのタスクを自らで考え、言語化させるような表現を実装したく、タスク未設定の目標については警告を出すよう
実装した。

# ②『設定した目標は他ユーザーからも見られる』
　設定した目標や解決したい事柄とそのタスクについては、目標一覧ページに表示される。
　公の場所で言ってしまった以上行動に移せざるを得ないような心理状況にしてもらう。

　また、検索機能も実装したため、自分の目標や解決したい事柄に対するタスク設定で、
他ユーザーのタスク設定を参考にできる。

# ③『we can do it機能の実装』
　他ユーザーの目標設定に対して、いいね機能のようなwe can do it機能を実装。
本来、目標管理は自分だけで行うが、周りに味方は多数いることを自覚させる。
　他ユーザーに対しての応援だが、we can do itとすると、自分に対しての喝の意味合いも込めている。

# ④『アプリケーション上の表現の仕方』
　目標一覧ページはour goals、応援機能はwe can do itとし、本来自分主体である課題解決型サービスだが、
『私たち』で取り組んでいるような表現とした。
　ユーザーの目標達成においてモチベーション向上に繋がると考える。

# ⑤『ユーザーレベル機能の実装』
　目標達成数に応じて、自身のレベルが上がっていく機能を実装した。
目標達成する度に、成長している実感を持ち自己肯定感の向上に繋がると考える。
