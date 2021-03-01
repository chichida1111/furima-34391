class ItemDisplaysController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_1_item_display, only: [:show, :edit, :update ]
  before_action :set_2_item_display, only: [:edit, :update ]
  
  def index
    @item_displays = ItemDisplay.order(id: :DESC)
  end

  def show
  end

  def edit
  end

  def update
     if @item_display.update(item_display_params)
       redirect_to item_display_path(@item_display.id)
     else
      render :edit
     end
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

  def set_1_item_display
    @item_display = ItemDisplay.find(params[:id])
  end
  
  def set_2_item_display
   unless @item_display.user_id == current_user.id
    redirect_to root_path
   end
  end


end