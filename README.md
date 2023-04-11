# README

## アプリケーション名
BODY-MAKE(！！開発中！！)

## ※注意※
随時開発中なので、記載内容は変更されている可能性があります。

## アプリケーション概要（課題抽出と解決方法）
### 目的
かっこいい、美しい身体づくりをサポートする、文書、画像の投稿ができるTwitterのようなアプリケーション。  
既存のサービスであるTwitterやInstagram等は、不特定多数のユーザーが存在しており、  
身体づくりを楽しむ人たちにとって、意図に反したコメントやダイレクトメールが送られるといったことがある。  
身体づくりに特化したサービスを提供することで、ユーザーが安心してコミュニケーションをとれること、モチベーション維持の手助けを目的として作成した。

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

## 今後追加・改善した機能
・PFCバランス精度向上  
・レスポンシブデザイン化  
・エラーハンドリング  
・スクリプト攻撃対策など、セキュリティの見直し  
・可読性の向上  
・投稿画像のタグ付機能  
・お気に入りのユーザー登録機能（フォロー機能）  
・おすすめ動画機能  
・似た目的のユーザー表示機能  
・用語の検索機能（chatGPTの活用）  


## URL
https://body-make-app.onrender.com/

## テスト用アカウント等
●Basic認証  
    ・パスワード: 0000  
    ・ID: 0000  

●ユーザー情報1  
    ・ユーザー名    : TestUser1
    ・メールアドレス : test1@com
    ・パスワード    : test00

●ユーザー情報2  
    ・ユーザー名    : TestUser2
    ・メールアドレス : test2@com
    ・パスワード    : test00

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
| year_of_birth      | integer | null: false              |
| sex_id             | integer | null: false              |
| purpose_id         | integer | null: false              |
| target_date        | date    |                          |
| height             | float   | null: false              |
| target_weight      | float   |                          |
| target_fat         | float   |                          |
| activity_level_id  | integer | null: false              |
| publish_target_id  | integer | null: false              |
| publish_daily_id   | integer | null: false              |
| publish_height_id  | integer |                          |
| publish_tweet_id   | integer | null: false              |

#### Association
- has_many :tweets
- has_many :dailies
- has_many :comments
- has_many :reactions
- has_one_attached :image
- belongs_to :sex
- belongs_to :purpose
- belongs_to :activity_level
- belongs_to :publish_target
- belongs_to :publish_daily
- belongs_to :publish_height
- belongs_to :publish_tweet


### dailies テーブル
| Column    | Type       | Options                        |
| --------- | ---------- |------------------------------- |
| input_day | date       | null: false                    |
| weight    | float      | null: false                    |
| fat       | float      | null: false                    |
| user      | references | null: false, foreign_key: true |

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
| user       | references | null: false, foreign_key: true |
| tweet      | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :tweet


### tags テーブル(※未実装)
| Column | Type       | Options                      |
| ------ | ---------- | ---------------------------- |
| tag    | string     | null:false, uniqueness: true |

#### Association
- has_many :tweet_tag_relations
- has_many :tweet, through: :tweet_tag_relations