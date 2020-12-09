# frozen_string_literal: true

class FileLister
  def self.list_files(directory_name)
    Dir.glob("#{directory_name}/**/*").reject { |f| File.directory?(f) }
  end
end
