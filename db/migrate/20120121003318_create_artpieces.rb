class CreateArtpieces < ActiveRecord::Migration
  def self.up
    create_table :artpieces do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :artpieces
  end
end
