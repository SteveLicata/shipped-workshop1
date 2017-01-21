class CompaniesController < ApplicationController
# authenticate before diSplying company info
  before_action :authenticate_company!

#displays company and boat info on company show
  def show
    @company = Company.find(params[:id])
    @company_boats = @company.boats
  end

end
