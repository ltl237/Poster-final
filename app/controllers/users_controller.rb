class UsersController < ApplicationController
	before_action :get_user, only: :show

	def new
		@user = User.new()
	end

	def index
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

	private

	def user_params
		params.require(:user).permit(:full_name,:username,:bio,:password)
	end

	def get_user
		@user = User.find(params[:id])
	end

end
