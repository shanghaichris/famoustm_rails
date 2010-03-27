class HomeController < ApplicationController
  
  window_title "Welcome"
  
  def index
    render :layout  => "home"
  end
  
  def about
    render :layout  => "application"
  end
end
