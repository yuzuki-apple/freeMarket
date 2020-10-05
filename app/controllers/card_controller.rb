class CardController < ApplicationController

  def new
    gon.api_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params[:card_token].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        card: params[:card_token]
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      if @card.save
        binding.pry
        redirect_to new_card_path
      else
        render :new
      end
    end
  end

end
