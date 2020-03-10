class CreateGachas < ActiveRecord::Migration[5.2]
  def change
    create_table :gachas do |t|
      t.string :name
      t.string :key_name
      t.bigint :guild_id

      t.index :guild_id

      t.timestamps
    end
  end
end
