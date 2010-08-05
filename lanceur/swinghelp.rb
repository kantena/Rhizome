#!/usr/bin/jruby
#require 'app/vue/lanceur.fen.rb'
require 'java'
#require 'app/vue/jar/rhizome.jar'

#include_class 'fen.Module_launcher'
# include_package 'javax.swing'
#  include_package 'javax.swing.event'
#  include_class 'javax.swing.BoxLayout'


  app =  javax::swing::JFrame.new
  # scro = javax::swing::JScrollPane.new
  # scrp =  javax::swing::JPanel.new
# 
# 
  # glt = BoxLayout.new scrp, 1 
# scrp.set_layout glt
 # scrp.add Module_launcher.new 
 # scrp.add Module_launcher.new 
 # scrp.add Module_launcher.new 
 # scrp.add Module_launcher.new 
 # scrp.add Module_launcher.new 
 # scrp.add Module_launcher.new 
 # scro.setViewportView scrp 
# app.add scro
 # 
 base = []
 app.methods.sort.inject(base) do |base, elm| 
 if !elm.include?("__") #&&
     #elm.include?("") #&& 
      # #elm.include?("add") && 
     # # elm.include?("_")
      puts elm
    end
 end
 app.exit


