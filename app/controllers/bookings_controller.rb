class BookingsController < ApplicationController
    before_action :check_for_login

    def create
        booking = Booking.create :grill_id => params[:grill_id], :date => params[:date]
        @current_user.bookings << booking # add current user and current grill to booking 
        redirect_to booking.grill # redirect to grill
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
