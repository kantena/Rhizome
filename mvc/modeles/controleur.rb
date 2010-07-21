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
    @liste = @liste.inject([]) do |maliste, element|
      if element[0] == vue then
        element[1].rm_observer element[0]
      else
        maliste << i
      end
    end
  end

  def get_vues
    @liste.map { |element| element[0] }
  end

  def get_vue_modele vue
    @liste.assoc vue
  end

  def vue_visible?
  end

  def vue_visible!
  end


end

