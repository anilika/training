
require "nokogiri"
require "open-uri"
require "open_uri_redirections"
require "timeout"
BLOCKED_PAGE = "http://forbidden.podryad.tv/"

module WorkingUrl
	def check_open_url(url)
	  begin
	    complete_results = Timeout.timeout(1) do
        Nokogiri::HTML(open(url, :allow_redirections => :all))
      end
    rescue Timeout::Error
      false
    rescue
      false
    else
      true
    end
  end

  def open_url(url)
    Nokogiri::HTML(open(url, :allow_redirections => :all))
  end

	def get_title(page)
		page.css("title").text
	end
end

class CheckForbiddenUrls
	include WorkingUrl
	attr_accessor :not_open_page, :not_blocked_page
	attr_reader :proto, :blocked_title

	def initialize(file_urls, proto)
	  @not_open_page = []
	  @not_blocked_page = []
		@proto = proto + "://"
		@blocked_title = get_title(open_url(BLOCKED_PAGE))
		check_urls(file_urls)
	end

	def check_urls(file_urls)
		File.readlines(file_urls).each do |line|
			url = proto + line.to_s.chomp!
			unless check_open_url(url)
			  not_open_page << line
			  next
			else
			  res = open_url(url)
			  not_blocked_page << line unless get_title(res) == blocked_title
		  end
		end
		print not_blocked_page
		puts "------"
		print not_open_page
	end
end

my_check = CheckForbiddenUrls.new("./urls.txt", "http")
