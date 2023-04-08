class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :user, foreign_key: true		
      t.references :tweet, foreign_key: true		
      t.timestamps
    end
  end
end
