class V1::ShopsController < ApplicationController
  def index
    shops = Shop.last
    render json: @shops, include: [:girls]
  end
end
