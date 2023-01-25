class BookingsController < ApplicationController
    before_action :check_for_login

    def create
        booking = Booking.create :grill_id => params[:grill_id], :date => params[:date]
        @current_user.bookings << booking # add current user and current grill to booking 
        
        require 'json'
        require 'sinatra'
        require 'stripe'
        
        Stripe.api_key = 'sk_test_51J7vFZIkVCToqUoaPhdK0GphlcxtKeztY7VIkYurc9N8gd9qBHXW92nDN4iFDbvWSYmWRN9fTAQytEy9Wmym1JFt00oelC54nj'

        session = Stripe::Checkout::Session.create({
        line_items: [{
            price_data: {
            currency: 'usd',
            product_data: {
                name: booking.grill.name,
            },
            unit_amount: (booking.grill.price_per_day * 100).to_i,
            },
            quantity: 1,
        }],
        mode: 'payment',
        success_url: 'http://localhost:3000/payments/success',
        cancel_url: 'http://localhost:3000/payments/canceled',
        })
    
        redirect_to session.url
    end

    def edit
        @booking = Booking.find params[:id]
    end
    
    def update
        booking = Booking.find params[:id]
        booking.update :date => params[:booking][:date]
        redirect_to booking.grill
    end
    
    def destroy
        booking = Booking.find params[:id]
        booking.destroy
        redirect_to booking.grill
    end

    private
    def booking_params
        params.require(:booking).permit(:grill_id, :user_id, :date)
    end
end
