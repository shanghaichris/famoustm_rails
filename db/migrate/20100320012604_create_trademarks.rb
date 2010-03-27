class CreateTrademarks < ActiveRecord::Migration
  def self.up
    create_table :trademarks do |t|
      t.string :name
      t.text   :description
      t.string :reg_number
      t.date   :reg_date
      t.string :reg_item
      t.string :reg_company_cn
      t.string :reg_company_en
      t.references :category
      t.timestamps
    end
  end

  def self.down
    drop_table :trademarks
  end
end
