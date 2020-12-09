# frozen_string_literal: true

class ArgsParser
  DEFAULT_DIRECTORY_NAME = 'photos'
  DIRECTORY_FLAG = '--directory'

  def self.photos_directory(arguments)
    if arguments.length < 2
      return DEFAULT_DIRECTORY_NAME
    end

    directory_flag_index = arguments.find_index(DIRECTORY_FLAG)

    raise 'Invalid options given' unless directory_flag_index

    arguments[directory_flag_index + 1]
  end
end
