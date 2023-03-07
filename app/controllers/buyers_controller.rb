class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :not_buy_item, only: [:index, :create]

  def index
    @buyer_form = BuyerForm.new
  end

  def create
    @buyer_form = BuyerForm.new(buyer_params)
    if @buyer_form.valid?
      pay_item
      @buyer_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer_form).permit(:postcode, :shipping_area_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: buyer_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def not_buy_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end
end
