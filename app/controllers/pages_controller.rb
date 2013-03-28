class PagesController < ApplicationController
  def home
    @titre = "Accueil"
  end

  def contact
    @titre = "Contact"
  end
  
  def about
    @titre = "A propos de..."
  end
  
  def help
    @titre = "Ruby On Rails ?"
  end
end
