class HomeController < ApplicationController
  def index
  end

  def items
    @items = Item.all
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
