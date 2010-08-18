require 'app/vue/lanceur.fen.rb'
require 'ftools'


class NavigationController
  def initialize
    modules_actif = RhizomeModule.actifs
    @vue = Fen_lanceur.new modules_actif
    @@navigation = self 
    $HOME = ENV['HOME'].dup << "/rhizome"
    if  Dir[$HOME] == []
      Dir.mkdir($HOME)
      Dir.mkdir($HOME << '/base')
      File.syscopy 'lib/lanceur.db.h2.db', $HOME << 'base/lanceur.db.h2.db'
      File.syscopy 'lib/lanceur.db.trace.db', $HOME << 'base/lanceur.db.trace.db'

      $LOAD_PATH << $HOME
      
  end
  
  def actifs_changes
    @vue.affiche_liste_module RhizomeModule.actifs
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
