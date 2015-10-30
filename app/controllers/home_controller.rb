class HomeController < ApplicationController
  def index
  end

  def show
   # @item=Item.all(:select => 'id, i_name, category, e_key, pos_x, pos_y, f_name, f_id, f_date')
   @item=Item.all
   # send_data(@item, :disposition => "inline", :type => "image/jpg")

  end
  def get_image
    @image = Item.find_by(:id => params[:id])
    send_data(@image.pic_data, :disposition => "inline", :type => "image/jpg")
  end
end
