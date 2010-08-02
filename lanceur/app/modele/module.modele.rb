class RhizomeModule
  attr_reader :titre, :description, :action
   
  def initialize titre, description, start_action 
    @titre = titre
    @action = start_action
    @description = description
  end

  def self.actifs
    [RhizomeModule.new("Premier Module", "Ma description pour voir un peu", 'PremierMain'), 
    RhizomeModule.new("Second Module", "Et là voilà ce qu'il se passe...", 'SecondMain'), 
    RhizomeModule.new("Troisième Module", "Et là on fait des petit truc tranquillement", 'TroisiemeMain'),]
  end
end
