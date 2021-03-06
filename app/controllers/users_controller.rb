class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :show, :update]

  def index
  end

  def show
    @prototypes = @user.prototypes.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :root
      alert_user_edit_successe_message
    else
      redirect_to edit_user_path
      alert_user_edit_error_message
    end
  end

 private

  def user_params
    params.require(:user).permit(
    :name,
    :email,
    :member,
    :profile,
    :works,
    :avatar
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
