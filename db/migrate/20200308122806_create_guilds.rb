class CreateGuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :guilds do |t|
      t.string :discord_id
      t.string :command_prefix
      t.integer :status, default: 0

      t.index :discord_id, unique: true

      t.timestamps
    end
  end
end
