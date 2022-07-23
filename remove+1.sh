#!/bin/bash
channels=$(awk '/(+1)/' rexguide1.xml | awk -F '"' '{for (i=6;i<NF;i+=3) printf "\"%s\"", $i; print ""}' |  uniq | sed 's/"//g')
for i in $channels; do
gawk -i inplace -v ch="$i +1" '
/<programme/{index($0,"channel=\""ch"\"") ? prg=1 : prg=0}
    prg && /<category /{ next }1 
' rexguide1.xml 
done

