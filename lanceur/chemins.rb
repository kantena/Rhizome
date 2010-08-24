require 'java'
require 'ftools'
$HOME = "rhizome_local"

if  Dir[$HOME].empty?
  p "coucou"
  Dir.mkdir($HOME)
  $HOME = File.expand_path($HOME)
  Dir.mkdir(File.join($HOME, 'base'))
  Dir.mkdir(File.join($HOME, 'modules'))
  File.syscopy 'lib/lanceur.db.h2.db', File.join($HOME, 'base')
  File.syscopy 'lib/lanceur.db.trace.db', File.join($HOME, 'base')

end
$HOME = File.expand_path($HOME)
  $LOAD_PATH << $HOME


if File.basename(__FILE__).include?('rb')
  require 'lib/rhizome.jar'
  require 'lib/h2.jar'
else
  $LOAD_PATH << "classpath:/fen/"
end



#require 'yaml'
require 'rubygems'
gem 'activerecord-jdbc-adapter'
require 'jdbc_adapter'
require 'active_record'

require 'app/modele/observer.nouv'
require 'app/controleur/lanceur.controleur.rb'
require 'app/controleur/module_dispo.controleur.rb'
require 'app/controleur/navigation.controleur.rb'
require 'app/modele/module.modele.rb'
require 'app/vue/liste_dispo.fen.rb'
require 'app/vue/module_dispo.vue.rb'
require 'app/vue/module_mini_vue.vue.rb'

#liste = RhizhomeModule.actifs
#begin
  # liste.each do |rhizette|
    # require File.join($HOME, 'modules', rhizette.jar[0..-5], rhizette.jar)
    # require '' << rhizette.jar << chemins.rb
  # end
# rescue
# end

