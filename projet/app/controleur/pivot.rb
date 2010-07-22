class Controleur_pivot
  def initialize
    @liste=[]
  end

  def ajouter_vue vue, modele
    @liste << [vue, modele]
    modele.add_observer(vue)
  end
 
  def retirer_vue vue
    maliste=[]
    @liste.each do |element|
      if element[0] == vue then
        element[1].rm_observer element[0]
      else
      	      maliste << element
      end
    end
    @liste = maliste
  end
 
  def lire_vues
    @liste.map { |element| element[0] }
  end

  def lire_vue_modele vue
    resultat = @liste.assoc(vue)
    resultat = [] if resultat == nil
    resultat
  end



end

