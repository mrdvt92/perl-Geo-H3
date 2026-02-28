#!/bin/sh

cat /dev/null > README.md

for FILE in `cat README.MANIFEST` ; do
  echo $FILE 
  echo -ne "~~~~ File: $FILE\n\n" >> README.md
  pod2markdown $FILE              >> README.md
done

sed -i -e 's/^#/##/' -e 's/^~~~~/#/' README.md
