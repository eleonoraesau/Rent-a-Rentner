class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def dashboard
    @my_offers = current_user.offers
    @my_bookings = current_user.bookings
  end
end
