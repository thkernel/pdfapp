class PagesController < ApplicationController
	layout "front"

	def documents
		@posts = Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
	end
end