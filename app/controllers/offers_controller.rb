class OffersController < ApplicationController
  before_action :set_offer, only: :show
  # before_action :set_user, only: [:new, :create]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save!
      redirect_to @offer, notice: "Your offer was successfull created"
    else
      # raise
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def offer_params
    params.require(:offer).permit(:name, :location, :description, :category, :availability)
  end
end
