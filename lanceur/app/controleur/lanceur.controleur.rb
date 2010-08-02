


class Controleur_lanceur < Mvc::Controleur_mvc
  # Implementer ici les action qui doivent etre traitées par le
  # controleur. Si l'action retourne 'true', elle sera transmise
  # automatiquement au modele pour exécuter les règles métiers.
  def initialize vue
    @vue = vue

  end

  def btn_quitter_click
    puts 'menu_quitter à été cliqué'
  end
  

  def element_liste_lanceur_selectionnee 
    puts 'element_liste_lanceur_selectionnee'

  end
  
  def ajout_module_test

    @vue.fusion Module_launcher.new
  end
  
  def retrait_module_test
 
  end
  
end

