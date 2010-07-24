#!/usr/bin/jruby
require 'test/unit'
require 'app/modele/modo.rb'
require 'rubygems'
require 'mocha'

class Modele_<nom-modele>_test < Test::Unit::TestCase
  def setup
    @modele = Modele_<nom-modele>.new
  end

  def test_interface
    assert_equal true, @modele.respond_to?("add_observer")
    assert_equal true, @modele.respond_to?("delete_observer")
    assert_equal true, @modele.respond_to?("delete_observers")
    assert_equal true, @modele.respond_to?("count_observers")
    assert_equal true, @modele.respond_to?("changed?")
    assert_equal true, @modele.respond_to?("changed")
    assert_equal true, @modele.respond_to?("notify_observers")
    assert_equal true, @modele.respond_to?("get_data")
    assert_equal true, @modele.respond_to?("do_it!")
  end 
  
  def test_add_observer_et_count_observer
    mavue = mock('vue')
    mavue.stubs(:update)
    @modele.add_observer mavue 
    assert_equal 1, @modele.count_observers
  
  end
  
  def test_delete_observer_et_count_observers
    mavue = mock('vue')
    mavue.stubs(:update)
    @modele.add_observer mavue 

    @modele.delete_observer mavue
    assert_equal 0, @modele.count_observers    
  end
  
  def test_des_methodes_d_etat_de_changed
    assert_equal false, @modele.changed?
    @modele.changed
    assert_equal true, @modele.changed?
    @modele.changed false
    assert_equal false, @modele.changed?
  end
 
  def test_notify_observers
    mavue = mock('vue')
    mavue.expects('update').once
    @modele.add_observer mavue   
    @modele.notify_observers
    @modele.changed
    @modele.notify_observers    
  end
  
  def test_do_it!
    assert_equal "coucou", @modele.do_it!(:get_data)
    assert_equal nil, @modele.do_it!(:bidon)
    
  end


end

