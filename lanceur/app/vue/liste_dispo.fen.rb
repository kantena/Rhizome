include_class 'fen.Liste_dispo'

class Liste_module_dispo_Vue < Liste_dispo
  attr_reader :controleur
  def initialize contro, liste
    super()
    @controleur = contro
    self.add_window_listener { |evt| @controleur.fermeture if evt.get_id == 201}
    affiche_list liste
  end


    def affiche_list liste
      self.panel = javax::swing::JPanel.new
      scp_liste.setViewportView self.panel
      self.panel.set_layout  javax.swing.BoxLayout.new(self.panel, 1)
      liste.each do |module_dispo|         
        self.panel.add(e = Module_dispo_vue.new(@controleur, module_dispo))
        module_dispo.add_obs e
      end
      self.panel.revalidate   
      self.visible = true
    end
    

end
