class NuevosCamposToStages < ActiveRecord::Migration
  def up
    add_column :stages, :ticket_type, :string
    add_column :stages, :ticket_price, :string
    add_column :stages, :limited_seats, :string
    add_column :stages, :image, :string
    add_column :stages, :live, :datetime
    add_column :stages, :design, :string
  end

  def down
  end
end
