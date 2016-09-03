#!/usr/bin/env ruby

require_relative 'ArgumentParser'

def main 
  options = ArgumentParser.Parse ARGV

  puts "#{options.begin.to_s}\n
        #{options.end.to_s}\n}
        #{options.times.to_s}\n}
        #{options.symbol.to_s}\n}"
end

main
