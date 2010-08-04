require 'test/unit'
#require 'rubygems'
#require 'mocha'
require 'chemins'


class NavigationControllerTest < Test::Unit::TestCase
  def setup
    @nav = NavigationController.new
  end
  def test_interface
    assert_equal true, @nav.respond_to?("launch_module")
    
  end
end
