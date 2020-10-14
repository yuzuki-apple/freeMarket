
class PaymentsController < ApplicationController

  def new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(current_user.card.customer_id) if current_user.card
    @card = customer.cards.retrieve(current_user.card.card_id) if current_user.card
    @item = Item.find(params[:item_id])
    @shipment_fee = ShipmentFee.find(@item.shipment_fee_id)
  end

  def create
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount: item.price.to_i,
      customer: Card.find_by(user_id: current_user.id).customer_id,
      currency: 'jpy'
    )
    if item.update(buyer_id: current_user.id)
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render "new"
    end
  end

  private
  def payment_params
    params.permit(
      :item_id,
      :quantity,
    ).merge(user_id: current_user.id)
  end

end
