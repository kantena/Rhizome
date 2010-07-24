require 'java'
require 'app/vue/jar/vue3.jar' #Inserer ici le fichier jar de la fenetre
include_class 'fen.Vue_swing' #Inserer ici la classe de la fenetre

class Fen_<nom-vue> < Vue_swing #Inserer ici la classe de la fenetre
  def initialize
    super()
    self.visible =false
  end

  def affiche(resultat)
    resultat
  end
  def visible?
    self.visible
  end
  def visible! booleen
    self.visible = booleen 
  end

end

class Vue_<nom-vue> < MVC::Vue_mvc
  def initialize controleur, fenetre=Fen_<nom-vue>.new
    @controleur = controleur
    @fen = fenetre
  end
  # Implementer ici les actions dont le champs d'application ne sort pas de la
  # vue et n'ont donc pas a consulter les données du modèle.
  
  
end

