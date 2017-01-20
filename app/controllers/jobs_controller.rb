class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @boats_arr = Boat.all
  end

  def create
    @boats_arr = Boat.all
    @new_job = Job.create(
      name: params[:job][:name],
      description: params[:job][:description],
      origin: params[:job][:origin],
      destination: params[:job][:destination],
      cost: params[:job][:cost],
      containers_needed: params[:job][:containers_needed]
      )

      params[:boat][:boat_ids].each do |boat_id|
        @id = boat_id.to_i
        @new_job.boats << Boat.find(@id)
      end


    if @new_job
      redirect_to url_for(:controller => :jobs, :action => :index)
    else
      redirect_to url_for(:controller => :jobs, :action => :new)
    end


  end

  def show
    @job = Job.find(params[:id])
    @boats_assigned = @job.boats
    @boats = Boat.all
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update({
      name: params[:job][:name],
      description: params[:job][:description],
      origin: params[:job][:origin],
      destination: params[:job][:destination],
      cost: params[:job][:cost],
      containers_needed: params[:job][:containers_needed]
    })

    if (@job)
      redirect_to url_for(:controller => :jobs, :action => :index)
    else
      redirect_to url_for(:controller => :jobs, :action => :edit)
    end
  end

  def destroy
    Job.delete(params[:id])
    redirect_to url_for(:controller => :jobs, :action => :index)
  end




end
