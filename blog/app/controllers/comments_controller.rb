class CommentsController < ApplicationController
 def create
	@post = Post.find(params[:post_id])
	
	if @post.comments.create(comment_params)
		redirect_to @post, notice:'asuh comment was created skiizzz'
	else
		redirect_to @post, alert: 'asuh no comment was created error yo'
	end
 end
 
 private
 
 def comment_params	
	params.require(:comment).permit(:author, :body)
 end
 
end
