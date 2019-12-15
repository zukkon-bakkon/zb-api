class V1::ShopsController < ApplicationController
  def index
    render json: Shop.all.limit(20),each_serializer: V1::ShopSerializer
  end
end
