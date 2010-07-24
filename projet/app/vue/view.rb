require 'java'
require 'lib/pattern'
require 'app/vue/jar/vue3.jar'
include_class 'fen.Vue_swing' 

class Fen_view < Vue_swing
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

class Vue_view
  def initialize controleur, fenetre=Fen_view.new
    @controleur = controleur
    @fen = fenetre

  end
  
  def set_fenetre fenetre
    @fen = fenetre
  end

  def visible?
    @fen.visible?
  end
  
  def visible! booleen
    @fen.visible! booleen
  end


  def update modele
    @fen.affiche(modele.get_data)
  end
  
  def do_it! *arg
    return self.send(*arg) if self.respond_to?(arg[0])
    @controleur.do_it! self, *arg
  end
  
end

