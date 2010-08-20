class RhizomeModule < ActiveRecord::Base
  
  def self.bdd_connection site
    param = YAML::load(File.open("config/base.yml"))[site]
    if site == 'local'
      param['url'] = 'jdbc:h2:' << File.join($HOME, 'base', 'lanceur.db' ) << ";create=true"
    end
    RhizomeModule.establish_connection(param)
  end 
  RhizomeModule.bdd_connection 'local'
  include ObservableClasse
  
  named_scope :actifs, :conditions => {:actif, true}
  named_scope :presents
    
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
=begin     
    ptihash={}
    ptihash[:titre]= self.titre
    ptihash[:description]=self.description
    ptihash[:action]=self.action
    ptihash[:jar]=self.jar
    ptihash[:dep]=self.dep
    
=end    
ptihash = attributes
ptihash.delete 'id'
ptihash

  end

  def self.disponibles
    locals = RhizomeModule.presents
    distants = RhizomeModule.distant(:find, :all) 
    unless distants.nil?
    distants.each do |elt_dist|
      unless locals.map {|elt_loc| elt_loc.to_hash}.include?(elt_dist.to_hash)
        locals << RhizomeModule.create(elt_dist.to_hash) 
      end
    end
  end
    locals
  end
 
  def after_save
    obs_change true
    notif_tous self
  end
  
  def change_install
    update_attribute(:install, !install)
    Controleur_lanceur.controleur.update self
  end
  
  def change_actif 
    update_attribute :actif, !self.actif
  end
  
  def installation_locale
    require 'net/http'
    http = Net::HTTP.new('www.chez-andrei.fr')
    fichier = File.new File.join($HOME, jar), 'w'
    fichier.write http.get('java/' << jar).read_body 
    fichier.close
    http.finish
    require File.join($HOME, jar)
    


    
    
  end

end
