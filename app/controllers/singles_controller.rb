class SinglesController < ApplicationController
	layout "front"
	def show

		@pdf = Rails.public_path.join("/pdf/test.pdf")
		puts "DIR : #{@pdf}"
		
	end
end