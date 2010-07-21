#!/usr/bin/jruby
require 'test/unit'
require 'app/vue/<nom-vue>.rb'
require 'rubygems'
require 'mocha'



#test de la vue
class Vue_<nom-vue>Test < Test::Unit::TestCase
  def setup
    controleur = Object.new
    @vue = Vue_<nom-vue>::new controleur
  end

  def test_interface_vue
    #test initial
    assert_equal true, @vue.respond_to?("update")
    assert_equal true, @vue.respond_to?("visible!")
    assert_equal true, @vue.respond_to?("visible?")
  end

  def test_visible
    @vue.visible! false
    assert_equal false, @vue.visible?
    @vue.visible! true
    assert_equal true, @vue.visible?
  end

  def test_update
    modele = Object.new
    modele.expects(:get_data).returns(true)
    assert_equal true, @vue.update(modele)
  end
end

