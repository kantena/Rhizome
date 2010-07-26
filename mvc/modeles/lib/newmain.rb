# Lancer ici la fenetre de départ

require '<nom-demarrage>.vue.rb'
require '<nom-demarrage>.controleur.rb'
require '<nom-demarrage>.modele.rb'

contro = Controleur_<nom-demarrage>.new
vue=Vue_<nom-demarrage>.new(contro)
contro.add_view vue, Modele_<nom-demarrage>.new
vue.visible! true

