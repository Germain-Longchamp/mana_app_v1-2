class BoardController < ApplicationController
	def index
		@engines = Engine.where(:company_id => current_user.company_id).all
		# GET LAST 10 UPDATED ENGINES
		@engines_updated = Engine.where(:company_id => current_user.company_id).order(:updated_at).reverse_order().limit(10)
	end
end