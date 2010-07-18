require 'java'
require 'fenetres/<nom-vue>.jar
include_class '<nom-class>'

class Fen_<nom-vue> < <nom-vue>
	def initialize
	
	end
end

class Vue_<nom-vue> < Pattern::Interface_observer
	def initialize
		@fen = Fen_<nom-vue>.new

	end

	def update

	end
end

