class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	
	layout 'dashboard'
	
	def index
		

		
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	


	
	

end