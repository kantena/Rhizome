class Module_dispo_controleur
  @@controleur = false
  def initialize 
    @vue = Liste_module_dispo_Vue.new self, RhizomeModule.disponibles
  end
  
  def click_installation modul
    modul.change_install
    #modul.change_actif false
  end
  
  def click_activation modul
    modul.change_actif
  end
  
  def self.start

    unless @@controleur
    @@controleur = Module_dispo_controleur.new 
    return
    end

    
  end
  
  def fermeture
    @@controleur = false
  end
end
