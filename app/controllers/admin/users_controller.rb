class Admin::UsersController < ApplicationController
before_action :is_admin?

	def index
		@users = User.all
	end 

	def edit
		@user = User.find(params[:id])
	end

	def update
	end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.js { render :layout => false }
    end
end

private
protected

	def admin_upgrade(user)
		if !user.admin?
			user.update(admin?: true)
		end
	end

	def admin_downgrade(user)
    if user.admin?
      user.update(admin?: false)
    end
  end

end
