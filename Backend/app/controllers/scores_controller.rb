class ScoresController < ApplicationController

    def index
        @scores = Score.all
        render json: @scores
    end

    def show
        @score = Score.find(params[:id])
        render json: @score
    end

    def create
        @score = Score.create(score_params)
        render json: @score
    end

    def update
        @score = Score.update(score_params)
        render json: @score
    end

    def destroy
        @score = Score.find(params[:id])
        @score.destroy
        render json: @score
    end
    
    
    
    private

    def score_params
        params.permit(:name, :score, :category_id)
    end
end
