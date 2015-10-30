class UpOnBrowserController < ApplicationController

    def upload_page
      @item = Item.new
    end
 
    def create
      param = params[:item]
      item = Item.new
      item.i_name = param[:i_name]
      item.category = param[:category]
      item.pic_data = param[:pic_data].read
      item.e_key = param[:e_key]
      item.f_name = current_user.email
      item.f_id = current_user.id
      item.save
      render :text => params.to_s
    end
end
