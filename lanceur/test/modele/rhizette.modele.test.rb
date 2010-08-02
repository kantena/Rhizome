#!/usr/bin/jruby
require 'app/modele/rhizette.modele.rb'
require 'test/unit'
require 'rubygems'
require 'mocha'
require 'java'


class Modele_rhizetteTest < Test::Unit::TestCase
  
  def setup
    nom = "Ma premiere rhizette"
    blabla="blabla"
    @rhizette = Modele_rhizette.new nom, blabla
  end

  def test_accesseurs
    #test initial
    assert_equal true, @rhizette.respond_to?("nom=")
    assert_equal true, @rhizette.respond_to?("blabla=")
    assert_equal true, @rhizette.respond_to?("location=")
    assert_equal true, @rhizette.respond_to?("class_vue_nom=")
    assert_equal true, @rhizette.respond_to?("nom")
    assert_equal true, @rhizette.respond_to?("blabla")
    assert_equal true, @rhizette.respond_to?("location")
    assert_equal true, @rhizette.respond_to?("class_vue_nom")
    assert_equal true, @rhizette.respond_to?("notify")
  end
  
  def test_initialize
    assert_equal "Ma premiere rhizette", @rhizette.nom
    assert_equal "blabla", @rhizette.blabla

  end
  
  def test_accessors
    @rhizette.location= "ici"
    assert_equal "ici", @rhizette.location
    @rhizette.class_vue_nom= "moi"
    assert_equal "moi", @rhizette.class_vue_nom
    @rhizette.expects('changed').at_least 4
    @rhizette.expects('notify_observers').at_least 4
    assert_equal "fait rizette", @rhizette.nom= "fait rizette"
    assert_equal "fait rizette", @rhizette.blabla= "fait rizette"
    assert_equal "fait rizette", @rhizette.location= "fait rizette"
    assert_equal "fait rizette", @rhizette.class_vue_nom= "fait rizette"
    
  end

  
end

