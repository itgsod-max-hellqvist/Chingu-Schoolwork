require 'chingu'

class Game < Chingu::Window

		#constructor
		def initialize
			super
			self.input = {esc: :exit}
			@background_image = Gosu::Image.new(self, "galaxy.jpg", true)
			@player = Player.create
		end
		def draw
		@player.draw
		@background_image.draw(0,0,0)
	end
	
end

class Player < Chingu::GameObject

	#meta-constructor
	def setup
		@x, @y = 350, 400
		# @x = 350
		# @y = 400
		@image = Gosu::Image["squid.png"]
		self.input = {
			holding_left: :left,
			holding_right: :right,
			holding_up: :up,
			holding_down: :down
		}
	end
	def left
		unless @x - 26 <= 0
		@x -= 3
	end
	end

	def right
		unless @x + 26 >= 800
		@x += 3
	end
	end

	def down
		unless @y + 26 >= 600
		@y += 3
	end
	end

	def up
		unless @y - 26 <= 0
		@y -= 3
	end
	end
end

Game.new.show
