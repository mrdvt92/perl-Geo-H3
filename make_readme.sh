echo "Building README.md"

echo -ne                               > README.md
for F in lib/Geo/H3.pm lib/Geo/H3/Index.pm lib/Geo/H3/Geo.pm lib/Geo/H3/GeoBoundary.pm scripts/perl-Geo-H3-geo-to-googleearth.pl
do
  echo "# File: $F"                   >> README.md
  echo                                >> README.md
  pod2markdown $F | sed -e 's/^#/##/' >> README.md
  echo                                >> README.md
done

echo "Building README"
cat README.md                          > README
