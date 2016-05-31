class HousesController < ApplicationController
  before_action :seller
  before_action :house, only: [:show, :edit, :update, :destroy]

  def index
  	@houses = House.all
  end

  def show
  end

  def new
  	@house = House.new
  end

  def create
  	#TODO resolve the conflict that happens here
  	@house = @seller.houses.new(house_params)
  	if @house.save
  		redirect_to seller_house_path(@seller, @house)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @house.update(house_params)
  		redirect_to seller_house_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@house.destroy
  	redirect_to seller_house_path(@seller)
  end

  private

  	def house_params
  		params.require(:house).permit(:size, :year_built, :bed, :bath)
  	end

  	def house
  		@house = @seller.houses.find(params[:id])
  	end

  	def seller
  		@seller = Seller.find(params[:seller_id])
  	end
end
