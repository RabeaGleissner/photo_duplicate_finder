# frozen_string_literal: true

require_relative 'lib/args_parser'
require_relative 'lib/file_lister'
require_relative 'lib/multiples_finder'

directory_name = ArgsParser.photos_directory(ARGV)
files = FileLister.list_files(directory_name)
multiples = MultiplesFinder.new(files).find_multiples
multiples.each do |multiple|
  puts '********************'
  puts multiple
end
