# frozen_string_literal: true

DELIMITER = "\n********\n"

class OutputFormatter
  def initialize(sets_of_multiples, directory_name)
    @sets_of_multiples = sets_of_multiples
    @directory_name = directory_name
  end

  def format
    if @sets_of_multiples.empty?
      return "There are no duplicates in your folder called '#{@directory_name}'!"
    end

    "These photos are duplicates:\n#{DELIMITER}#{duplicated_photos}"
  end

  private

  def duplicated_photos
    @sets_of_multiples.map { |set| set.join("\n") }.join(DELIMITER)
  end
end
