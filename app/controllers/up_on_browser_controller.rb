class UpOnBrowserController < ApplicationController
before_action :authenticate_user! , only: [:upload_page] 
    def upload_page
      @item = Item.new
    end
 
    def create
      param = params[:item]
      @item = Item.new
      @item.i_name = param[:i_name]
      @item.category = param[:category]
      @item.pic_data = param[:pic_data].read
      @item.e_key = param[:e_key]
      @item.f_name = current_user.email
      @item.f_id = current_user.id
      @item.i_detail = param[:i_detail]
      @item.pos_x = param[:pos_x]
      @item.pos_y = param[:pos_y]
      @item.save
      render :text => params.to_s
    end
end
