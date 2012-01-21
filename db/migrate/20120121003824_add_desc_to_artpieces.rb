class AddDescToArtpieces < ActiveRecord::Migration
  def self.up
    add_column :artpieces, :year, :int
    add_column :artpieces, :desc, :text
  end

  def self.down
    remove_column :artpieces, :desc
    remove_column :artpieces, :year
  end
end
