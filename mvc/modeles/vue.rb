require 'java'
require 'lib/pattern'
require 'jar/<nom-vue>.jar
include_class '' # inserer ici le nom de la classe swing

class Fen_<nom-vue> < # inserer ici le nom de la classe swing
  def initialize
    @visible=true
  end

  def affiche(resultat)
    resultat
  end
  def visible?
    @visible
  end
  def visible! booleen
    @visible=booleen
  end

end

class Vue_<nom-vue> < Pattern::InterfaceObserver
  def initialize fenetre=Fen_<nom-vue>.new
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

