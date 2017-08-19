# !/usr/local/bin/ruby -w
require_relative "../config/environment"

def reload!
load_all "lib"
end

c = Console.new
binding.pry

1
