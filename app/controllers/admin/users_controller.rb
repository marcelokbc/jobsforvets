module Admin
    class UsersController < BaseController
      before_action :set_user, only: [:edit, :update, :destroy, :show]
  
      def index
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true).order(:email)
        @pagy, @users = pagy(@users)
      end
  
      def show
        render :form
      end
  
      def new
        @user = User.new
        render :form
      end
  
      def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Usuário criado com sucesso!"
          redirect_to action: :index
        else
          render :form, status: :unprocessable_entity
        end
      end
  
      def edit
        render :form
      end
  
      def update
        if @user.update(user_params)
          flash[:notice] = "Usuário atualizado com sucesso!"
          redirect_to action: :index
        else
          render :form, status: :unprocessable_entity
        end
      end
  
      def destroy
        @user.destroy
        redirect_to action: :index
      end
  
      private
  
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        if params[:user][:password].blank?
           params[:user].delete(:password)
           params[:user].delete(:password_confirmation)
        end
  
        params.require(:user).permit(
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
  