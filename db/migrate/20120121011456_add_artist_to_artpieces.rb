class AddArtistToArtpieces < ActiveRecord::Migration
  def self.up
    add_column :artpieces, :artist_id, :int
  end

  def self.down
    remove_column :artpieces, :artist_id
  end
end
