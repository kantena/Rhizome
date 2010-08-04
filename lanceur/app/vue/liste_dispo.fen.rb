include_class 'fen.Liste_dispo'
class Liste_module_dispo_Vue < Liste_dispo
  def initialize contro, liste
    super()
    @controleur = contro

    self.panel = javax::swing::JPanel.new
    scp_liste.setViewportView self.panel
    self.panel.set_layout  javax.swing.BoxLayout.new(self.panel, 1)
    liste.each do |module_dispo| 
      p module_dispo
      self.panel.add(Module_dispo_vue.new(@controleur, module_dispo))
    end    
   self.panel.revalidate
 
    self.visible = true
    end
end
