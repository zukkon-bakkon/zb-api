class V1::ShopsController < ApplicationController
  def index
    shops = Shop.first
    render json: @shops, include: [:girls]
  end
end
