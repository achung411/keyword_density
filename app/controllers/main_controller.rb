class MainController < ApplicationController
	def index
	end

	def show
		crawler = Crawler.new
		if params[:address]
			@address = params[:address]
			@keywords = crawler.obtain(@address, 10)

			respond_to do |format|
				format.html { render partial: "show" }
				format.json { render json: @keywords }
			end
		end
	end
end