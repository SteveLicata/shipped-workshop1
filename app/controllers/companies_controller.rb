class CompaniesController < ApplicationController

  before_action :authenticate_user!


  def show
    @company = Company.find(params[:id])
    @company_boats = @company.boats
  end

end
