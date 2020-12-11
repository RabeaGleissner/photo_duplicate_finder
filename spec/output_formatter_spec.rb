# frozen_string_literal: true

require 'output_formatter'

describe OutputFormatter do
  it 'returns message for when there are no duplicates' do
    output_formatter = OutputFormatter.new([])
    expect(output_formatter.format).to eql('There are no duplicates!')
  end

  it 'formats output' do
    duplicate_files = [[
      'photos/animals/incredible.jpg',
      'photos/animals in winter/incredible 3!.jpg'
    ], [
      'photos/starfish 2.jpg',
      'photos/starfish.jpg',
      'photos/animals/starfish.jpg'
    ]]

    output_formatter = OutputFormatter.new(duplicate_files)
    expected_output = "These photos are duplicates:

********
photos/animals/incredible.jpg
photos/animals in winter/incredible 3!.jpg
********
photos/starfish 2.jpg
photos/starfish.jpg
photos/animals/starfish.jpg"

    expect(output_formatter.format).to eq(expected_output)
  end
end
