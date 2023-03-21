# README

## アプリケーション名
BODY-MAKE

## アプリケーション概要
かっこいい、美しい身体づくりをサポートするアプリケーション。  
ユーザー専用ページで日々の身体の変化を記録・表示したり、  
投稿機能によりユーザー同士でコミュニケーションをとったりすることで、  
モチベーション向上、維持を目的とする。

## URL

## テスト用アカウント等
●Basic認証  
    ・パスワード: 0000  
    ・ID: 0000  

●ユーザー情報  
    ・ユーザー名    :  
    ・メールアドレス :  
    ・パスワード    :  

## 利用方法

### 日々のデータ入力

### Twitterのような投稿

### 投稿に対するコメント・great!（いいね）ボタン


## アプリケーションを作成した背景
既存のサービスであるTwitterやInstagram等は、不特定多数のユーザーが存在しており、  
身体づくりを楽しむ人たちにとって、意図に反したコメントやダイレクトメールが送られるといったことがある。  
身体づくりに特化したサービスを提供することで、ユーザーが安心してコミュニケーションをとれることを目的として作成した。


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

## 画面遷移図


## ER図


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
