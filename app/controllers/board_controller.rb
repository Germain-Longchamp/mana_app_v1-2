class BoardController < ApplicationController
	def index
		@engines = Engine.all
	end
end