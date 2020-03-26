class AddCommandPrefixDefault < ActiveRecord::Migration[5.2]
  def up
    change_column_default :guilds, :command_prefix, '!'
  end

  def down
    change_column_default :guilds, :command_prefix, nil
  end
end
