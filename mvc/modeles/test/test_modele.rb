#!/usr/bin/jruby
require 'test/unit'
require 'app/modele/<nom-modele>.rb'
require 'rubygems'
require 'mocha'

class Modele_<nom-modele>Test < Test::Unit::TestCase
  def setup
    @modele = Modele_<nom-modele>.new
  end

  def test_interface
    assert_equal true, @modele.respond_to?("add_observer")
    assert_equal true, @modele.respond_to?("rm_observer")
    assert_equal true, @modele.respond_to?("nb_observer")
    assert_equal true, @modele.respond_to?("changed?")
    assert_equal true, @modele.respond_to?("changed!")
    assert_equal true, @modele.respond_to?("changed_false")
    assert_equal true, @modele.respond_to?("notify")
    assert_equal true, @modele.respond_to?("get_data")
  end
  
  def test_add_observer_et_nb_observer
    mavue = mock('vue')
    #mavue.expects('update')
    @modele.add_observer mavue 
    assert_equal 1, @modele.nb_observer
    def @modele.get_observer
      @obs
    end
    assert_equal [ mavue ], @modele.get_observer    
  end
  
  def test_rm_observer_et_nb_observer
    mavue = mock('vue')
    #mavue.expects('update')
    @modele.add_observer mavue 
    def @modele.get_observer
      @obs
    end
    @modele.rm_observer mavue
    assert_equal 0, @modele.nb_observer
    assert_equal [], @modele.get_observer    
  end
  
  def test_des_methodes_d_etat_de_changed
    assert_equal false, @modele.changed?
    @modele.changed!
    assert_equal true, @modele.changed?
    @modele.changed_false
    assert_equal false, @modele.changed?
  end
 
  def test_notify
    mavue = mock('vue')
    mavue.expects('update').returns(true)
    @modele.add_observer mavue
    assert_equal false, @modele.notify
    @modele.changed!
    assert_equal true, @modele.notify    
  end


end

