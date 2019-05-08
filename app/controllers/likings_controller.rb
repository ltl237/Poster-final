class LikingsController < ApplicationController

	def new
		@liking = Liking.new()
	end

	def create
		@post = Post.find(params[:id])
		# @user = User.find(params[:user_id])
		# byebug
		# @liking = Liking.create(params[:id], params[:user_id])
		@liking = Liking.create(post_id: params[:id], user_id: session[:user_id])
		# byebug

		@user_like_array = @post.likings.map do |liking|
			liking.user_id
		end

		# byebug
		if @user_like_array.count(session[:user_id]) == 1
			@post.likes += 1
			@post.save

		else
			Liking.where(user_id: session[:user_id]).destroy_all
			# @user_like_array.delete(session[:user_id])
			@post.likes -= 1
			@post.save
			
			# @user_like_array << session[:user_id]
		end
		# byebug

		# @users_who_liked_this_post = @user_like_array.uniq
				
		redirect_to @post

		# if @user_like_array.count(session[:user_id]) == 1
		# 	@post.likes += 1
		# else
		# 	@post.likes = @post.likes
		# end

	end

	private

	# def like_params
	# 	params.require(:liking).permit(:user_id,:post_id)
	# end

end
