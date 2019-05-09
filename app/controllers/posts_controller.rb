class PostsController < ApplicationController
	before_action :get_single_post, only: [:show, :edit, :update]
	
	def new
		@post = Post.new()
		# byebug
		@user = User.find(session[:user_id])
	end

	def show
		# get_single_post
		# byebug
		@comment = Comment.new
		@comments = @post.comments
		# byebug
	end

	def index
		@posts = Post.all

	end

	def create
		unless @logged_in
      		set_notification("You're not logged in !")
      		redirect_to new_login_path
      	return
    	end

    	@post = Post.create(post_params)
    	# @post.likes = 0
    	# byebug
    	redirect_to posts_path
	end

	def update
		@post.update(post_params)
		@post.save
		redirect_to @post
	end

	def destroy
		# byebug
		Post.destroy(params[:id])
		render :index
	end

	private

	def post_params
		params.require(:post).permit(:likes,:content,:title,:user_id)
	end

	def get_single_post
		@post = Post.find(params[:id])
	end
end
