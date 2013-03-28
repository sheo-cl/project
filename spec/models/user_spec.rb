# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :nom => "Example User", :email => "user@example.com" }
  end

  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr) # ! demande exception si erreur
  end

 # it "devrait exiger un nom" # appel implicite à pending
    # réserve espace pour un test à implémenter + tard
  it "exige un nom" do
    # Hash.merge => création d'une table d'attributs avec un nom invalide :
    bad_guy = User.new(@attr.merge(:nom => ""))
    # bad_guy.valid?.should_not == true équivalent à :
    bad_guy.should_not be_valid
  end
  
  it "exige une adresse email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "devrait rejeter les noms trop longs" do
    long_nom = "a" * 51
    long_nom_user = User.new(@attr.merge(:nom => long_nom))
    long_nom_user.should_not be_valid
  end
  
  it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com user@foo.fr user@foo.net THE_USER@foo.bar.fr THE_USER@foo.bar.net THE_USER@foo.bar.com first.last@foo.fr first.last@foo.com first.last@foo.net]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user@foo,net user@foo,fr user_at_foo.fr user_at_foo.net user_at_foo.com example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "devrait rejeter un email double" do
    # Place un utilisateur avec un email donné dans la BD :
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "devrait rejeter une adresse email invalide jusqu'à la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
end
