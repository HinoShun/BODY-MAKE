class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.date        :input_day, null: false
      t.float       :weight,    null: false
      t.float       :fat,       null: false
      t.references  :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
