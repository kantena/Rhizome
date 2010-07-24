

class Controleur_pivot
@@liste=[]
  def initialize
  
  end

  def add_view vue, modele
    @@liste << [vue, modele]
    modele.add_observer vue
  end
 
  def delete_view vue
    maliste=[]
    @@liste.each do |element|
      if element[0] == vue then
        element[1].delete_observer element[0]
      else
      	      maliste << element
      end
    end
    @@liste = maliste
  end
 
  def get_views
    @@liste.map { |element| element[0] }
  end

  def get_view_model vue
    resultat = @@liste.assoc(vue)
    resultat = [] if resultat == nil
    resultat
  end

  def do_it!(expediteur, *arg)
    return self.send(*arg) if self.respond_to?(arg[0])
    self.get_view_model(expediteur)[1].do_it!(*arg) 
  end


end

