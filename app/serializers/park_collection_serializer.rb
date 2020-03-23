class ParkCollectionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :park_id, :description, :directions_url, :url, :full_name
  belongs_to :user
  has_many :notes

end
