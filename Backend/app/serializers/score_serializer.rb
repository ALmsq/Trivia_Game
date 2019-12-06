class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :score
  has_one :category
end
