use Test::More;
eval "use Test::Spelling";
plan skip_all => "Test::Spelling required for testing POD spelling" if $@;
add_stopwords(<DATA>);
all_pod_files_spelling_ok();

__DATA__
MERCHANTABILITY
NONINFRINGEMENT
sublicense
Geospatial
H3
API
haversine
lon
pointDistKm
pointDistM
pointDistRads
radians
ffi
libffi
uint64
geo
h3
centroid
icosahedron
isPentagon
isResClassIII
isValid
maxFaceCount
namespace
GeoBoundray
gb