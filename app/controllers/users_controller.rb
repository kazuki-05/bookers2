class UsersController < ApplicationController
  def index
    @user=current_user
    @users=User.all
  end

  def show
    # 投稿した人の情報
    @user=User.find(params[:id])
    # 投稿した人の本の情報
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    if@user.update(users_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  
  private
  
  def users_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
