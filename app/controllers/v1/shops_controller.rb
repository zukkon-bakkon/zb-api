class V1::ShopsController < ApplicationController
  def index
    shops = Shop.all
    render :json => shops, :include => {:girls}
  end
end
