class CategoriesController < ApplicationController
  before_filter :authenticate_user! , :except => [:index,:show,:all_categories]
  before_filter :get_category,:only => [:edit,:update,:destroy,:show,:index,:all_categories]
  
  window_title "Category"
  def index
    
    @trademarks = Trademark.all_trademarks
  end
  
  def new
    @title = "Create a new category"
    window_title = @title
    @category = Category.new
    
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category:#{@category.name} is created successfully."
      redirect_to category_path(@category) 
    end
  end
  
  def edit
    @title = "Edit category"
    window_title = @title
    
  end
  
  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Update Successfully."
      redirect_to category_path(@category)
    else
      flash[:alert] = "Update failed!"
      render :action => :edit
    end
  end
  
  def destroy
    if @category.destroy
      flash[:notice] = "Deleted OK."
      redirect_to categories_path
    else
      flash[:alert] = "Delete failed"
      redirect_to category_path(@category)
    end
  end
  
  def show
    window_title = @category.name
    @trademarks = @category.trademarks
  end
  
  def all_categories
    
    render :update do |page|
      
      page.replace "tm_list",:partial => "shared/category_list"
    end
  end
  
  private
    def get_category
      @categories = Category.all_categories
      @category = Category.find_category(params[:id]) if params[:id]
    end
  
end
