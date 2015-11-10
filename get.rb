# get.rb
#

require 'net/http'

pages = %w( www.rubycentral.com www.slashdot.org www.google.com )

threads = []

for page_to_fetch in pages do
	threads << Thread.new(page_to_fetch) { |url|
	    url = page_to_fetch
		h = Net::HTTP.new(url,80)
		puts "Fetching #{url}"
		(resp,data) = h.get('/', nil)
		puts "Got #{url} : #{resp.message}"
	}
end
puts "Num threads = #{threads.size}"

threads.each { |thr| thr.join }

