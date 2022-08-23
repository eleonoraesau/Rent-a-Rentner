class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_offer, only: :show

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to @offer, notice: "Your offer was successfull created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:name, :location, :description, :category, :availability)
  end
end
