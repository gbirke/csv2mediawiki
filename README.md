csv2mediawiki
=============

This script converts CSV data to MediaWiki tables. 

This can be useful when using [Pandoc](http://johnmacfarlane.net/pandoc/), which does not support CSV as an input format.

The program uses input and output streams throughout so that the content does not have to be kept in memory.

Usage examples
--------------
All examples assume that you are in the csv2mediawiki directory

### Simple usage - HTML snippet

```bash
$ ./csv2mediawiki myfile.csv | pandoc -f mediawiki -t html -o myfile.html
```

This will just output an HTML snippet file with just the HTML code for the table.

### HTML page

```bash
$ ./csv2mediawiki myfile.csv | pandoc -f mediawiki -t html -o myfile.html -s -c style.css
```

This will output a standalone HTML file with header and body. Further author and title information could be provided with more command line arguments.

### Watch folder for CSV files and convert them automatically
Install the [inotify-tools][2] first, then run the `watch_folder.sh` shell script:

```bash
$ ./watch_folder.sh input_folder output_folder
```

Whenever a file is written in input_folder, the command from the HTML page section is run. The resulting file name is the CDV file name with an added `.html` suffix. It will be written in the `output` folder.

Possible extensions
-------------------
- Expose different CSV formats (semicolon-delimited, tab-delimited) as command line parameters.
- This script does not need to be limited to CSV files. Using the [PHPExcel][1] library the script could be used to make more table formats accessible to the pandoc converter


[1]: http://phpexcel.codeplex.com/
[2]: https://github.com/rvoicilas/inotify-tools
