class CreatePtypes < ActiveRecord::Migration
  def self.up
    create_table :ptypes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ptypes
  end
end
