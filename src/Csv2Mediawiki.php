<?php

namespace Birke\Table2Pandoc;

class Csv2Mediawiki {

    /**
     * Convert CSV stream to MediaWiki stream (a format pandoc understands)
     * 
     * @param resource $in Input Stream (CSV)
     * @param resource $out Output Stream (MediaWiki)
     */
    function convert($in, $out) {
        fwrite($out, "{|\n");
        $head = fgetcsv($in);
        foreach($head as $name) {
            fwrite($out, sprintf("!%s\n", $name));
        }
        while($line = fgetcsv($in)) {
            fwrite($out, "|-\n");
            foreach($line as $field) {
                fwrite($out, sprintf("|%s\n", $field));
            }
        }
        fwrite($out, "|}\n");
    }    
}
