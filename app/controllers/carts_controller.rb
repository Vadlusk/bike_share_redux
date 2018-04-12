class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
    @accessories = Accessory.where(id: @cart.contents.keys)
  end

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents
    flash[:success] = "You've added #{pluralize(session[:cart][accessory.id.to_s], accessory.title)} to your cart"
    redirect_to bike_shop_path
  end

  def destroy
    accessory = Accessory.find(params[:accessory_id])

    @cart.remove_accessory(params[:accessory_id])
    flash[:success] = %Q(Successfully removed #{view_context.link_to(accessory.title, accessory_path(accessory))} from your cart)
    redirect_to '/cart'
  end

  def update
    @cart.increment_accessory(params[:accessory_id])
    accessory = Accessory.find(params[:accessory_id])
    redirect_to '/cart'
  end
end