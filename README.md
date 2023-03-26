# README

## アプリケーション名
BODY-MAKE(！！開発中！！)

## ※注意※
現在開発中なので、記載内容は変更されている可能性があります。

## アプリケーション概要（課題抽出と解決方法）
### 目的
かっこいい、美しい身体づくりをサポートする、文書、画像の投稿ができるTwitterのようなアプリケーション。  
既存のサービスであるTwitterやInstagram等は、不特定多数のユーザーが存在しており、  
身体づくりを楽しむ人たちにとって、意図に反したコメントやダイレクトメールが送られるといったことがある。  
身体づくりに特化したサービスを提供することで、ユーザーが安心してコミュニケーションをとれることを目的として作成した。

### ペルソナ
10代〜40代の、より良い身体を目指す、普段からSNSを活用している男女  

### 課題と解決手法
1. SNSでは、日々の身体の写真や取り組んでいる内容を投稿できるが、
   身体が変化している実感が湧きにくく、モチベーションを保つのが難しい  
  →ユーザーのマイページにて、体重のデータをグラフで表示、及び
   過去の画像と最近の画像を表示することで視覚的に身体の変化をわかりやすくする
2. 過度な食事制限によるダイエットをしてしまい、不健康な身体になってしまう  
  →マイページにて、ユーザーデータとして身長、体重、体脂肪、目標の期日、体重を設定することで
   日々の摂取カロリーと、栄養素を提案する  
3. ユーザーの投稿内容に対し、ユーザーの目的（増量・減量・維持）を理解していないコメントがある  
  →ユーザーの目的を選択して表示することで、あらかじめ今何に取り組んでいるのかを表示できる

## 工夫した点・努力した点
1. データをグラフで表示する機能を独学で実装  
2. 登録されたデータを活用して視覚的に表現する機能を独学で実装  
3. 登録したデータを公表したくない場合に、非公開とする機能を実装  
4. CSSはテンプレートを使用せず、自分でレイアウトを考えて実装した  
5. 投稿に対するいいね機能を独学で実装  

## 実装した機能について
・ユーザー管理機能  
・ユーザー詳細画面から日々のデータを入力、グラフで表示する機能  
・ユーザー情報の公開、非公開を選択する機能  
・ユーザーのステータス（目的）を表示する機能  
・基礎代謝の表示機能  
・摂取カロリー（PFC）の提案機能  
・投稿機能、投稿一覧表示機能、投稿詳細表示機能  
・投稿に対するコメント、いいね機能  
  
※検討中  
・お気に入りのユーザー登録機能（フォロー機能）  
・おすすめ動画機能  
・似た目的のユーザー表示機能  
・ライブラリ（ダイエット用語）検索機能  


## URL

## テスト用アカウント等
●Basic認証  
    ・パスワード:   
    ・ID:   

●ユーザー情報  
    ・ユーザー名    :  
    ・メールアドレス :  
    ・パスワード    :  

## 利用方法

### 日々のデータ入力

### Twitterのような投稿

### 投稿に対するコメント・great!（いいね）ボタン


## 画面遷移図
[画面遷移図](https://raw.githubusercontent.com/HinoShun/BODY-MAKE/27877335983928620a5072f630542f04551c60be/screen_diagram.drawio.svg)


## ER図
[ER図](https://raw.githubusercontent.com/HinoShun/BODY-MAKE/27877335983928620a5072f630542f04551c60be/ER.drawio.svg)


## テーブル設計

### users テーブル
| Column             | Type    | Options                  |
| ------------------ | ------  |------------------------- |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| introduction       | string  |                          |
| status_id          | integer | null: false              |
| target_date        | date    |                          |
| height             | integer |                          |
| target_weight      | integer |                          |
| target_fat         | integer |                          |
| activity_level_id  | integer |                          |
| publish_target_id  | integer | null: false              |
| publish_daily_id   | integer | null: false              |
| publish_height_id  | integer | null: false              |
| publish_tweet_id   | integer | null: false              |

#### Association
- has_many :tweets
- has_many :dailies
- has_many :comments
- has_many :reactions
- has_one_attached :image




### dailies テーブル
| Column | Type       | Options                        |
| ------ | ---------- |------------------------------- |
| weight | integer    | null: false                    |
| fat    | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- has_one_attached :image




### tweets テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| tweet  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- has_many :tweet_tag_relations
- has_many :tags, through: :tweet_tag_relations
- has_one_attached :image




### tweet_tag_relations テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| tweet  | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

#### Association
- belongs_to :tweet
- belongs_to :tag





### tags テーブル
| Column | Type       | Options                      |
| ------ | ---------- | ---------------------------- |
| tag    | string     | null:false, uniqueness: true |

#### Association
- has_many :tweet_tag_relations
- has_many :tweet, through: :tweet_tag_relations





### comments テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| tweet      | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :tweet





### reactions テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| push_great | integer    |                                |
| user       | references | null: false, foreign_key: true |
| tweet      | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :tweet
