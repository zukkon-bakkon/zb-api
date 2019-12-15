module V1
  class GirlSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :image_url,
               :shop
    belongs_to :shop, serializer: ShopSerializer
  end
end
