class AddressesController < ApplicationController
  before_action :address, only: [:edit, :show, :update]
  before_action :seller
  before_action :house

  def index
    @address = Address.all
  end

  def show
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to seller_house_address_path
    else
      render :edit
    end
  end

  def new
      @address = Address.new
  end

  def create
    # binding.pry
    @house.address = Address.new(address_params)
    if @house.save
      redirect_to seller_house_addresses_path
    else
      render :new
    end
  end

  def destroy
    #TODO fixproblem here
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to seller_house_addresses_path(@seller, @house)
  end

  private

    def address
      @address = Address.find(params[:id])
    end

    def house
      @house = @seller.houses.find(params[:house_id])
    end

    def seller
      @seller = Seller.find(params[:seller_id])
    end
    def address_params
        params.require(:address).permit(:street, :state, :country, :zip)
    end
end
