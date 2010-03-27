class Category < ActiveRecord::Base
  has_many :trademarks
  
  def self.all_categories
    @categories = Category.order("id").includes(:trademarks)
  end
  
  def self.find_category(id)
    Category.find(id)
  end
  
end
