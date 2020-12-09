# Photo duplicate finder

A command-line program in Ruby which outputs the names and locations of any files with the same contents.

## How to run the program

`ruby find_duplicates.rb`

By default the program is looking for a directory called `photos` in the root of this project.

If your directory has a different name, you can use the `--photos_directory ` flag to specify the name like this:

`ruby find_duplicates.rb --photos_directory my_photos`

## How to run the tests

`rspec spec`
