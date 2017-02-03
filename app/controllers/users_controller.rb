class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :allow_only_admins, :except => [:create]

  def allow_only_admins
    unless current_user.admin?
      redirect_to root_path, :flash => { :error => "Sorry, you do not have permission to access that area." }
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :admin, :advertiser, :promoter)
    end
end
