class PaymentsController < ApplicationController
	def create
		token = params[:stripeToken]
		if user_signed_in?
      @user = current_user
    else
    	redirect_to  new_user_registration_path	
    end
		@product = Product.find(params[:product_id])

		@user = current_user
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      amount: (@product.price * 100).to_i,
	      currency: "eur",
	      source: token,
	      description: params[:stripeEmail],
	      receipt_email: @user.email
	    )
	    if charge.paid
	    	Order.create(
    		product_id: @product.id,
        user_id: @user.id,
        total: @product.price
        ) #create is for both new and save
        UserMailer.payment_confirmation(@user, @product).deliver_now
  		end
	    
	  #for checking if the payment is ok with stripe
	  rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
	    err = body[:error]
	    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  end
	  	redirect_to product_path(@product), notice: "Payment was processed successfully"
	end
end
