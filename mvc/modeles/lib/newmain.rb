# Lancer ici la fenetre de départ

require 'app/vue/<nom-demarrage>.vue.rb'
require 'app/controleur/<nom-demarrage>.controleur.rb'
require 'app/modele/<nom-demarrage>.modele.rb'

contro = Controleur_<nom-demarrage>.new
vue=Vue_<nom-demarrage>.new(contro)
contro.add_view vue, Modele_<nom-demarrage>.new
vue.visible! true

