include_class 'fen.Module_dispo'

class Module_dispo_vue < Module_dispo
  def initialize contro, modul
    super()
    @controleur = contro
    self.jtitre.set_text modul.titre
    self.jdescription.set_text modul.description 
    @action = modul.action
    btn_install.add_action_listener { |evt| puts "installation de " << modul.titre}
    chb_activer.add_change_listener { |evt| puts "Activé :" << chb_activer.isPressed}
  end
end
