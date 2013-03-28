require 'spec_helper'

describe PagesController do
  render_views

  before(:each) { @base_title = "Projet Web - Marie Sheo Coneau-Lacour" }

  describe "GET 'home'" do
    it "doit réussir" do
      get 'home'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'home'
      response.should have_selector("title",:content => @base_title + " | Accueil")
    end
  end

  describe "GET 'contact'" do
    it "doit réussir" do
      get 'contact'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'contact'
      response.should have_selector("title",:content => @base_title + " | Contact")
    end
  end
  
  describe "GET 'about'" do
    it "doit réussir" do
      get 'about'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'about'
      response.should have_selector("title",:content => @base_title + " | A propos de...")
    end
  end
  
  describe "GET 'help'" do
    it "doit réussir" do
      get 'help'
      response.should be_success
    end
    it "doit avoir le bon titre" do
      get 'help'
      response.should have_selector("title",:content => @base_title + " | Ruby On Rails ?")
    end
  end

end

