require 'spec_helper'

describe "LayoutLinks" do

  it "devrait trouver une page Accueil à '/'" do
    get '/'
    response.should have_selector('title', :content => "Accueil")
  end

  it "devrait trouver une page Contact at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "devrait trouver une page A propos de... at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "A propos de...")
  end

  it "devrait trouver une page Ruby On Rails ? à '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Ruby On Rails ?")
  end
end

