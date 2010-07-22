require 'java'
require 'lib/pattern'
require 'app/vue/jar/<nom_du_fichier_contenant_la_fenetre_swing>.jar'
include_class '' #inserer le nom de la classe swing avec son paquetage

class Fen_view < #inserer le nom de la classe swing
  def initialize
    super()
  end

  def affiche(resultat)
    resultat
  end
  def visible?
    self.visible
  end
  def visible! booleen
    self.visible = booleen if (booleen == true || booleen == false)
  end

end

class Vue_view < Pattern::InterfaceObserver
  def initialize controleur
    @controleur = controleur
    @fen = Fen_view.new

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
    @fen.affiche(modele.get_data) if modele.respond_to?("get_data")
  end
end

