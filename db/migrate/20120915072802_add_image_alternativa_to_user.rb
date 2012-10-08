class AddImageAlternativaToUser < ActiveRecord::Migration
  def change
	add_column :users, :image_fb, :string
  end
end
