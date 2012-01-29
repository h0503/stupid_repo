class AddPtypeToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :ptype, :string
  end

  def self.down
    remove_column :posts, :ptype
  end
end
