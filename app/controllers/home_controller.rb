class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index,:items]
  def index
  end

  def items
    @a_right = false
    if params[:e_key] != nil then
        @items = Item.where(e_key: params[:e_key])
        host = Event.find_by(e_key: params[:e_key])
        if host.e_host == current_user.email then
            @a_right = true
        else
            @a_right = false
        end
    else
        @items = nil
    end
  end
  
  def get_image
    image = Item.where(id: params[:id]).first
    if image
      send_data(image.pic_data, disposition: "inline", type: "image/jpg")
    else
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end
  def item_detail
    @item = Item.where(id: params[:id]).first
    gon.lat = @item.pos_x;
    gon.lng = @item.pos_y;
  end

  def delete
    del_item = Item.where(id: params[:id])
    del_item.delete_all
    redirect_to :action => "items", :e_key => params[:e_key]
  end
end
