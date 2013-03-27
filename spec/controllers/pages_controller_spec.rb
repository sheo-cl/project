require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "doit réussir" do
      get 'home'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'home'
      response.should have_selector("title",:content => "Projet Web - Marie Sheo Coneau-Lacour | Accueil")
    end
  end

  describe "GET 'contact'" do
    it "doit réussir" do
      get 'contact'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'contact'
      response.should have_selector("title",:content => "Projet Web - Marie Sheo Coneau-Lacour | Contact")
    end
  end
  
  describe "GET 'about'" do
    it "doit réussir" do
      get 'about'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'about'
      response.should have_selector("title",:content => "Projet Web - Marie Sheo Coneau-Lacour | A propos de...")
    end
  end

end

