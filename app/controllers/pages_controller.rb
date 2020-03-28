class PagesController < ApplicationController
	layout "front"

	def documents
		@posts = Post.all
	end
end