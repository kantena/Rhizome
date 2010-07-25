module Mvc

  
###############################    Controleur    ###############################
  class Controleur_mvc
    @@liste=[]


  def add_view vue, modele
    @@liste << [vue, modele]
    modele.add_observer vue
  end
 
  def delete_view vue
    maliste=[]
    @@liste.each do |element|
      if element[0] == vue then
        element[1].delete_observer element[0]
      else
      	      maliste << element
      end
    end
    @@liste = maliste
  end
 
  def get_views
    @@liste.map { |element| element[0] }
  end

  def get_view_model vue
    resultat = @@liste.assoc(vue)
    resultat = [] if resultat == nil
    resultat
  end

  def do_it!(expediteur, *arg)
    retour = true
    retour = self.send(*arg) if self.respond_to?(arg[0])
    self.get_view_model(expediteur)[1].do_it!(*arg) if retour 
  end
end

###########################     Modele        ##################################
require 'observer'
class Modele_mvc
  include Observable
  
    def get_data
    end
    
    def do_it! *arg
      return self.send(*arg) if self.respond_to?(arg[0])
    end
end



#################################    Vue    ####################################
class Vue_mvc
  def set_fenetre fenetre
    @fen = fenetre
  end
  
  def visible?
    @fen.visible?
  end
  
  def visible! booleen
    @fen.visible! booleen
  end

  
  def do_it! *arg
    return self.send(*arg) if self.respond_to?(arg[0])
    @controleur.do_it! self, *arg
  end
end

end
