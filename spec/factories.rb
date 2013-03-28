# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |user|
  user.nom                   "Sheo"
  user.email                 "mlacour@voidmaster.lautre.net"
  user.password              "password"
  user.password_confirmation "password"
end

