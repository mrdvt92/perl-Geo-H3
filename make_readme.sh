echo "Building README.md"
pod2markdown lib/Geo/H3.pm > README.md &
echo "Building README"
pod2text     lib/Geo/H3.pm > README &
wait
