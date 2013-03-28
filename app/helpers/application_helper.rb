module ApplicationHelper
	def logo
		logo = image_tag("logo.png", :alt => "Projet Web Sheo", :class => "round")
	end
	# gère le contenu du title d'une page
	def titre
		base_titre = "Projet Web - Marie Sheo Coneau-Lacour"
		if @titre.nil?
			base_titre # retour implicite 1
		else # interpolation de chaines :
			"#{base_titre} | #{@titre}" # retour implicite 2
			# non supportée par les chaines apostrophes
		end
	end # titre
end
# Rails inclue automagiquement le module à toutes les vues de l'application

