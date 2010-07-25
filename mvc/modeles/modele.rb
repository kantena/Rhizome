#!/usr/bin/jruby
require 'test/unit'
require 'app/modele/coucou.modele.rb'
require 'rubygems'
require 'mocha'

class Modele_coucouTest < Test::Unit::TestCase
  def setup
    @modele = Modele_coucou.new
  end

  def test_interface
    assert_equal true, @modele.respond_to?("add_observer")
    assert_equal true, @modele.respond_to?("delete_observer")
    assert_equal true, @modele.respond_to?("count_observers")
    assert_equal true, @modele.respond_to?("changed?")
    assert_equal true, @modele.respond_to?("changed")
    assert_equal true, @modele.respond_to?("delete_observers")
    assert_equal true, @modele.respond_to?("notify_observers")
    assert_equal true, @modele.respond_to?("get_data")
    assert_equal true, @modele.respond_to?("do_it!")
  end
  
  def test_do_it!
    @modele.expects(:get_data).once
    @modele.do_it!(:get_data)
    assert_equal nil, @modele.do_it!(:bidon) 
  end


end

