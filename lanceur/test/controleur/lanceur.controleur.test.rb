#!/usr/bin/jruby
require 'test/unit'
#require 'rubygems'
#require 'mocha'

class Controleur_coucouTest < Test::Unit::TestCase
  def setup
    @contro = Controleur_coucou.new
  end

  def test_interface
    assert true
    assert_equal true, @contro.respond_to?("btn_quitter_click")
    assert_equal true, @contro.respond_to?("element_liste_lanceur_selectionnee")

  end
 
end

