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
    assert_equal true, @contro.respond_to?("add_view")
    assert_equal true, @contro.respond_to?("delete_view")
    assert_equal true, @contro.respond_to?("get_views")
    assert_equal true, @contro.respond_to?("get_view_model")
    assert_equal true, @contro.respond_to?("do_it!")
  end
 
  def test_add_view_et_get_views_et_get_view_model
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer).once
    @contro.add_view mavue, monmodele
    assert_equal [ mavue ], @contro.get_views
    assert_equal [mavue, monmodele], @contro.get_view_model(mavue)
  end

  def test_delete_view
    mavue = @contro.get_views[0]
    monmodele = @contro.get_view_model(mavue)[1]
    monmodele.expects(:delete_observer).once
    @contro.delete_view mavue
    assert_equal [], @contro.get_views
  end


  
  def test_get_view_model_sans_vue_et_modele
    mavue = mock('vue')
    assert_equal [], @contro.get_view_model(mavue)
  
  end
  
  def test_do_it!
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer).once
    @contro.add_view mavue, monmodele
    
    @contro.expects(:coucou).once
    @contro.do_it!(mavue, :coucou)
    monmodele.expects(:do_it!).with(:bidon)
    @contro.do_it!(mavue, :bidon)
    
  end


end

