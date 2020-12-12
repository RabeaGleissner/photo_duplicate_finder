# Photo duplicate finder

A command-line program in Ruby which outputs the names and locations of any files with the same contents.

## How to run the program

`bundle install`

`ruby find_duplicates.rb`

By default the program is looking for a directory called `photos` in the root of this project.

If your directory has a different name, you can use the `--photos_directory ` flag to specify the name like this:

`ruby find_duplicates.rb --directory my_photos`

## How to run the tests

`rspec spec`

## Some thoughts

### Language choice

I've worked exclusively with JavaScript/Node.js for the last two years but I really enjoy working with Ruby, so I decided to use it for this program.
I guess I also wanted to show you that I know Ruby!
It's not the fastest language, so if speed was a concern when comparing large sets of files, it might be better to use a different language.

### Approach

My plan was to compare files by the content because I already knew that some of the file names and extensions had changed.

One concern was that when comparing the file contents as strings, the same images but with different file extensions would be represented as different strings.
When looking through the files, I also noticed that there were two photos with the same image but one had a smaller file size. (`Dec 2016/scary bear.JPG1 and `germany/staring contest.jpg`). These would also not be recognised as a duplicate by my algorithm.

But should they? Even if the visual was the same, these weren't the same images.
It could be that the client purposely saved both of these photos and they weren't duplicated as part of the merge.
So I made the decision that the same visual but with different file sizes or different extensions should be considered to be different files.

####  Three way merge

The instructions contain a prompt to think about a three-way merge with triplicates.

I wanted to get the basic functionality working first and consider this prompt then.
But when I ran the code to get the duplicated photos, I noticed in the output that there was one photo which had three copies.
I changed my algorithm slightly to allow for that, which also covered the prompt to think about the merge with triplicates.

#### Large set of photos

When using this program for a much larger set of photos, performance would need to be improved.

I usually try to make the code work first and then think about how to make it fast, so I used the same approach for this task.
First I measured how long the program currently took.
The average run time for 10 runs was 2.39 seconds. Pretty slow!

I figured that one of the bottle necks was probably my way of reading and comparing the files.
I was opening one file and then for each line checking if the line was included in another file.
I exited that loop as soon as a line was different, so I didn't iterate through all lines of each file.

However, some research showed that the Ruby `readlines` method that I was using, would actually scan the whole file first and then load each line into an array that I was iterating over.
There's also a Ruby method to read the whole file as a string.
I figured, if Ruby was already scanning the whole file anyway, maybe it would be faster to just load the whole content into a string directly.
And yes, measuring the speed after this change showed a huge improvement! The new average speed was now 0.34 seconds.

I was looking around my code a bit more to figure out how to increase its performance.
But I wanted to keep it readable and idiomatic, so in the end I didn't change anything else.

However, it might be good to communicate a bit more with the user if this code was to be used for large sets of files.
I could print a simple message to the console to say that the program has started or even give feedback about the percent completion of the program.
