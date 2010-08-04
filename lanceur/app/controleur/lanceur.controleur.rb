


class Controleur_lanceur
  # Implementer ici les action qui doivent etre traitées par le
  # controleur. Si l'action retourne 'true', elle sera transmise
  # automatiquement au modele pour exécuter les règles métiers.
  def initialize vue
    @vue = vue
  end

  def btn_quitter_click
    @vue.dispose
  end
  

  
  def btn_liste_modules_click
    NavigationController.navigation.launch_module "Module_dispo_controleur"
  end  
  
end

