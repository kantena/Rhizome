#!/usr/bin/jruby
require 'test/unit'
require 'app/vue/<nom-vue>.rb'
require 'rubygems'
require 'mocha'



#test de la vue
class Vue_<nom-vue>Test < Test::Unit::TestCase
  def setup
    @controleur = mock 'controleur'
    @fenetre = mock 'vue'
    @vue = Vue_<nom-vue>.new @controleur, @fenetre
  end

  def test_interface_vue
    
    #test initial
    assert_equal true, @vue.respond_to?("update")
    assert_equal true, @vue.respond_to?("visible!")
    assert_equal true, @vue.respond_to?("visible?")
    assert_equal true, @vue.respond_to?("set_fenetre")
    assert_equal true, @vue.respond_to?("do_it!")
  end

  def test_visible
    @fenetre.expects(:visible!).with(false).returns(false)
    @fenetre.expects(:visible!).with(true).returns(true)
    @fenetre.expects(:visible?).returns(true)
    assert_equal false, @vue.visible!(false)
    assert_equal true, @vue.visible!(true)
    assert_equal true, @vue.visible?

  end

  def test_update

    modele = mock 'modele'
    modele.expects(:get_data).once
    @fenetre.expects(:affiche).once
    @vue.update(modele)
  end

  def test_set_fenetre
    def @vue.get_fenetre
      @fen
    end
    autre_fenetre=mock 'fenetre'
    @vue.set_fenetre autre_fenetre
    assert_equal autre_fenetre, @vue.get_fenetre  
  end
  
    def test_do_it!
      @vue.expects(:coucou).once
      @vue.do_it!(:coucou)
      @controleur.expects(:do_it!).with(:bidon)
      @vue.do_it!(:bidon)
    
  end
  
end

