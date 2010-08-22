include_class 'fen.Module_dispo'

class Module_dispo_vue < Module_dispo
  


  def initialize contro, modul
    super()
    @controleur = contro
    @modul = modul
    btn_install.add_action_listener { |evt| message_controleur :click_installation}
    chb_activer.add_action_listener { |evt| message_controleur :click_activation}
    update modul

  end
  
  def message_controleur message
    @controleur.send message, @modul
  end
  
  def update modul
    @modul = modul
    jtitre.set_text modul.titre
    jdescription.set_text modul.description 
    chb_activer.selected= modul.actif

    unless modul.install ==  nil
      if modul.install
        btn_install.set_text "Desinstaller"
      else
        btn_install.set_text "Installer"
      end
      chb_activer.enabled= modul.install  
    end
  end
  
end
