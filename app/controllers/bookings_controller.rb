class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_offer, only: %i[new create]

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @booking.user = current_user
    if @booking.save
      redirect_to offers_path
    else
      render 'offers/show', status: :unprocessable_entity
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:comment, :start_time, :end_time)
  end
end
