#! /usr/bin/ruby

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
  attr_reader :file_name, :proto

  STOP_PAGE = "http://forbidden.podryad.tv"

  def initialize(file_name, proto)
    @file_name = file_name
    @proto = proto
  end

  def test_urls(file_name, proto)
  end

  def get_url_page(url)
  end

  def get_page_title(page)
  end

  def titles_equal?(page_title, stop_title)
  end

  def print_nonblocked(non_blocked)
  end
end

my_rkn_data = RknData.new(ARGV)
my_test = RknTest.new(my_rkn_data.file_name, my_rkn_data.proto)
