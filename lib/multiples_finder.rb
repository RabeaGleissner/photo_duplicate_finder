# frozen_string_literal: true

class MultiplesFinder
  def initialize(files)
    @files_to_compare = files
    @sets_of_multiples = []
  end

  def find_multiples
    @files_to_compare.each do |file_to_compare|
      copies = find_copies_of_file(file_to_compare)
      copies.any? && @sets_of_multiples << copies.flatten.uniq
    end
    @sets_of_multiples
  end

  private

  def find_copies_of_file(file_to_compare)
    files_without_current(file_to_compare).each_with_object([]) do |file, multiples|
      if new_duplicate_identified?(file, file_to_compare)
        multiples << [file, file_to_compare]
      end
    end
  end

  def files_without_current(current)
    @files_to_compare.reject { |f| f == current }
  end

  def new_duplicate_identified?(file, file_to_compare)
    file_not_identified_as_duplicate?(file) && files_are_same?(file, file_to_compare)
  end

  def file_not_identified_as_duplicate?(file)
    !@sets_of_multiples.flatten.include?(file)
  end

  def files_are_same?(file, file_to_compare)
    File.read(file) == File.read(file_to_compare)
  end
end
