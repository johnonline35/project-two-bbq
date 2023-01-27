class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    # List of gems needed for Stripe:
    require 'json'
    require 'sinatra'
    require 'stripe'

    # Use stripe test api key:
    Stripe.api_key = 'sk_test_51J7vFZIkVCToqUoaPhdK0GphlcxtKeztY7VIkYurc9N8gd9qBHXW92nDN4iFDbvWSYmWRN9fTAQytEy9Wmym1JFt00oelC54nj'

    # Create
    session = Stripe::Checkout::Session.create({
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'Grill',
          },
          unit_amount: 2000,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: 'http://localhost:3000/payments/success',
      cancel_url: 'http://localhost:3000/payments/canceled',
    })
  
    redirect_to session.url
  end

  def success
  end

  def canceled
  end
end
