# app/controller/supports_controller.rb
class SupportsController < ApplicationController

  def index
	@support = Support.new(:id=>1)
  end

  def new
    # id is required to deal with form
    @support=Support.new(:id => 1)
  end
 
  def create
  	@support=Support.new(:id=>1)
    @support = Support.new(params[:support])
    if @support.save
      redirect_to('/', :notice => "Support was successfully sent.")
    else
       respond_to do |format|
 format.html { 
      flash[:notice] = 'Tv show was successfully created.'
      redirect_to('/', :notice => "Support was successfully sent.")
    }
  end
      flash[:notice] = "You must fill all fields."
      #render 'new'
      #redirect_to('/', :notice => "Please fill out all fields.")
    end
  end

end
