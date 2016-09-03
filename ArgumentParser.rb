require 'optparse'
require 'optparse/date'

Options = Struct.new(:begin,:end,:times,:symbol)

class ArgumentParser
  def self.Parse options
    @args = Options.new
    parse_options options
    return @args
  end
end

def parse_options options
  configure_parser
  @parser.parse!(options)
end

def configure_parser
  @parser = OptionParser.new do |opts|
    @opts = opts
    configure_help
    perform_individual_options
  end
end

def configure_help
  @opts.banner = "Usage: jog.rb -b 2015-12-31 -e 2016-01-01 -t 17,18 -s btcexYAD"
  @opts.separator ""
  @opts.separator "Specific options:"
end

def perform_individual_options
  perform_begin_option
  perform_end_option
  perform_times_option
  perform_symbol_option
  perform_help_option
  end

def perform_begin_option
  @opts.on("-bDATE", "--begin=DATE", Date, "Date to begin with") do |date|
    @args.begin = date
  end
end

def perform_end_option
  @opts.on("-eDATE", "--end=DATE", Date, "Date to end with") do |date|
    @args.end = date
  end
end

def perform_times_option
  @opts.on("-tTIMES", "--times=TIMES", Array, "List of times to include") do |times|
    @args.times = times
  end
end

def perform_symbol_option
  @opts.on("-sSYMBOL", "--symbol=SYMBOL", String, "The bitcoin symbol to query") do |symbol|
    @args.symbol = symbol
  end
end

def perform_help_option
  @opts.on("-h", "--help", "Prints this help") do
    puts @opts
    exit
  end
end

