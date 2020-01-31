class ParkCollectionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :park_id
  belongs_to :user

end
