class AddNameToArtpieces < ActiveRecord::Migration
  def self.up
    add_column :artpieces, :name, :string
  end

  def self.down
    remove_column :artpieces, :name
  end
end
