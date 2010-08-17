#!/usr/bin/jruby
require 'test/test_helper' 

class Modules_actifsTest < Test::Unit::TestCase
  def setup 
    @mabase_locale = RhizomeModule.presents
    p @mabase_locale
    RhizomeModule.delete_all
    @mabase_distante = RhizomeModule.distant(:presents)
    p @mabase_distante
    #RhizomeModule.distant :delete_all
  end
  
  def test_rien_au_debut  
    
    assert_equal [], RhizomeModule.actifs
  end
  
  def test_distant_vide
    assert_equal [], RhizomeModule.disponibles
  end
  
  def test_distant_une_rizette_active
    RhizomeModule.distant :create, :actif => true
    assert_equal 1, RhizomeModule.distant(:actifs).size

  end  
  
  def test_une_rizette_active
    a = RhizomeModule.new(:actif => true)
    a.save
    assert_equal [a], RhizomeModule.actifs

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
    RhizomeModule.delete_all
    @mabase_locale.each {|elt| elt.save}
    #RhizomeModule.distant :delete_all
    @mabase_distante.each {|elt| elt.distant :save}
    
  end
  
end
