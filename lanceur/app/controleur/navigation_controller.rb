require 'app/vue/lanceur.fen.rb'



class NavigationController
  def initialize
    modules_actif = RhizomeModule.actifs
    @vue = Fen_lanceur.new self, modules_actif
    @vue.visible! true
    @fenetres = {}
  end
  
  def launch_module module_action
    puts module_action
    module_starter = Kernel.const_get(module_action)
    if module_starter
      module_starter.start
    else
      @vue.afficher_error_message "Pas de lanceur valide pour ce module"
    end
  end
  
  def btn_liste_modules_click
    puts 'menu list_modules à été cliqué'
    @vue.fusion Module_launcher.new
  end
  
end
