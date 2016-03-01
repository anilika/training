#! /usr/bin/ruby

require 'timeout'
require 'net/http'
require 'nokogiri'
require 'open_uri_redirections'

class RknData
  attr_accessor :file_name, :proto

  def initialize(options)
    if check_options
      @file_name = get_file_name(options)
      @proto = get_proto(options)
    end
  end

  def check_options(options)
    options.size == 2
  end

  def get_file_name(options)
    options[0]
  end

  def get_proto(options)
    options[1]
  end
end

class RknTest
  attr_reader :file_name, :proto, :stop_page_title
  attr_accessor :non_blocked_pages

  STOP_PAGE = "http://forbidden.podryad.tv"

  def initialize(file_name, proto)
    @file_name = file_name
    @proto = proto
    @non_blocked_pages = []
    @stop_page_title = get_page_title(get_url_page(STOP_PAGE))
    test_urls
  end

  private

  def test_urls
    File.readlines(file_name).each do |line|
      url = form_url(line)
      next unless page = get_url_page(url)
      page_title = get_page_title(page)
      non_blocked_pages.push(url) unless titles_equal?(page_title)
    end
    print_nonblocked unless non_blocked_pages.empty?
  end

  def form_url(line)
    proto + "://" + line.chomp
  end

  def get_url_page(url)
    begin
      Timeout.timeout(1) {
        page = Nokogiri::HTML(open(url, :allow_redirections => :all))
      }
    rescue Timeout::Error, SocketError, Errno::ECONNRESET
      #ERR_CONNECTION_REFUSED
      false
    rescue StandardError => e
      non_blocked_pages.push(url)
      false
    end
  end

  def get_page_title(page)
    page.css('title').text
  end

  def titles_equal?(page_title)
    page_title == stop_page_title
  end

  def print_nonblocked
    puts "Some URLs are not blocked"
    puts "================================================="
    non_blocked_pages.each do |url|
      puts url
    end
  end
end

#my_rkn_data = RknData.new(ARGV)
#my_test = RknTest.new(my_rkn_data.file_name, my_rkn_data.proto)
my_test = RknTest.new('urls.txt', 'http')
