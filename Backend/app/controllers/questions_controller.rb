class QuestionsController < ApplicationController
    def index
        @questions = Question.all
        render json: @questions
    end

    def show
        @question = Question.find(params[:id])
        render json: @question
    end

    def create
        @question = Question.create(question_params)
        render json: @question
    end

    
    
    
    private

    def question_params
        params.permit(:name)
    end
end
