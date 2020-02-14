class OrdersController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @book.title,
      description: "by #{@book.author.name}",
      images: ["#{@book.picture.service_url if @book.picture.attached?}"],
      amount: (@book.price * 100).to_i,
      currency: 'aud',
      quantity: 1,
    }],
    payment_intent_data: {
      metadata: {
        user_id: current_user.id,
        book_id: @book.id
      }
    },
    success_url: "#{root_url}orders/complete",
    cancel_url: "#{root_url}",
    )
  end
end
