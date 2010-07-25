# Lancer ici la fenetre de départ

require 'accueil-vue.rb'
require 'accueil-controleur.rb'
require 'accueil-modele.rb'

contro = Controleur_accueil.new
vue=Vue_accueil.new(contro)
contro.add_view vue, Modele_accueil.new
vue.visible! true

