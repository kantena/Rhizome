


include_class 'fen.Launcher' 
include_class 'fen.Module_launcher'



class Fen_lanceur < Launcher
  def initialize modules_actif
    super()
    self.visible = true
    @controleur = Controleur_lanceur.new(self )
    modules_actif.each do |rhizette|
      rhizette.add_obs @controleur
    end
    
    item_demarrer_quitter.add_action_listener { |evt| @controleur.btn_quitter_click}
    item_modules_liste_modules.add_action_listener { |evt| @controleur.btn_liste_modules_click}

    
    affiche_liste_module modules_actif
  end
  

  def affiche_liste_module liste
    liste_modules = javax::swing::JPanel.new
    jScrollPane1.setViewportView liste_modules
    liste_modules.set_layout  javax.swing.BoxLayout.new(liste_modules, 1)
    liste.each do |module_actif|
      liste_modules.add(Module_mini_vue.new( module_actif))
    end    
    liste_modules.revalidate
  end
  
  def afficher_error_message texte
    javax.swing.JOptionPane.showMessageDialog(self, texte)

  end
  def visible?
    self.visible
  end
  
  def visible! booleen
    self.visible = booleen
  end
end

