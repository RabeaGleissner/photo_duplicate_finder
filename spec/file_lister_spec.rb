# frozen_string_literal: true

require 'file_lister'

TEST_DIRECTORY = 'spec/test_directory'

describe FileLister do
  before do
    FileUtils.mkdir_p("#{TEST_DIRECTORY}/sub_dir")
    FileUtils.touch("#{TEST_DIRECTORY}/photo1.jpg")
    FileUtils.touch("#{TEST_DIRECTORY}/sub_dir/photo2.jpg")
    FileUtils.touch("#{TEST_DIRECTORY}/sub_dir/photo3.png")
  end

  after do
    FileUtils.rm_rf(TEST_DIRECTORY)
  end

  it 'gets all file paths' do
    expect(FileLister.list_files(TEST_DIRECTORY).length).to eq(3)
    expect(FileLister.list_files(TEST_DIRECTORY)).to include("#{TEST_DIRECTORY}/photo1.jpg")
    expect(FileLister.list_files(TEST_DIRECTORY)).to include("#{TEST_DIRECTORY}/sub_dir/photo2.jpg")
    expect(FileLister.list_files(TEST_DIRECTORY)).to include("#{TEST_DIRECTORY}/sub_dir/photo3.png")
  end
end
