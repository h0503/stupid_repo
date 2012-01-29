class AddPtypeToPostImage < ActiveRecord::Migration
  def self.up
    add_column :post_images, :ptype, :integer
  end

  def self.down
    remove_column :post_images, :ptype
  end
end
