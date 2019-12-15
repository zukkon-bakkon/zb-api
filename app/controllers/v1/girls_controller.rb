class V1::GirlsController < ApplicationController
  def index
    render json: Girl.all.limit(20), each_serializer: V1::GirlSerializer
  end
end
