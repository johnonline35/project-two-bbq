class GrillsController < ApplicationController
  before_action :check_for_login

  def index
    # @grills = Grill.where 'location ILIKE ? AND price_per_hour <= ?' , params[:location], params[:price_per_hour]
    
  end

  def new
    @grill = Grill.new
  end

  def show
    @grill = Grill.find params[:id]
  end

  def create
    grill = Grill.create grill_params
    @current_user.grills << grill # add grill to current user
    redirect_to root_path # IRL redirect_to grill
  end

  def edit
    @grill = Grill.find params[:id]
  end

  def update
  grill = Grill.find params[:id]
  grill.update grill_params
  redirect_to grill
  end

  def destroy
    grill = Grill.find params[:id]
    grill.destroy
    redirect_to grills_path
  end

  def results
  end

  private
  def grill_params
    params.require(:grill).permit(:name, :location, :image, :price_per_hour)
  end
end