#!/usr/bin/jruby
require 'test/test_helper' 


class Modules_actifsTest < Test::Unit::TestCase

  def test_aucun_enregistrement_actif_dans_la_base_locale 
    assert RhizomeModule.actifs.empty?
  end
  
  def test_aucun_enregistrement_dans_la_base_distante
    assert RhizomeModule.distant(:find, :all).empty?
  end
  
  def test_une_rizette_dispo_dans_la_base_distante
    rhizette =  RhizomeModule.distant(:create, {:titre => "coucou"})
    assert_equal [rhizette], RhizomeModule.distant(:find, :all)
  end  
  
  def test_une_rizette_active_dans_la_base_locale
    rhizette = RhizomeModule.create(:actif => true)
    assert_equal [rhizette], RhizomeModule.actifs
  end  
  
  def test_une_rizette_non_active
    RhizomeModule.create(:actif => false)
    assert_equal [], RhizomeModule.actifs
    
  end
  
  def test_une_rizette_active_et_une_non_active
    rhizette = RhizomeModule.create(:actif => true)
    RhizomeModule.create(:actif =>false)
    assert_equal [rhizette], RhizomeModule.actifs
  end
  
  def test_conversion_de_rhizette_avec_to_hash
    mon_hash = {  :titre => 'mon titre',
                  :description => 'blabla',
                  :jar => 'mon.jar',
                  :action => 'MaClasse',
                  :dep => 'dep'}
    rhizette = RhizomeModule.create(mon_hash)
    assert_equal mon_hash, rhizette.to_hash
  end
  
  def test_union_des_bases_locale_et_distante_sans_enregistrements
    assert RhizomeModule.disponibles.empty?
  end
  
  def test_union_des_bases_locale_et_distante_sans_enregistrements_dans_local
    rhizette = RhizomeModule.distant :create
    assert_equal [rhizette], RhizomeModule.disponibles
  end
  
  def test_union_des_bases_locale_et_distante_avec_des_enregistrements_identiques
    rhizette_distante = RhizomeModule.distant(:create, :titre => 'coucou', :actif => false)
    rhizette_locale = RhizomeModule.create(:titre => 'coucou', :actif => true)
    assert_equal [rhizette_locale], RhizomeModule.disponibles
  end
  
  def test_union_des_bases_locale_et_distante_avec_des_enregistrements_identiques_plus_un_dans_le_distant
    rhizette_distante = RhizomeModule.distant(:create, :titre => 'coucou', :actif => false)
    rhizette_locale = RhizomeModule.create(:titre => 'coucou', :actif => true)
    autre_rhizette_distante = RhizomeModule.distant :create
    
    assert_equal [rhizette_locale, autre_rhizette_distante], RhizomeModule.disponibles
  end
  
  def test_union_des_bases_locale_et_distante_avec_des_enregistrements_identiques_plus_un_dans_le_distant_bdd_distante_offline
    RhizomeModule.stubs(:distant).returns(nil)
    rhizette_distante = RhizomeModule.distant(:create, :titre => 'coucou', :actif => false)
    rhizette_locale = RhizomeModule.create(:titre => 'coucou', :actif => true)

    
    assert_equal [rhizette_locale], RhizomeModule.disponibles
  end
  
  def setup
#    @ma_liste_locale = RhizomeModule.presents
    RhizomeModule.delete_all

#    @ma_liste_distante = RhizomeModule.distant(:find, :all)
    RhizomeModule.distant :delete_all
    
  end
  
  def teardown
    RhizomeModule.delete_all
    RhizomeModule.distant :delete_all
  end
end

    

    

