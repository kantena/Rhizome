


class Controleur_lanceur
  
  def initialize vue
    @vue = vue
    @@controleur = self
  end

  def self.controleur
    @@controleur
  end
  
  def update modul
    if modul.actif
      modul.add_obs self
    else
      modul.rm_obs self
    end
    actifs = RhizomeModule.actifs
    @vue.affiche_liste_module actifs
  
  end

  def btn_quitter_click
    @vue.dispose
  end
  

  
  def btn_liste_modules_click
    NavigationController.navigation.launch_module "Module_dispo_controleur"
  end  
  
end

