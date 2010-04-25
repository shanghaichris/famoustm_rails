class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.text :description
      t.text :intro
      t.string :services_type
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
