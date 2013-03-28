class UsersController < ApplicationController
  def new
    @titre = "Inscription"
  end
  def show
  	# params = objet standard de Rails pour récupérer l'identifiant :
    @user = User.find(params[:id])
    @titre = @user.nom
  end
end
