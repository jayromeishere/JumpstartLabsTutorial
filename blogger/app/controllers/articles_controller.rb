class ArticlesController < ApplicationController
    include ArticlesHelper
    
    def index
        @articles = Article.all #use '@' so that both controller and view can access the variable
    end
    
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article_id
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        @article.save #will not be in the database unless saved! 
        flash.notice = "Article '#{@article.title}' created!"
        redirect_to article_path(@article)
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        
        flash.notice = "Article '#{@article.title}' updated!"
        
        redirect_to articles_path
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash.notice = "Article '#{@article.title}' deleted!"
        redirect_to articles_path
    end
    
end
