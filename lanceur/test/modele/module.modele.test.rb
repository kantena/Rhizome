#!/usr/bin/jruby
require 'test/test_helper' 

class Modules_actifsTest < Test::Unit::TestCase
  def setup 
    @mabase = RhizomeModule.disponibles
    RhizomeModule.delete_all
  end
  def test_rien_au_debut  
    
    assert_equal [], RhizomeModule.actifs
  end
  
  def test_une_rizette_active
    a = RhizomeModule.new(:actif => true)
    a.save
    assert_equal [a], RhizomeModule.actifs
    RhizomeModule.delete_all
  end  
  
  def test_une_rizette_non_active
    a = RhizomeModule.new(:actif => false)
    a.save
    assert_equal [], RhizomeModule.actifs
    
  end
  
  def test_une_rizette_active_et_une_non_active
    a = RhizomeModule.new(:actif => true)
    a.save
    RhizomeModule.create(:actif =>false)
    assert_equal [a], RhizomeModule.actifs
  end
  
  def teardown
    @mabase.each {|elt| elt.save}
  end
  
end
