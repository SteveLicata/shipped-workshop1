class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
      @boats = Boat.all
      @boat = Boat.new
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
    @company_boats = @boat.company.email


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
