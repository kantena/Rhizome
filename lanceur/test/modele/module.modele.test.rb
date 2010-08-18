#!/usr/bin/jruby
require 'test/test_helper' 


class Modules_actifsTest < Test::Unit::TestCase

  def test_rien_au_debut  
    
    assert_equal [], RhizomeModule.actifs
  end
  
  def test_distant_vide
    assert_equal [], RhizomeModule.distant(:find, :all)
  end
  
  def test_distant_une_rizette_dispo
    a = RhizomeModule.distant(:create, {:titre => "coucou"}) 
    assert_equal [a], RhizomeModule.distant(:find, :all)
  end  
  
  def test_une_rizette_active
    a = RhizomeModule.create(:actif => true)
    assert_equal [a], RhizomeModule.actifs

  end  
  
  def test_une_rizette_non_active
    a = RhizomeModule.create(:actif => false)
    assert_equal [], RhizomeModule.actifs
    
  end
  
  def test_une_rizette_active_et_une_non_active
    a = RhizomeModule.create(:actif => true)
    RhizomeModule.create(:actif =>false)
    assert_equal [a], RhizomeModule.actifs
  end
  
  def setup
    @ma_liste_locale = RhizomeModule.presents
    RhizomeModule.delete_all

    @ma_liste_distante = RhizomeModule.distant(:find, :all)
    RhizomeModule.distant :delete_all
    
  end
  
  def teardown
    RhizomeModule.delete_all
    RhizomeModule.distant :delete_all
    begin
      @ma_liste_distante.each {|elt| elt.distant(:save)}
    rescue
    end
    @ma_liste_locale.each {|elt| elt.save}
  end
end

    

    

