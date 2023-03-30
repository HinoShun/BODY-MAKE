class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.integer     :weight,  null: false
      t.integer     :fat,     null: false
      t.references  :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
