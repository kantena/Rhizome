require 'java'


include_class 'fen.Launcher' 
include_class 'fen.Module_launcher'



class Fen_lanceur < Launcher
  def initialize navigation, modules_actif
    super()
    self.visible = true
    @navigation = navigation
    @controleur = Controleur_lanceur.new(self)
    item_demarrer_quitter.add_action_listener { |evt| @controleur.btn_quitter_click}
    item_modules_liste_modules.add_action_listener { |evt| @navigation.btn_liste_modules_click}

    
    affiche_liste_module modules_actif
    
    
    #jAjout2.add_action_listener { |e| micro_c.do_it! :plus2};
    #jRetire3.add_action_listener { |e| micro_c.do_it! :moins3};
  end

  def affiche_liste_module liste
    liste_modules = javax::swing::JPanel.new
    jScrollPane1.setViewportView liste_modules
    liste_modules.set_layout  javax.swing.BoxLayout.new(liste_modules, 1)
    liste.each do |module_actif|
      liste_modules.add(Module_mini_vue.new(@navigation, module_actif))
    end    

  end
  
  def visible?
    self.visible
  end
  
  def visible! booleen
    self.visible = booleen
  end
end

