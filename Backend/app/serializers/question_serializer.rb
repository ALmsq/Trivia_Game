class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :r_ans, :answers
  has_one :category
end
