# frozen_string_literal: true

require_relative 'lib/args_parser'
require_relative 'lib/file_lister'
require_relative 'lib/multiples_finder'
require_relative 'lib/output_formatter'

directory_name = ArgsParser.new(ARGV).photos_directory
multiples = MultiplesFinder.new(FileLister.list_files(directory_name)).find_multiples
formatted_output = OutputFormatter.new(multiples, directory_name).format

puts formatted_output
