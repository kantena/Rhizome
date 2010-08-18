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
  
#  def self.presents
#    RhizomeModule.find(:all)    
#  end
  
  def self.distant *arg
    begin
      RhizomeModule.bdd_connection 'distant' 
      retour = RhizomeModule.send(*arg)
    rescue
      puts "connection distante non effective"
    end
    
    RhizomeModule.bdd_connection 'local'
    
    retour
  end

  def distant *arg
    begin
      RhizomeModule.bdd_connection 'distant' 
      retour = self.send(*arg)
    rescue
      puts "connection distante non effective"
    end
    
    RhizomeModule.bdd_connection 'local'
    
    retour
  end
  def to_hash
    ptihash={}
    #ptihash[:actif]=false
    #ptihash[:install]=false
    ptihash[:titre]= self.titre
    ptihash[:description]=self.description
    ptihash[:action]=self.action
    ptihash[:jar]=self.jar
    ptihash[:dep]=self.dep
    ptihash
  end
  
  def self.disponibles
    liste = RhizomeModule.distant(:find, :all) 
    locals = RhizomeModule.presents
    unless liste.nil?
      hash_locals = locals.map {|elt| elt.to_hash}
      liste.each do |elt|
        unless hash_locals.include?(elt.to_hash)
          locals << elt
        end
      end
    end
    locals 
  end
  
  def after_save
    obs_change true
    notif_tous self
    NavigationController.navigation.actifs_changes
  end
  
  def change_install
    self.actif=false if install  
    self.install = !install
    self.save  
  end
  
  def change_actif valeur = !actif
    update_attribute :actif, valeur
  end

 
  

  

  
end
