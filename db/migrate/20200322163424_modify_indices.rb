class ModifyIndices < ActiveRecord::Migration[5.2]
  def up
    remove_index :items, :gacha_id
    remove_index :gachas, :guild_id
    add_index :items, [:gacha_id, :name], unique: true
    add_index :gachas, [:guild_id, :key_name], unique: true
  end

  def down
    remove_index :gachas, [:guild_id, :key_name]
    remove_index :items, [:gacha_id, :name]
    add_index :gachas, :guild_id
    add_index :items, :gacha_id
  end
end
