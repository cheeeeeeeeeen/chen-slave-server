class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.bigint :guild_id
      t.string :feature_name
      t.string :action_name
      t.text :key_names

      t.index [:guild_id, :feature_name, :action_name], unique: true

      t.timestamps
    end
  end
end
