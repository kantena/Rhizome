require 'app/vue/lanceur.fen.rb'
require 'app/modele/module.modele'

class NavigationController
  def initialize
    modules_actif = RhizomeModule.actifs
    @vue = Fen_lanceur.new self, modules_actif
    @vue.visible! true
    @fenetres = {}
  end
  
  def launch_module module_action
    get_const(module_action)
  end
  
  def btn_liste_modules_click
    puts 'menu list_modules à été cliqué'
    @vue.fusion Module_launcher.new
  end
  
end
