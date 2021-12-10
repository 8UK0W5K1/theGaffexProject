class TagsController < ApplicationController
    before_action :authenticate_user!

    def create      
        @article = Article.find(params[:article_id])
        @tag = @article.tags.find_by(user: current_user)            
        if @tag.nil?
            @tag = Tag.create(user: current_user, article: @article, tag_name: params[:tag_name])
        else
            @tag.update(tag_name: params[:tag_name])
        end
        redirect_to article_path(params[:article_id])
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to article_path(params[:article_id])
    end
end
