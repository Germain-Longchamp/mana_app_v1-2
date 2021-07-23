class BoardController < ApplicationController
	before_action :authenticate_user!
	
	def index
		# GET ALL ENGINES
		@engines = Engine.where(:company_id => current_user.company_id).all

		# GET LAST 50 UPDATED ENGINES
		@engines_updated = Engine.where(:company_id => current_user.company_id).order(:updated_at).reverse_order().limit(50)
		
		# GET 20 NEXT ENGINES TO UPDATE
		@engines_next_update = Engine.where(:company_id => current_user.company_id).limit(30).order(:validity_end_date)
	end
end