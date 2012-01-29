class AddEntityIdToPostImages < ActiveRecord::Migration
  def self.up
    add_column :post_images, :entity_id, :string
  end

  def self.down
    remove_column :post_images, :entity_id
  end
end
