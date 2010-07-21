class Controleur_<nom-controleur>
  def initialize
    @liste=[]
  end

  def add_vue vue, modele
    @liste << [vue, modele]
    modele.add_observer(vue)
  end

  def rm_vue vue
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

  def get_vues
    @liste.map { |element| element[0] }
  end

  def get_vue_modele vue
    @liste.assoc vue
  end

  def vue_visible? vue
    vue.visible?
  end

  def vue_visible! vue, etat
    vue.visible! etat
  end


end

