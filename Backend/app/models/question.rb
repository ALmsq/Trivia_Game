class Question < ApplicationRecord
  belongs_to :category

  def answers
    [self.r_ans, self.w_ans1, self.w_ans2, self.w_ans3].shuffle
  end
end
