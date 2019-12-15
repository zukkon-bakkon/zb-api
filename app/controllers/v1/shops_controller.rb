class V1::ShopsController < ApplicationController
  def index
    shops = Shop.first
    render json: shops.to_json(:include => :girls)
  end
end
