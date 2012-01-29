class RenamePtypeInPosts < ActiveRecord::Migration
  def self.up
	change_column :posts, :ptype, :ptype_id
  end

  def self.down
  end
end
