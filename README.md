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
[画面遷移図](<div class="mxgraph" style="max-width:100%;border:1px solid transparent;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers tags lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile&gt;&lt;diagram id=\&quot;vKAV30V63_ZvqKwf8GPQ\&quot; name=\&quot;ページ1\&quot;&gt;&lt;mxGraphModel dx=\&quot;2820\&quot; dy=\&quot;2109\&quot; grid=\&quot;1\&quot; gridSize=\&quot;10\&quot; guides=\&quot;1\&quot; tooltips=\&quot;1\&quot; connect=\&quot;1\&quot; arrows=\&quot;1\&quot; fold=\&quot;1\&quot; page=\&quot;1\&quot; pageScale=\&quot;1\&quot; pageWidth=\&quot;1169\&quot; pageHeight=\&quot;827\&quot; math=\&quot;0\&quot; shadow=\&quot;0\&quot;&gt;&lt;root&gt;&lt;mxCell id=\&quot;0\&quot;/&gt;&lt;mxCell id=\&quot;1\&quot; parent=\&quot;0\&quot;/&gt;&lt;mxCell id=\&quot;2\&quot; value=\&quot;TOP\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;40\&quot; y=\&quot;40\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;3\&quot; value=\&quot;ユーザー新規登録\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;320\&quot; y=\&quot;40\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;4\&quot; value=\&quot;ユーザーログイン&amp;lt;span style=&amp;quot;color: rgba(0, 0, 0, 0); font-family: monospace; font-size: 0px; text-align: start;&amp;quot;&amp;gt;%3CmxGraphModel%3E%3Croot%3E%3CmxCell%20id%3D%220%22%2F%3E%3CmxCell%20id%3D%221%22%20parent%3D%220%22%2F%3E%3CmxCell%20id%3D%222%22%20value%3D%22%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E7%99%BB%E9%8C%B2%22%20style%3D%22rounded%3D1%3BwhiteSpace%3Dwrap%3Bhtml%3D1%3B%22%20vertex%3D%221%22%20parent%3D%221%22%3E%3CmxGeometry%20x%3D%22320%22%20y%3D%2280%22%20width%3D%22200%22%20height%3D%2240%22%20as%3D%22geometry%22%2F%3E%3C%2FmxCell%3E%3C%2Froot%3E%3C%2FmxGraphModel%3E&amp;lt;/span&amp;gt;\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;320\&quot; y=\&quot;160\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;5\&quot; value=\&quot;ユーザー詳細&amp;lt;br&amp;gt;\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;320\&quot; y=\&quot;280\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;6\&quot; value=\&quot;投稿画面\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;320\&quot; y=\&quot;520\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;7\&quot; value=\&quot;データ登録\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;320\&quot; y=\&quot;400\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;mxCell id=\&quot;8\&quot; value=\&quot;投稿詳細\&quot; style=\&quot;rounded=1;whiteSpace=wrap;html=1;\&quot; vertex=\&quot;1\&quot; parent=\&quot;1\&quot;&gt;&lt;mxGeometry x=\&quot;320\&quot; y=\&quot;640\&quot; width=\&quot;200\&quot; height=\&quot;80\&quot; as=\&quot;geometry\&quot;/&gt;&lt;/mxCell&gt;&lt;/root&gt;&lt;/mxGraphModel&gt;&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js"></script>)

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
