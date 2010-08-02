module Mvc

  
###############################    Controleur    ###############################
  class Controleur_mvc

  end

###########################     Modele        ##################################
require 'observer'
class Modele_mvc
  include Observable
  def notify
    changed
    notify_observers
  end

end



#################################    Vue    ####################################
class Vue_mvc

end

end
