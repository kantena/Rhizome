#!/usr/bin/jruby
require 'test/unit'
require 'app/controleur/<nom-controleur>.rb'
require 'rubygems'
require 'mocha'

class Controleur_<nom-controleur>Test < Test::Unit::TestCase
  def setup
    @contro = Controleur_<nom-controleur>.new

  end

  def test_interface
    assert true
    assert_equal true, @contro.respond_to?("ajouter_vue")
    assert_equal true, @contro.respond_to?("retirer_vue")
    assert_equal true, @contro.respond_to?("lire_vues")
    assert_equal true, @contro.respond_to?("lire_vue_modele")
  end
 
  def test_lire_vues
    def @contro.set_liste obj
      @liste = obj
    end
    monmodele = mock('modele')
    mavue = mock('vue')
    @contro.set_liste [ [mavue, monmodele] ]
    assert_equal [ mavue ], @contro.lire_vues
    @contro.set_liste [ [mavue, monmodele], [mavue, monmodele] ]
    assert_equal [ mavue, mavue ], @contro.lire_vues
  end

  def test_ajouter_vue
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer).with(mavue).returns(mavue)
    assert_equal mavue, @contro.ajouter_vue(mavue, monmodele)
    assert_equal [mavue], @contro.lire_vues
  end

  def test_retirer_vue
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer)
    monmodele.expects(:rm_observer)
    @contro.ajouter_vue mavue, monmodele   
    @contro.retirer_vue mavue
    assert_equal [], @contro.lire_vues
  end

  def test_lire_vue_modele
    monmodele = mock('modele')
    mavue = mock('vue')
    monmodele.expects(:add_observer).returns(true)
    assert @contro.ajouter_vue(mavue, monmodele)
    assert_equal [mavue, monmodele], @contro.lire_vue_modele(mavue)
  end
  
  def test_lire_vue_modele_sans_vue_et_modele
    mavue = mock('vue')
    assert_equal [], @contro.lire_vue_modele(mavue)
  
  end



end

