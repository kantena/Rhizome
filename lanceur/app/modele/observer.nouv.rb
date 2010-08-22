module ObservableClasse

  #
  # Add +observer+ as an observer on this object. +observer+ will now receive
  # notifications.
  #
  def add_obs(observer)
    @observer_paires = [] unless defined? @observer_paires
    unless observer.respond_to? :update
      raise NoMethodError, "observer needs to respond to `update'" 
    end
    @observer_paires.push observer
  end

  #
  # Delete +observer+ as an observer on this object. It will no longer receive
  # notifications.
  #
  def rm_obs(observer)
    @observer_paires.delete observer if defined? @observer_paires
  end

  #
  # Delete all observers associated with this object.
  #
  def rm_obss
    @observer_paires.clear if defined? @observer_paires
  end

  #
  # Return the number of observers associated with this object.
  #
  def nb_obss
    if defined? @observer_paires
      @observer_paires.size
    else
      0
    end
  end

  #
  # Set the obs_change state of this object.  Notifications will be sent only if
  # the obs_change +state+ is +true+.
  #
  def obs_change(state=true)
    @observer_etat = state
  end

  #
  # Query the obs_change state of this object.
  #
  def obs_change?
    if defined? @observer_etat and @observer_etat
      true
    else
      false
    end
  end

  #
  # If this object's obs_change state is +true+, invoke the update method in each
  # currently associated observer in turn, passing it the given arguments. The
  # obs_change state is then set to +false+.
  #
  def notif_tous(*arg)
    if defined? @observer_etat and @observer_etat
      if defined? @observer_paires
	for i in @observer_paires.dup
	  i.update(*arg)
	end
      end
      @observer_etat = false
    end
  end

  def cpy_obs modul
    @observer_paires = modul.observer_paires
  end
  
  #private
  
  def observer_paires
    @observer_paires
  end
    
  
end
