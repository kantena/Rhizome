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
  
      @obs << o if o.respond_to?("update")
 
    end

    def delete_observer(o)
      @obs.delete(o)
    end
    def notify
      if self.changed?
        @obs.each {|o| o.update(self)}
        self.clear_changed
      end

    end
    def changed!
      @changed = true
    end
    def changed?
      @changed
    end

    def clear_changed
      @changed = false
    end

    def count_observer
      @obs.length
    end
  end
end
  

