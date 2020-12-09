# frozen_string_literal: true

require_relative 'lib/args_parser'
require_relative 'lib/file_lister'

directory_name = ArgsParser.photos_directory(ARGV)
files = FileLister.list_files(directory_name)
puts files
