require_relative 'lib/args_parser.rb'

directory_name = ArgsParser.photos_directory(ARGV)
puts directory_name
