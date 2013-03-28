class UsersController < ApplicationController
  def new
    @user = User.new
    @titre = "S'inscrire !"
  end
  def show
  	# params = objet standard de Rails pour récupérer l'identifiant :
    @user = User.find(params[:id])
    @titre = @user.nom
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Inscription réussie !"
      redirect_to @user
    else
      @titre = "S'inscrire !"
      render 'new'
    end
  end
end

