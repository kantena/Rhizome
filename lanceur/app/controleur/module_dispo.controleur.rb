class Module_dispo_controleur
  @@controleur = false
  def initialize 
      @vue = Liste_module_dispo_Vue.new self, RhizomeModule.disponibles
  end
  
  def click_installation modul, vue
    unless modul.install
      tmp = RhizomeModule.create(modul.to_hash)
      tmp.add_obs vue
      modul.delete
      modul.rm_obss
      modul = tmp
    end
    modul.change_install    
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
