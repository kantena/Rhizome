require 'mvc_framework'
require 'java'
require 'jar/vue3.jar' #<--Inserer ici le fichier jar de la fenetre
include_class 'fen.Vue_swing' #<--Inserer ici la classe de la fenetre

class Fen_<nom-vue> < Vue_swing #<--Inserer ici la classe de la fenetre
  def initialize micro_c
    super()
    self.visible =false
    #jAjout2.add_action_listener { |e| micro_c.do_it! :plus2};
    #jRetire3.add_action_listener { |e| micro_c.do_it! :moins3};
  end

  def affiche(resultat)
    #jResult.set_text(resultat.to_s)
  end

  def visible?
    self.visible
  end
  def visible! booleen
    self.visible = booleen
  end

end

class Vue_<nom-vue> < Mvc::Vue_mvc
  def initialize controleur, fenetre=Fen_<nom-vue>.new(self)
    @controleur = controleur
    @fen = fenetre
  end

  def update modele
    @fen.affiche modele.get_data
  end
  # Implementer ici les actions dont le champs d'application ne sort pas de la
  # vue et n'ont donc pas a consulter les données du modèle.


end

