require 'spec_helper'

describe "LayoutLinks" do

  it "devrait trouver une page d'accueil à '/'" do
    get '/'
    response.should have_selector('title', :content => "Accueil")
  end

  it "devrait trouver une page de contact at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "devrait trouver une page d'informations at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "A propos de...")
  end

  it "devrait trouver une page d'aide à '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Ruby On Rails ?")
  end
  
  it "devrait trouver une page d'inscription à '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "S'inscrire !")
  end
  
  it "devrait avoir le bon lien sur le layout" do
    visit root_path
    click_link "A propos de..."
    response.should have_selector('title', :content => "A propos de...")
    click_link "Aide"
    response.should have_selector('title', :content => "Ruby On Rails ?")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Accueil"
    response.should have_selector('title', :content => "Accueil")
    click_link "S'inscrire !"
    response.should have_selector('title', :content => "S'inscrire !")
  end
  
  describe "quand pas identifié" do
    it "doit avoir un lien de connexion" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Connexion")
    end
  end

  describe "quand identifié" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in "Mot de passe", :with => @user.password
      click_button
    end

    it "devrait avoir un lien de déconnexion" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Déconnexion")
    end

    it "devrait avoir un lien vers le profil" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profil")
    end
  end
  
end

