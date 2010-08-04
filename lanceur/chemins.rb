require 'java'
require 'lib/mvc_framework'

Dir.glob("app/**/*.jar" ).map {|e| require e}
Dir.glob("app/modele/*.rb" ).map {|e| require e}
Dir.glob("app/controleur/*.rb" ).map {|e| require e}
Dir.glob("app/vue/*.rb" ).map {|e| require e}
Dir.glob("modules/**/*.rb" ).map {|e| require e}
