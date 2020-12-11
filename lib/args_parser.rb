# frozen_string_literal: true

class ArgsParser
  DEFAULT_DIRECTORY_NAME = 'photos'
  DIRECTORY_FLAG = '--directory'

  def initialize(arguments)
    @arguments = arguments
    @directory_flag_index = @arguments.find_index(DIRECTORY_FLAG)
  end

  def photos_directory
    if @arguments.empty?
      return DEFAULT_DIRECTORY_NAME
    end

    raise 'Invalid options given' unless @directory_flag_index && @arguments.length >= 2

    @arguments[@directory_flag_index + 1]
  end
end
