class CreatePostImages < ActiveRecord::Migration
  def self.up
    create_table :post_images do |t|
      t.string :name
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :post_images
  end
end
