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
    monmodele.expects(:add_observer).returns(true)
    assert @contro.add_vue mavue, monmodele
    assert_equal [mavue], @contro.get_vues
  end

  def test_rm_vue
    mavue = mock('vue')
    monmodele = mock('modele')
    monmodele.expects(:add_observer).returns(true)
    monmodele.expects(:rm_observer).returns(true)
    @contro.add_vue mavue, monmodele
    @contro.rm_vue mavue
    assert_equal [], @contro.get_vues
  end

  def test_get_vue_modele
    monmodele = mock('modele')
    mavue = mock('vue')
    monmodele.expects(:add_observer).returns(true)
    assert @contro.add_vue mavue, monmodele
    assert_equal [mavue, monmodele], @contro.get_vue_modele(mavue)

  end



end

