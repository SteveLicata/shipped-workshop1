class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
  end

  def create
    @new_boat = Boat.create(
      name: params[:boat][:name],
      maxcontainers: params[:boat][:maxcontainers],
      company_id: params[:boat][:company_id],
      location: params[:boat][:location],
      image: params[:boat][:image]
    )

    if @new_boat
      redirect_to url_for(:controller => :boats, :action => :index)
    else
      redirect_to url_for(:controller => :boats, :action => :new)
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @boat_company = @boat.company.email

    if session[:boat_id] # if logged in
      @message = "You're now logged in! This is your profile page."
    else
      @message = "You're not logged in yet"
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update({
      name: params[:boat][:name],
      maxcontainers: params[:boat][:maxcontainers],
      company_id: params[:boat][:company_id],
      location: params[:boat][:location],
      image: params[:boat][:image]
    })

    if (@boat)
      redirect_to url_for(:controller => :boats, :action => :index)
    else
      redirect_to url_for(:controller => :boats, :action => :edit)
    end
  end

  def destroy
    Boat.delete(params[:id])
    redirect_to url_for(:controller => :boats, :action => :index)
  end


end
