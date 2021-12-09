class TagsController < ApplicationController
    def create 
        redirect_to root_path
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to article_path(params[:article_id])
    end
end
