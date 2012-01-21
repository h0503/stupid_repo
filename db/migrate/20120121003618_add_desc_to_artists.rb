class AddDescToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :desc, :text
  end

  def self.down
    remove_column :artists, :desc
  end
end
