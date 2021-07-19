class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc)
    authorize @users
    # if current_user.has_any_role? :admin, :newuser
    #   @users = User.order(created_at: :desc)
    # else
    #   redirect_to root_path, alert: 'not authrized'
    # end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to users_url, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit({role_ids: []})
    end
end
