class CommentsController < ApplicationController
    def create
        #get reference to the current article
        @article = Article.find(params[:article_id])
        #access the comments and call the association create method which will create and save the comment AND also link the comment to the corresponding article. 
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
