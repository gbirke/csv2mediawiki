csv2mediawiki
=============

This script converts CSV data to MediaWiki tables. 

This is useful when using Pandoc (http://johnmacfarlane.net/pandoc/), which does not support CSV as an input format.

The program uses input and output streams throughout so that the content does not have to be kept in memory.

Usage examples
--------------

### Simple usage - HTML snippet

```bash
$ csv2mediawiki myfile.csv | pandoc -f mediawiki -t html -o myfile.html
```

This will just output an HTML snippet file with just the HTML code for the table.

```bash
$ csv2mediawiki myfile.csv | pandoc -f mediawiki -t html -o myfile.html -s -c style.css
```

This will output a standalone HTML file with header and body. Further author and title information could be provided with more command line arguments.

Possible extensions
-------------------
- Expose different CSV formats (semicolon-delimited, tab-delimited) as command line parameters.
- This script does not need to be limited to CSV files. Using the [PHPExcel][1] library the script could be used to make more table formats accessible to the pandoc converter


[1]: http://phpexcel.codeplex.com/
