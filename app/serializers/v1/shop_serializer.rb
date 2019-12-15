module V1
  class ShopSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :image_url,
               :open_time,
               :tell_number,
               :description,
               :title,
               :trip_area,
               :holiday,
               :admission,
               :designation_fee,
               :payment,
               :girls
    has_many :girls, serializer: GirlSerializer
  end
end
