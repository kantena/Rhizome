#!/usr/bin/jruby
require 'app/vue/lanceur.fen.rb'
require 'test/unit'
require 'rubygems'
require 'mocha'
require 'java'
require 'app/controleur/lanceur.controleur'

class Fen_lanceurTest < Test::Unit::TestCase
  
  def setup
    @navigateur = mock('navigateur')
    @fen = Fen_lanceur.new @navigateur
  end

  def test_interface_fen
    #test initial
    assert_equal true, @fen.respond_to?("visible!")
    assert_equal true, @fen.respond_to?("visible?")
    assert_equal true, @fen.respond_to?("do_it!")
    assert_equal true, @fen.respond_to?("add_fen")
    assert_equal true, @fen.respond_to?("delete_fen")
    assert_equal true, @fen.respond_to?("get_subfen")
    assert_equal true, @fen.respond_to?("fusion")
    assert_equal true, @fen.respond_to?("retrait")
    
  end
                                     
  def test_initialisation_de_la_fenetre
    navigateur = mock('navigateur')
    Controleur_lanceur.expects(:new).once
    fenetre = Fen_lanceur.new navigateur
    assert_equal navigateur, fenetre.instance_variable_get("@navigation")
    fenetre.dispose
  end
  
  def test_add_fen
    fenetre= mock('fenetre')
    @fen.expects(:fusion).once
    @fen.add_fen :bidon, fenetre 
    assert_equal fenetre, @fen.instance_variable_get("@enfants")[:bidon]
  end
  
  def test_delete_fen 
    fenetre= mock('fenetre')
    @fen.add_fen :bidon, fenetre
    @fen.expects(:splitter).once
    @fen.delete_fen :bidon
    vide = {}
    assert_equal vide, @fen.instance_variable_get("@enfants")
  end
  
  def test_get_subfen
    vide = {}
    assert_equal vide, @fen.get_subfen
    fenetre= mock('fenetre')
    @fen.add_fen :bidon, fenetre
    assert_equal fenetre, @fen.get_subfen[:bidon]
  end
  
  def test_do_it!
    @fen.expects('bidon').with(:coucou).once
    @fen.do_it! :bidon, :coucou
    @fen.expects('bidon').once
    @fen.do_it! :bidon
  end
  
  def test_do_it!_avec_methodes_inexistantes
    @fen.expects('truc').never
    @fen.do_it! :truc
    @fen.do_it! :truc, :coucou
  end
  
  def test_les_actions_sont_elles_mappees?
    fenetre = mock('fenetre')
    @fen.add_fen :mafen, fenetre
    fenetre.expects('do_it!').with(:bidon).once
    @fen.do_it! :bidon 
    
    @fen
  end
  
  def teardown
    @fen.dispose
  end
end

