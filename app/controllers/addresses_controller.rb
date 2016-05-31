class AddressesController < ApplicationController
  before_action :address, only: [:edit, :show, :update, :destroy]

  def index
    @address = address.all
  end

  def show
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to address_path(@address)
    else
      render :edit
    end
  end

  def new
      @address = address.new
  end

  def create
    @address = address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def destroy
    if @address.destroy
    	redirect_to :addresses_path
    else
      redirect_to :address_path
    end
  end

  private
    def address
        @address = Address.find(params[:id])
    end
    def address_params
        params.require(:address).permit(:street, :state, :country, :zip)
    end 
end
