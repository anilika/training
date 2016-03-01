#! /usr/bin/ruby

require 'thread/pool'
require 'timeout'
require 'openssl'
require 'nokogiri'
require 'open_uri_redirections'

THREADS = 100

def main(options)
  antizapret if options.empty?
  fname, proto = options[0], options[1]
  test_file_urls(fname, proto)
end

def test_file_urls(fname, proto)
  blocked_ok = []
  blocked_false = []
  pool = Thread.pool(THREADS)
  File.readlines(fname).each do |line|
    next if line.chomp.empty?
    page_title = String.new
    uri = proto + "://" + line.chomp
    pool.process {
      begin
        Timeout.timeout(1) {
          page = Nokogiri::HTML(open(uri, :allow_redirections => :all))
          page_title = page.css('title').text
        }
      rescue Timeout::Error, Errno::ECONNRESET, SocketError, ERR_CONNECTION_REFUSED
        blocked_ok.push(uri)
        next
      rescue StandardError => e
        blocked_false.push(uri)
        next
      end
      case page_title
      when "Сайт заблокирован" then blocked_ok.push(uri)
      else blocked_false.push(uri)
      end
    }
  end
  pool.shutdown
  unless !blocked_false.empty?
    puts "All sites are blocked"
  else
    puts "Some sites are not blocked"
    puts "================================================="
  end
  blocked_false.each {|uri| puts uri}
end

main ARGV
