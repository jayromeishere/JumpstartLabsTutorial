class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all #use '@' so that both controller and view can access the variable
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
end
