class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index,:items]
  def index
  end

  def items
    if request.post? then
        @items = Item.where(e_key: params[:e_key])
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
end
