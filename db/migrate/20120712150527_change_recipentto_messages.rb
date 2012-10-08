class ChangeRecipenttoMessages < ActiveRecord::Migration
  def up
      change_column :messages, :recipient, :string
  end

  def down
  end
end
