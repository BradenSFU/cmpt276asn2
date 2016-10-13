class CreateTokimons < ActiveRecord::Migration[5.0]
  def change
    create_table :tokimons do |t|
      t.string :tname
      t.integer :trainer_id
      t.integer :weight
      t.integer :height
      t.string :elementtype
      t.integer :fly
      t.integer :fight
      t.integer :fire
      t.integer :water
      t.integer :electric
      t.integer :ice
      t.integer :total

      t.timestamps
    end
  end
end
