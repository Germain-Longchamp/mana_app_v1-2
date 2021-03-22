class BoardController < ApplicationController
	def index
		@engines = Engine.all
		# GET LAST 10 UPDATED ENGINES
		@engines_updated = Engine.order(:updated_at).reverse_order().limit(10)
	end
end