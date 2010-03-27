class TrademarksController < ApplicationController
  before_filter :authenticate_user! , :except => [:index,:show,:search]
  before_filter :get_category
  before_filter :get_trademark
  def index
  end
  
  def new
    @title = "Add New Famous Trademark"
    window_title = @title
    @trademark = Trademark.new
  end
  
  def create
    if checked                                                     #if checked means no duplicated trademark happens
      @trademark = Trademark.new(params[:trademark])
      @trademark.category = @category
      if @trademark.save
        flash[:notice] = "New trademark: #{@trademark.name} is added successfully."
        redirect_to [@category,@trademark]
      else
        flash[:alert] = "Failed to add new trademark #{@trademark.name}"
        render :action => :new
      end
    else
      flash[:alert] = "Duplicated trademark is happened."
      render :action => :new
    end
  end
  
  def last_updated
    @trademarks = Trademark.get_lastest(50)
  end
  
  def edit
    
  end
  
  def update
    if  @trademark.update_attributes(params[:trademark])
      flash[:notice] = " Trademark: #{@trademark.name} is updated."
      redirect_to [@category,@trademark]
    else
      flash[:alert] = "Duplicated trademark is happened."
      render :action => :edit
    end
    
  end
  
  def show
    @categories = Category.all_categories
    if @category.nil?
      @category = @trademark.ctegory
    end
    respond_to do |wants|
      wants.html {window_title = @trademark.name}
    end
    
  end
  
  def destroy
    name = @trademark.name
    if @trademark.destroy
      flash[:notice] = "#{name} is deleted."
      redirect_to category_path(@category)
    else
      flash[:alert] = "Delete trademark failed!"
      redirect_to [@category,@trademark]
    end
  end
  
  def search
    query = params[:q]
    @trademarks = Trademark.search(query)
    
  end
  
  
  private
    def get_category
      return @category = nil if params[:category_id].nil?
       @category = Category.find_category(params[:category_id])
    end
  
    def get_trademark
      return @trademark = nil if params[:id].nil?
      @trademark = Trademark.find_tradmark(params[:id])
    end
    
    def checked
      return true if Trademark.check_duplicated(params[:trademark][:reg_number])
      return false
    end
  
end
