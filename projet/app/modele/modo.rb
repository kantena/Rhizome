require 'observer'

class Modele_modo 
  include Observable
  
    def get_data
      "coucou"
    end
    
    def do_it! *arg
      return self.send(*arg) if self.respond_to?(arg[0])
    end
    
end
