require 'test/unit'
require '../../app/vue/<nom-vue>'
require 'mocha'



#test de la vue
class Test_vue_<nom-vue> < Test::Unit::TestCase
  def setup
    fenetre = Fen::new
    Fen.expects(:affiche).with(:resultat).return(:resultat)

    @vue=Vue_<nom-vue>::new fenetre

  end

  def test_interface_vue
    #test initial
    assert_equal true, @vue.respond_to? "update"
    assert_equal true, @vue.respond_to? "visible!"
    assert_equal true, @vue.respond_to? "visible?"
  end
  def test_visible
    @vue.visible! false
    assert_equal false, @vue.visible?
    @vue.visible! true
    assert_equal true, @vue.visible?
  end
  def test_update
    modele = Mod.new
    Mod.expects(:get_data).return(true)
    assert_equal true, @vue.update modele
end

