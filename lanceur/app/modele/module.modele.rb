
class RhizomeModule < ActiveRecord::Base
  conf_fic = "/home/kantena/rhizome/lanceur/config/base.yml"
  establish_connection(YAML::load(File.open(conf_fic))['RhizomeModule'])
  include ObservableClasse

  named_scope :actifs, :conditions => {:actif, true}
  named_scope :disponibles
  
  def after_save
    obs_change true
    notif_tous self
  end
  
  def change_install valeur = !install
    update_attribute :install, valeur
    
  end
  
  def change_actif valeur = !actif
    update_attribute :actif, valeur
  end
end
