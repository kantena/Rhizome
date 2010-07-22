# pattern Observer pour le modele



module Pattern
  class InterfaceObserver
    def update(qui)

    end
  end

  class Observable

    def initialize
      @changed=false
      @obs=[]
    end

    def add_observer(o)
      @obs << o #if o.respond_to?("update") fonctionne pas avec le mock
    end

    def rm_observer(o)
      @obs.delete(o)
    end
    
    def notify
      var_pour_test = false
      if self.changed?
        @obs.each {|o| var_pour_test = o.update(self)}
        self.changed_false
      end
      var_pour_test
    end
    
    def changed!
      @changed = true
    end
    def changed?
      @changed
    end

    def changed_false
      @changed = false
    end

    def nb_observer
      @obs.length
    end
    
    def get_data
    end
    
  end
end
  

