# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Category.destroy_all
# Question.destroy_all
# Score.destroy_all

# history = Category.create(name: "history")
# video_games = Category.create(name: "video games")

# q1 = Question.create(question: "The idea of Socialism was articulated and advanced by whom?", r_ans: "Karl Marx", w_ans1:"Vladimir Lenin", w_ans2:"Joseph Stalin", w_ans3:"Vladimir Putin", category: history)

# q2 = Question.create(question: "What company created and developed the game Overwatch?", r_ans: "Blizzard Entertainment", w_ans1: "Valve", w_ans2: "Hi-Rez Studios", w_ans3: "Gearbox Software", category: video_games)

# Score.create(name: 'Alex', score: 1000, category: video_games)
# Score.create(name: 'Alex', score: 2000, category: history)

difficulties = ['easy', 'medium', 'hard']
categories = (1..15).to_a

categories.each{|category_number|

    difficulties.each{|level|
    trivia_url = "https://opentdb.com/api.php?amount=20&category=#{category_number}&difficulty=#{level}&type=multiple"
    trivia_data = HTTParty.get(trivia_url)

        trivia_data['results'].each{|category_question|
            sanitizeQuest = CGI.unescapeHTML(category_question['question'])
            sanitizeAns = CGI.unescapeHTML(category_question['correct_answer'])
            cat = Category.find_or_create_by(name: category_question['category'])
            quest = Question.new(question: sanitizeQuest, r_ans: sanitizeAns, category: cat)
            quest.w_ans1 = CGI.unescapeHTML(category_question['incorrect_answers'][0])
            quest.w_ans2 = CGI.unescapeHTML(category_question['incorrect_answers'][1])
            quest.w_ans3 = CGI.unescapeHTML(category_question['incorrect_answers'][2])
            quest.save
        }
    }
}
