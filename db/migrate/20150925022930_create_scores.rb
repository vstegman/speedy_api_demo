class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value, limit: 8
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
