require 'java'
require 'app/vue/jar/<nom_du_fichier_contenant_la_fenetre_swing>.jar'
include_class '' #inserer le nom de la classe swing avec son paquetage

class Fen_<nom-vue> < #inserer le nom de la classe swing
    def initialize micro_c = Vue_<nom-vue>.new
    super()
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

class Vue_<nom-vue>
  def initialize controleur
    @controleur = controleur
    @fen = Fen_<nom-vue>.new self

  end
  def set_fenetre fentre
    @fen = fenetre
  end

  def visible?
    @fen.visible?
  end
  def visible! booleen
    @fen.visible! booleen
  end


  def update(modele)
    @fen.affiche(modele.get_data)
  end
end

