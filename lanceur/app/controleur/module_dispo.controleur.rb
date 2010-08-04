class Module_dispo_controleur
  @@controleur = false
  def initialize 
    @vue = Liste_module_dispo_Vue.new self, Module_dispo_modele.disponibles
  end
  
  def self.start

    unless @@controleur
    @@controleur = Module_dispo_controleur.new 
    return
    end
    @vue.set_visible true
    
  end
end
