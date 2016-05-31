class SellersController < ApplicationController
  before_action :seller, except: [:index, :new, :create]

  def index
    @sellers = Seller.all
  end

  def show
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to seller_path(@seller)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      redirect_to seller_path(@seller)
    else
      render :edit
    end
  end

  def destroy
      @seller.destroy
      redirect_to :sellers_path
  end

  private

    def seller_params
      params.require(:seller).permit(:name, :info, :rating)
    end

    def seller
      @seller = Seller.find(params[:id])
    end
end
