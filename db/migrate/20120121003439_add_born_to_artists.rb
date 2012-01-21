class AddBornToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :born, :int
  end

  def self.down
    remove_column :artists, :born
  end
end
