class UsersController < ApplicationController
	before_action :get_user, only: [:show]

	def new
		@user = User.new()
	end

	def index
		# byebug
		# @user = User.find(session[:user_id])

		@users = User.all

	end

	# def show
	# 	get_user
	# end

	def create
		@user = User.create(user_params)

		if @user.valid?
			log_in_user(@user.id)
			redirect_to posts_path
		else
			@errors = @user.errors.full_messages
			render :new
		end
	end

	def destroy
		

		# @user_destroyed = User.find(params[:id]).destroy
		Liking.where(user_id:params[:id]).each do |liking|

			if liking.post.likes > 0
				liking.post.update(likes: liking.post.likes-1)
				# liking.post.likes -= 1
			end
			# byebug
		end
		User.find(params[:id]).destroy

		Post.where(user_id:params[:id]).destroy_all
		log_out_user
		# if @user_destroyed
		redirect_to new_login_path
		# end
	end

	private

	def user_params
		params.require(:user).permit(:full_name,:username,:bio,:password)
	end

	def get_user
		@user = User.find(params[:id])
	end

end
