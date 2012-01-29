class CreateEimages < ActiveRecord::Migration
  def self.up
    create_table :eimages do |t|
      t.integer :entity
      t.integer :entity_id
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :eimages
  end
end
