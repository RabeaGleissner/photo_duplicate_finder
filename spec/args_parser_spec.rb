require 'args_parser'

describe ArgsParser do
  it 'returns directory name' do
    arguments = ['--directory', 'my_photos']

    expect(ArgsParser.photos_directory(arguments)).to eq('my_photos')
  end

  it 'returns default directory name when no arguments given' do
    arguments = []

    expect(ArgsParser.photos_directory(arguments)).to eq('photos')
  end

  it 'returns default directory name for flag without option' do
    arguments = ['--directory']

    expect(ArgsParser.photos_directory(arguments)).to eq('photos')
  end

  it 'ignores unknown flags when correct flag is given' do
    arguments = ['--help', '--directory', 'my_photos']

    expect(ArgsParser.photos_directory(arguments)).to eq('my_photos')
  end

  it 'errors when only unknown flag is given' do
    arguments = ['--photo_directory', 'my_photos']

    expect {ArgsParser.photos_directory(arguments)}.to raise_exception('Invalid options given')
  end
end
