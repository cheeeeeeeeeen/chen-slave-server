class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :chance, default: 0
      t.bigint :gacha_id

      t.index :gacha_id

      t.timestamps
    end
  end
end
