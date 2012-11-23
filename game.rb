require 'chingu'

class Game < Chingu::Window

		#constructor
		def initialize
			super
			self.input = {esc: :exit}
			@player = Player.create
		end
end

class Player < Chingu::GameObject

	#meta-constructor
	def setup
		@x, @y = 350, 400
		# @x = 350
		# @y = 400
		@image = Gosu::Image["squid.png"]
	end
end

Game.new.show
