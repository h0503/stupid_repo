class CreateCareers < ActiveRecord::Migration
  def self.up
    create_table :careers do |t|
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :careers
  end
end
