class RhizomeModule < ActiveRecord::Base
  def self.bdd_connection site
    param = YAML::load(File.open("config/base.yml"))[site]
    #p param
    RhizomeModule.establish_connection(param)
    
  end 

  RhizomeModule.bdd_connection 'local'
  include ObservableClasse
  

  named_scope :actifs, :conditions => {:actif, true}
  named_scope :presents
  
  def self.distant *arg
    begin
      RhizomeModule.bdd_connection 'distant'     
    rescue
      puts "connection distante non effective"
    end
    retour = RhizomeModule.send(*arg)
    RhizomeModule.bdd_connection 'local'
    retour
  end
  
  def self.disponibles
    RhizomeModule.distant :presents
  end
  
  def after_save
    obs_change true
    notif_tous self
  end
  
  def change_install valeur = !install
    if valeur
      install= true
    else
      install= false
      actif= false
    end  
    save  
  end
  
  def change_actif valeur = !actif
    update_attribute :actif, valeur
  end

 
  

  

  
end
