class Module_dispo_controleur
  @@controleur = false
  def initialize 
      @vue = Liste_module_dispo_Vue.new self, RhizomeModule.disponibles
  end
  
  def click_installation modul
    unless modul.install
      tmp = RhizomeModule.create(modul.to_hash)
      tmp.cpy_obs modul
      tmp.change_install
    else
      modul.change_install 
      modul.change_actif false      
      modul.delete
    end
  end
  
  def click_activation modul
    modul.change_actif
    if modul.actif
      Kernel.const_get(:Controleur_lanceur).controleur.update modul
    end
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
