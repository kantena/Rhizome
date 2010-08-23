class Module_dispo_controleur
  @@controleur = false
  attr_reader :vue
  def initialize 
      @vue = Liste_module_dispo_Vue.new self, RhizomeModule.disponibles
  end
  
  def click_installation modul
    modul.change_install
  end
  
  def click_activation modul
    modul.change_actif
    if modul.actif
      Controleur_lanceur.controleur.update modul
    end
  end
  
  def self.update
    @@controleur.vue.affiche_list RhizomeModule.disponibles
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
