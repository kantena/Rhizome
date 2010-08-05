require 'java'

Dir.glob("**/*.jar" ).map {|e| require e}
Dir.glob("app/modele/*.rb" ).map {|e| require e}
Dir.glob("app/controleur/*.rb" ).map {|e| require e}
Dir.glob("app/vue/*.rb" ).map {|e| require e}
Dir.glob("lib/**/*.rb" ).map {|e| require e}

