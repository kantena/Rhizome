class Module_dispo_modele < RhizomeModule
  attr_accessor :modul, :installe, :actif  
  def initialize titre, description, start_action, installe, actif
    super titre, description, start_action
    @installe = installe
    @actif = actif
  end
  
  def self.disponibles
    [ Module_dispo_modele.new("Méga calculette",
                  "Ceci est une méga calculette, qui arrive même à faire 2 + 2 = 4! Etonnant!!", 
                  "Calculette", false, true),
    Module_dispo_modele.new("dfhdf calculette",
      "Ceci est une mégadfbhdf calculette, qui arrive même à faire 2 + 2 = 4! Etonnant!!", 
                  "Calculette", false, true)]

  end
  
end
