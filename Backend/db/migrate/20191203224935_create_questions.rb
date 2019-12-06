class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :r_ans
      t.string :w_ans1
      t.string :w_ans2
      t.string :w_ans3
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
