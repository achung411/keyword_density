require 'nokogiri'
require 'open-uri'


class Crawler < ActiveRecord::Base
	def obtain(url, num_keywords)
		if url[0..6] != "http://"
			url = "http://" + url
		end
		
		page = Nokogiri::HTML(open(url))
		content = page.css('p', 'li', 'h1', 'h2', 'h3').collect { |node| node.text }.join(" ")
		text_record = Hash.new { |word, times| word[times] = 0 }
		temp = content.downcase.split(/[\s, *:*;*.*-]/).reject { |ch| ch == "" || ch == "&" }
		temp.each { |word| text_record[word] += 1 }
		text_record.sort_by { |word, quant| quant }.reverse[0..num_keywords - 1]
	end
end
