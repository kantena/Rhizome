include_class 'fen.Module_dispo'

class Module_dispo_vue < Module_dispo
  


  def initialize contro, modul
    super()
    @controleur = contro
    update modul
    btn_install.add_action_listener { |evt| @controleur.click_installation modul}
    chb_activer.add_action_listener { |evt| @controleur.click_activation modul}
  end
  
  def update modul
    jtitre.set_text modul.titre
    jdescription.set_text modul.description 
    chb_activer.selected= modul.actif
    unless modul.install ==  nil
      if modul.install
        btn_install.set_text "Desinstaller"
      else
        btn_install.set_text "Installer"
      end
      chb_activer.enabled=(modul.install)  
    end
  end
  
end
