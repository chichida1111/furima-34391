class ItemDisplaysController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @item_displays = ItemDisplay.all.order(id: :DESC)
  end
 
  def new
    @item_display = ItemDisplay.new
  end

  def create
    @item_display = ItemDisplay.create(item_display_params)
    if @item_display.save
      redirect_to root_path
    else
      render new_item_display_path
    end
  end

  private
  def item_display_params
    params.require(:item_display).permit(:image,:item_name,:item_explain,:category_id,:status_id,:ship_burden_id,:ship_source_id,:ship_date_id,:item_price).merge(user_id: current_user.id)
  end

end