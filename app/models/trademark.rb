class Trademark < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>",:tiny => "50x50#" }
  belongs_to :category
  
  def self.all_trademarks
    @trademarks = Trademark.order("id")
    
  end
  
  def self.find_tradmark(id)
    @trademarks = Trademark.find(id)
  end
  
  def self.check_duplicated(reg_number)
    @trademarks = Trademark.find_by_reg_number(reg_number)
    return true if @trademarks.nil?
    return false
  end
  
  def self.get_lastest(number)
    @trademarks = Trademark.order("id DESC").limit(number)
  end
  
  def self.search(q)
    @trademarks = Trademark.where(["name like ? ","%#{q}%"])
  end
end
