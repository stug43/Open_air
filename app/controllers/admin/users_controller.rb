class Admin::UsersController < ApplicationController
before_action :is_admin?

	def index
		@users = User.all
	end 

	def edit
	end

	def update
	end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      
      
    end
end

end
