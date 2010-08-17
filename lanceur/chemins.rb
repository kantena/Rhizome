require 'java'

if File.basename(__FILE__).include?('rb')
  require 'lib/rhizome.jar'
  require 'lib/h2.jar'
else
  $LOAD_PATH << "classpath:/fen/"
end



require 'yaml'
require 'rubygems'
gem 'activerecord-jdbc-adapter'
require 'jdbc_adapter'
require 'active_record'

require 'app/modele/observer.nouv'
require 'app/modele/module.modele.rb'
require 'app/controleur/lanceur.controleur.rb'
require 'app/controleur/module_dispo.controleur.rb'
require 'app/controleur/navigation.controleur.rb'
require 'app/vue/liste_dispo.fen.rb'
require 'app/vue/module_dispo.vue.rb'
require 'app/vue/module_mini_vue.vue.rb'

