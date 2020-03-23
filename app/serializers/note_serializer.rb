class NoteSerializer < ActiveModel::Serializer
  attributes :id, :entry, :park_collection_id
  belongs_to :park_collection
end
