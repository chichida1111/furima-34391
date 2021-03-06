class ItemPurchasesController < ApplicationController
  before_action :set_item_display, only: [:index, :create ]
  before_action :authenticate_user!

  def index
    if @item_display.user_id == current_user.id
      redirect_to root_path
    end
    if @item_display.item_purchase.present? and return
      redirect_to root_path
    end
    @item_purchase_ship_address = ItemPurchaseShipAddress.new
  end

  def create
    @item_purchase_ship_address = ItemPurchaseShipAddress.new(item_purchase_params)
    if @item_purchase_ship_address.valid? 
       pay_item_deisplay
       @item_purchase_ship_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase_ship_address).permit(:postal_code, :ship_source_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id, item_display_id: params[:item_display_id], token: params[:token])
  end

  def set_item_display
    @item_display = ItemDisplay.find(params[:item_display_id])
  end

  def pay_item_deisplay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item_display.item_price,
      card: item_purchase_params[:token],
      currency: 'jpy'
    )
  end

end

