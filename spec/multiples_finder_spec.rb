# frozen_string_literal: true

require 'multiples_finder'

describe MultiplesFinder do
  it 'does not find any duplicates' do
    files_without_duplications = [
      'spec/test_files/tree.jpg',
      'spec/test_files/incredible.jpg'
    ]
    multiples_finder = MultiplesFinder.new(files_without_duplications)
    expect(multiples_finder.find_multiples).to eq([])
  end

  it 'outputs the locations of one set of duplicates' do
    duplicate_files = [
      'spec/test_files/starfish.jpg',
      'spec/test_files/starfish-2.jpg'
    ]
    multiples_finder = MultiplesFinder.new(duplicate_files)
    duplicates = multiples_finder.find_multiples
    expect(duplicates.length).to equal(1)
    expect(duplicates[0]).to include(duplicate_files[0])
    expect(duplicates[0]).to include(duplicate_files[1])
  end

  it 'outputs the locations of two sets of duplicates' do
    duplicate_files = [
      'spec/test_files/incredible.jpg',
      'spec/test_files/animals/incredible-3.jpg',
      'spec/test_files/starfish-2.jpg',
      'spec/test_files/tree.jpg',
      'spec/test_files/starfish.jpg'
    ]
    multiples_finder = MultiplesFinder.new(duplicate_files)
    duplicates = multiples_finder.find_multiples
    expect(duplicates.length).to equal(2)
    expect(duplicates[0]).to include('spec/test_files/incredible.jpg')
    expect(duplicates[0]).to include('spec/test_files/animals/incredible-3.jpg')
    expect(duplicates[1]).to include('spec/test_files/starfish-2.jpg')
    expect(duplicates[1]).to include('spec/test_files/starfish.jpg')
  end

  it 'outputs the locations of a set of triplicates' do
    duplicate_files = [
      'spec/test_files/incredible.jpg',
      'spec/test_files/incredible-2.jpg',
      'spec/test_files/animals/incredible-3.jpg'
    ]
    multiples_finder = MultiplesFinder.new(duplicate_files)
    triplicates = multiples_finder.find_multiples
    expect(triplicates.length).to equal(1)
    expect(triplicates[0]).to include('spec/test_files/incredible.jpg')
    expect(triplicates[0]).to include('spec/test_files/incredible-2.jpg')
    expect(triplicates[0]).to include('spec/test_files/animals/incredible-3.jpg')
  end
end
