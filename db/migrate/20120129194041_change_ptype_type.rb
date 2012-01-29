class ChangePtypeType < ActiveRecord::Migration
  def self.up
    change_column :post_images, :ptype, :string
  end

  def self.down
  end
end
