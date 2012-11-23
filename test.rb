require 'gosu'
require 'chingu'

class GameWindow < Gosu::Window
	def initialize
		super 600, 450, false
		self.caption = "My First Game!"

		@background_image = Gosu::Image.new(self, "galaxy.jpg", true)
		@player = Player.new(self)
	end

	def update

		if outside_window?
			@x_vel = -@x_vel
			@y_vel = -@y_vel
		end


		if button_down? Gosu::KbLeft
			@player.turn_left
		end

		if button_down? Gosu::KbRight
			@player.turn_right
		end

		if button_down? Gosu::KbUp
			@player.accelerate
		end

		if button_down? Gosu::KbDown
			@player.reverse
		end

		@player.move




		# if button_down? Gosu::KbUp
		# 	@player.move_up


		# if button_down? Gosu::KbDown
		# 	@player.move_down
		# end

		# if button_down? Gosu::KbRight
		# 	@player.move_right
		# end

		# if button_down? Gosu::KbLeft
		# 	@player.move_left
		# end
	end

	def draw
		@player.draw
		@background_image.draw(0,0,0)
	end
end

class Player
	def initialize(window)
		@image = Gosu::Image.new(window, "squid.png", false)
		@x = 100
		@y = 100
		@x_vel = 0
		@y_vel = 0
		@angle = 0
		end

		def turn_left
			@angle -= 8.0
		end

		def turn_right
			@angle += 8.0
		end

		def accelerate
			@x_vel += Gosu::offset_x(@angle, 0.5)
			@y_vel += Gosu::offset_y(@angle, 0.5)
		end

		def reverse
			@x_vel -= Gosu::offset_x(@angle, 0.5)
			@y_vel -= Gosu::offset_y(@angle, 0.5)
		end

		def move
			@x += @x_vel
			@y += @y_vel
			@x %= 640
			@y %= 480

			@x_vel *= 0.99
			@y_vel *= 0.99
		end

		# def move_up
		# 	@y -= 1
		# end

		# def move_down
		# 	@y += 1
		# end

		# def move_right
		# 	@x += 1
		# end

		# def move_left
		# 	@x -= 1
		# end


		def draw
			@image.draw_rot(@x, @y, 1, @angle)
		end
	end
window = GameWindow.new
window.show