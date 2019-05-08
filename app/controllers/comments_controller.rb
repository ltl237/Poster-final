class CommentsController < ApplicationController

	def create
		
		# @comment = Comment.create(comment_params)
		# byebug
		# @comment = Comment.create(params[:comment][:post_id], session[:user_id], params[:comment][:content])
		@comment = Comment.new()
		@comment = Comment.create(content: params[:comment][:content], user_id: session[:user_id], post_id: params[:comment][:post_id])

		@post = Post.find(@comment.post_id)
		# byebug
		redirect_to post_path(@post)
		
	end

	private

	# def comment_params
	# 	params.require(:comment).permit(:content,:user_id,:post_id)
	# end

end
