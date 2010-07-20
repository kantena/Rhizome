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
    assert_equal true, @contro.respond_to?("add_vue")
    assert_equal true, @contro.respond_to?("rm_vue")
    assert_equal true, @contro.respond_to?("get_vues")
    assert_equal true, @contro.respond_to?("get_vue_modele")
    assert_equal true, @contro.respond_to?("vue_visible?")
    assert_equal true, @contro.respond_to?("vue_visible!")
  end

  def test_get_vues
    def @contro.set_liste obj
      @liste = obj
    end
    monmodele = mock('modele')
    mavue = mock('vue')
    @contro.set_liste [ [mavue, monmodele] ]
    assert_equal [ mavue ], @contro.get_vues
  end

  def test_add_vue
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer).with(mavue).returns(mavue)
    assert_equal mavue, @contro.add_vue(mavue, monmodele)
    assert_equal [mavue], @contro.get_vues
  end

  def test_rm_vue
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer)
    monmodele.expects(:rm_observer)
    @contro.add_vue mavue, monmodele   
    @contro.rm_vue mavue
    assert_equal [], @contro.get_vues
  end

  def test_get_vue_modele
    monmodele = mock('modele')
    mavue = mock('vue')
    monmodele.expects(:add_observer).returns(true)
    assert @contro.add_vue(mavue, monmodele)
    assert_equal [mavue, monmodele], @contro.get_vue_modele(mavue)

  end
  
  def test_vue_visible?
    mavue = mock('vue')
    mavue.expects(:visible?).returns(true)
    monmodele = mock('modele')
    monmodele.expects(:add_observer)
    @contro.add_vue mavue, monmodele   
    assert @contro.vue_visible?(mavue)
  end
        
  def test_vue_visible!
    mavue = mock('vue')
    mavue.expects(:visible!).with(true).returns(true)
    mavue.expects(:visible!).with(false).returns(false)
    monmodele = mock('modele')
    monmodele.expects(:add_observer)
    @contro.add_vue mavue, monmodele   
    assert_equal false, @contro.vue_visible!(mavue, false)
    assert_equal true, @contro.vue_visible!(mavue, true)
  end



end

