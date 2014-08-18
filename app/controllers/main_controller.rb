class MainController < ApplicationController
	def index
		crawler = Crawler.new
		@keywords = crawler.obtain('http://www.codingdojo.com', 10)
		# render :json => @keyword
	end
end
