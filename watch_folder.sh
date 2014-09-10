
#!/bin/bash

# This script uses the inotifytools to watch an input folder for CSV files
# and convert them with Pandoc 

# Change these options if you want to add metadata info or use another 
# output format than HTML5
PANDOC_OPTS="-c style.css -s -f mediawiki -t html5"
OUTPUT_SUFFIX=.html

INDIR=$1
OUTDIR=$2

if [ -z "$INDIR" -o -z "$OUTDIR" ]; then
    echo "Please supply input and output directory"
    exit 1
fi

match=`expr match "$OUT" "$IN"`
if [ $match -gt 0 ]; then
    echo "Output dir must not be inside input dir"
    exit 1
fi

if [ "${OUTDIR:-1}" != "/" ]; then
    OUTDIR="$OUTDIR/"
    echo "od=$OUTDIR"
fi

mkdir -p $OUTDIR

inotifywait -mr --format '%w %f' -e close_write $INDIR | while read dir file; do

    FILECHANGE=${dir}${file}
    if [ -s $FILECHANGE ]; then
        OUT_FILE=$OUTDIR$file$OUTPUT_SUFFIX

        ./csv2mediawiki $FILECHANGE | pandoc $PANDOC_OPTS -o $OUT_FILE    
    fi
done