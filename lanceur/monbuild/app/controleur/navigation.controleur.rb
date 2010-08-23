require 'app/vue/lanceur.fen.rb'
class NavigationController

  def initialize
    modules_actif = RhizomeModule.actifs
    @vue = Fen_lanceur.new modules_actif
    @@navigation = self 
  end
  
  
  def self.navigation
    @@navigation
  end
  
  def launch_module module_action
    begin
      module_starter = Kernel.const_get(module_action)
    rescue
      @vue.afficher_error_message "Pas de lanceur valide pour ce module"
      return
    end
      module_starter.start
  end
  

  
end
