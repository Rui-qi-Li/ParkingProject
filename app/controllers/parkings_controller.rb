class ParkingsController < ApplicationController
  # ensures a logged in user is available to all
  before_action :authenticate_user!,except: [:welcome]
  # helper methods: current_user , user_signed_in?
  @@client = GooglePlaces::Client.new('AIzaSyBrsXzITPUgI6qlsK52xynb8j-MKPEsUwM')

  def welcome
  end

  # do the searching
  def index
    @query = params[:search]
    if @query
      @httparty = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{@query[:lat]},#{@query[:lng]}&radius=1000&key=AIzaSyBrsXzITPUgI6qlsK52xynb8j-MKPEsUwM&type=parking")
      @results = @httparty['results'] # plain json array

      # @results.map do |item|
      #   @p_id = item['place_id']
      #   @p_details = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@p_id }&fields=formatted_address&key=AIzaSyBrsXzITPUgI6qlsK52xynb8j-MKPEsUwM")
      #   item['formatted_address'] = @p_details['result']['formatted_address']
      # end
    end
  end

  def show
    @address = params[:address]
    @address.replace(@address.gsub('-',' '))
    # @httparty = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{@address}&region=ie&key=AIzaSyBrsXzITPUgI6qlsK52xynb8j-MKPEsUwM")
  end

  def checkout
    @address = params[:address]
  end

  def create
    Stripe.api_key = "sk_test_NXHR4iG6TKfkxB71ev8RaVZz"
    token = params["stripeToken"]
    charge = Stripe::Charge.create({
        amount: params["cost"].to_i,
        currency: 'eur',
        description: 'Parking place booking fee',
        source: token
    })

    @new_book = {
      name: params["name"],
      address:params["address"],
      hour: params["hour"],
      cost: charge.amount,
      charge_id: charge.id,
      charge_email: charge.source.name,
      charge_created: charge.created
    }
    @booking = current_user.bookings.new(@new_book)

    respond_to do |format|
      if @booking.save
        format.html{ redirect_to '/parking/users/booking' }
      end
    end

  end

  def booking
    @bookings = current_user.bookings.all
  end
end
