# frozen_string_literal: true

require 'args_parser'

describe ArgsParser do
  it 'returns directory name' do
    arguments = ['--directory', 'my_photos']
    args_parser = ArgsParser.new(arguments)

    expect(args_parser.photos_directory).to eq('my_photos')
  end

  it 'returns default directory name when no arguments given' do
    arguments = []
    args_parser = ArgsParser.new(arguments)

    expect(args_parser.photos_directory).to eq('photos')
  end

  it 'ignores unknown flags when correct flag is given' do
    arguments = ['--help', '--directory', 'my_photos']
    args_parser = ArgsParser.new(arguments)

    expect(args_parser.photos_directory).to eq('my_photos')
  end

  it 'errors when flag is given by no second argument' do
    arguments = ['--directory']
    args_parser = ArgsParser.new(arguments)

    expect { args_parser.photos_directory }.to raise_exception('Invalid options given')
  end

  it 'errors when only unknown flag is given with second argument' do
    arguments = ['--photo_directory', 'my_photos']
    args_parser = ArgsParser.new(arguments)

    expect { args_parser.photos_directory }.to raise_exception('Invalid options given')
  end

  it 'errors when only unknown flag is given' do
    arguments = ['--photo_directory']
    args_parser = ArgsParser.new(arguments)

    expect { args_parser.photos_directory }.to raise_exception('Invalid options given')
  end
end
