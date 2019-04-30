# Manga to pdf
Ruby code to compress jpg folders to pdf by volumes

## Prerequisites

### File structure

This code presumes that all jpg files are part of a volume of a book, therefore inside a folder.
And this book is part of a series, so it should be inside another folder. 

Here is an example tree graph:

```
book/
|--volume_01/
|  |--page_01.jpg
|  |--...
|--...
```
  
The name of the first folder will be used for all pdf (you may change the name to your liking beforehand),
and the last number found in each volume's name will be used to identify each pdf.
More importantly, pages should be ordered by name. Although that depends on how it was scanned.

### Tools

1. `ruby`
2. `rmagick` gem (which itself requires imagemagick)
3. `fileutils` gem (in case it is not installed)

## How to use
run 
```
ruby manga_to_pdf.rb path_of_book
```
in your command line.

## Note:
As a second argument, you can pass a truthy value in ruby (e.g. `1`) 
and it will delete each volume folder after it compresses it to pdf.
To save disk space this will remove it permanently , so it won't be 
in your computer's trash bin. Only use it if you know what you're doing.
