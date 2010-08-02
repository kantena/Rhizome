require 'java'


include_class 'fen.Launcher' 
include_class 'fen.Module_launcher'
include_class 'javax.swing.BoxLayout'


class Fen_lanceur < Launcher
  def initialize navigation, modules_actif
    super()
    self.visible = false 
    @enfants = {}
    @navigation = navigation
    @controleur = Controleur_lanceur.new(self)
    self.item_demarrer_quitter.add_action_listener { |evt| @controleur.btn_quitter_click}
    self.item_modules_liste_modules.add_action_listener { |evt| @navigation.btn_liste_modules_click}
    men_ajout = javax::swing::JMenuItem.new
    men_ajout.set_text "Ajout module"
    men_retrait = javax::swing::JMenuItem.new
    men_retrait.set_text "Retrait module"    
    self.menu_modules.add men_ajout
    self.menu_modules.add men_retrait 
    men_ajout.add_action_listener { |evt| @controleur.ajout_module_test}
    men_retrait.add_action_listener {|evt| @controleur.retrait_module_test}
    
    self.liste_modules.set_layout  BoxLayout.new(self.liste_modules, 1)
    
    modules_actif.each do |module_actif|
      module_panel = Module_launcher.new
      module_panel.jrhizette.set_text(module_actif.titre) 
      module_panel.jblabla.set_text(module_actif.description)
      module_panel.btn_lance.add_action_listener {|evt| @navigation.launch_module(module_actif.action)}
      self.liste_modules.add(module_panel)
    end
    
    #jAjout2.add_action_listener { |e| micro_c.do_it! :plus2};
    #jRetire3.add_action_listener { |e| micro_c.do_it! :moins3};
  end

  def visible?
    self.visible
  end
  
  def visible! booleen
    self.visible = booleen
  end
  
  def do_it! action, *arg
    self.send(action, *arg)  if self.respond_to?(action)
    @enfants.map {|cle, enfant| enfant.do_it!(action, *arg)} 
  end
  
  def add_fen etiquette, fenetre
    @enfants[etiquette]=fenetre
    self.fusion
  end
  
  def fusion fenetre
    self.liste_modules.add fenetre
    self.liste_modules.revalidate
    puts "composants du panel" 
    self.liste_modules.get_components.each { |elm| puts elm}
  end
  
  def retrait fenetre  
    self.liste_modules.get_componentsmap {|elt| self.liste_modules.remove(elt)}
    self.liste_modules.revalidate
    puts "composants du panel" 

  end
  
  def delete_fen etiquette
    self.splitter etiquette
    @enfants.delete etiquette
    
  end
  
  def get_subfen
    @enfants
  end
end

