class OrderController < ApplicationController

  def view
    render :status => :not_found, :json => nil
  end

  def register
    render :status => :created, :json => { :id => params[:id] }
  end
end
