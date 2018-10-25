#!/bin/bash

cat $1 > /dev/tty

sparql=$(head -$(grep -n "===DESCRIPTION===" $1 | cut -d":" -f1 )  $1 | grep -v === | tr -c "[:print:]" " " ) 

echo java -jar kbox-v0.0.1-alpha3-RC16.jar -kb "http://purl.org/pcp-on-web/ontology,http://purl.org/pcp-on-web/dataset" -sparql \'$sparql\' -install > cmd.sh.tmp
bash cmd.sh.tmp
