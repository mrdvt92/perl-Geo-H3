# File: lib/Geo/H3.pm

## NAME

Geo::H3 - H3 Geospatial Hexagon Indexing System

## SYNOPSIS

    use Geo::H3;
    my $gh3      = Geo::H3->new;
    
    my $h3       = $gh3->h3(index  => $int);        #isa Geo::H3::Index
    my $h3       = $gh3->h3(string => $string);     #isa Geo::H3::Index

    my $geo      = $gh3->geo(lat=>$lat, lon=>$lon); #isa Geo::H3::Geo
    my $h3       = $geo->h3($resolution);           #isa Geo::H3::Index

    my $center   = $h3->center;                     #isa Geo::H3::GeoCoord
    my $lat      = $center->lat;                    #isa Double WGS-84 Decimal Degrees
    my $lon      = $center->lon;                    #isa Double WGS-84 Decimal Degrees
    my $distance = $center->pointDistM($geo);       #isa Double meters
    

## DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System C library using libffi and FFI::Platypus.

## CONSTRUCTORS

### h3

Returns a [Geo::H3::Index](https://metacpan.org/pod/Geo::H3::Index) object

    my $h3 = $gh3->h3(index  => $int);    #isa Geo::H3::Index
    my $h3 = $gh3->h3(string => $string); #isa Geo::H3::Index

### geo

Returns a [Geo::H3::Geo](https://metacpan.org/pod/Geo::H3::Geo) object

    my $geo = $gh3->geo(lat=>$lat_deg, lon=>$lon_deg); #isa Geo::H3::Geo

## SEE ALSO

[https://h3geo.org/](https://h3geo.org/), [https://github.com/uber/h3/](https://github.com/uber/h3/), [Geo::H3::FFI](https://metacpan.org/pod/Geo::H3::FFI)

## AUTHOR

Michael R. Davis

## COPYRIGHT AND LICENSE

MIT License

Copyright (c) 2020 Michael R. Davis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

# File: lib/Geo/H3/Index.pm

## NAME

Geo::H3::Index - H3 Geospatial Hexagon Indexing System

## SYNOPSIS

    use Geo::H3::Index;
    my $h3       = Geo::H3::Index->new(index=$index); #isa Geo::H3::Index
    my $centroid = $h3->geo;                          #isa Geo::H3::GeoCoord
    my $lat      = $center->lat;                      #isa double WGS-84 Decimal Degrees
    my $lon      = $center->lon;                      #isa double WGS-84 Decimal Degrees
    

## DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System.

## CONSTRUCTORS

### new

    my $geo = Geo::H3::Index->new(index=>$index);

## PROPERTIES

### index

Returns the H3 index uint64 representation

## METHODS

### string

Returns the H3 string representation.

### resolution

Returns the resolution of the index.

### geo

Returns the centroid of the index as a [Geo::H3::Geo](https://metacpan.org/pod/Geo::H3::Geo) object.

### geo\_boundary

### children

Returns an array reference of [Geo::H3::Index](https://metacpan.org/pod/Geo::H3::Index) objects

    my $children = $h3->children; #next higer resolution
    my $children = $h3->children(12); #isa ARRAY

### parent

Returns a [Geo::H3::Index](https://metacpan.org/pod/Geo::H3::Index) object parent of the H3 index.

    my $parent = $h3->parent;    #next lower resolution
    my $parent = $h3->parent(1); #isa Geo::H3::Index

### hex\_ring

Returns an array reference of [Geo::H3::Index](https://metacpan.org/pod/Geo::H3::Index) objects

    my $hexes = $h3->children; #default k = 1
    my $hexes = $h3->children(5); #isa ARRAY

### isValid

Returns non-zero if this is a valid H3 index.

### isResClassIII

Returns non-zero if this index has a resolution with Class III orientation.

### isPentagon

Returns non-zero if this index represents a pentagonal cell.

### maxFaceCount

Returns the maximum number of icosahedron faces the given H3 index may intersect.

### struct

Returns the H3 index as an [FFI::C](https://metacpan.org/pod/FFI::C) struct in the  [Geo::H3::FFI::Struct::Index](https://metacpan.org/pod/Geo::H3::FFI::Struct::Index) namespace

## SEE ALSO

[Geo::H3](https://metacpan.org/pod/Geo::H3), [Geo::H3::FFI](https://metacpan.org/pod/Geo::H3::FFI)

## AUTHOR

Michael R. Davis

## COPYRIGHT AND LICENSE

MIT License

Copyright (c) 2020 Michael R. Davis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

# File: lib/Geo/H3/Geo.pm

## NAME

Geo::H3::Geo - H3 Geospatial Hexagon Indexing System

## SYNOPSIS

    use Geo::H3::Geo;
    my $geo    = Geo::H3::Geo->new(lat=>$lat, lon=>$lon); #isa Geo::H3::Geo
    my $h3     = $geo->h3($resolution);                   #isa Geo::H3::Index
    my $center = $h3->center;                             #isa Geo::H3::Geo
    my $lat    = $center->lat;                            #isa double WGS-84 Decimal Degrees
    my $lon    = $center->lon;                            #isa double WGS-84 Decimal Degrees
    

## DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System.

## CONSTRUCTORS

### new

    my $geo = Geo::H3::Geo->new(lat => $lat, lon => $lon);

## PROPERTIES

### lat

Returns the latitude in degrees

### lon

Returns the longitude in degrees

## METHODS

### struct

### h3 

Indexes the location at the specified resolution, returning the index object [Geo::H3::Index](https://metacpan.org/pod/Geo::H3::Index) of the cell containing the location.

    my $h3 = $geo->h3;    #default resolution is 0
    my $h3 = $geo->h3(7); #isa Geo::H3::H3Index

Returns undef on error.

### pointDistKm

Gives the "great circle" or "haversine" distance between pairs of points (lat/lon pairs) in kilometers.

    my $distance = $geoA->pointDistKm($geoB); #isa Double

### pointDistM

Gives the "great circle" or "haversine" distance between pairs of points (lat/lon pairs) in meters.

    my $distance = $geoA->pointDistM($geoB); #isa Double

### pointDistRads

Gives the "great circle" or "haversine" distance between pairs of points (lat/lon pairs) in radians.

    my $distance = $geoA->pointDistRads($geoB); #isa Double

## SEE ALSO

[Geo::H3](https://metacpan.org/pod/Geo::H3), [Geo::H3::FFI](https://metacpan.org/pod/Geo::H3::FFI)

## AUTHOR

Michael R. Davis

## COPYRIGHT AND LICENSE

MIT License

Copyright (c) 2020 Michael R. Davis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

# File: lib/Geo/H3/GeoBoundary.pm

## NAME

Geo::H3::GeoBoundary - H3 Geospatial Hexagon Indexing System

## SYNOPSIS

    use Geo::H3::GeoBoundary;
    my $gb = Geo::H3::GeoBoundary->new(gb=>$gb); #isa Geo::H3::GeoBoundary
    my $gb = Geo::H3::GeoBoundary->new(gb=>$gb, ffi=>$ffi); #isa Geo::H3::GeoBoundary
    

## DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System.

## CONSTRUCTORS

### new

    my $geo = Geo::H3::GeoBoundary->new(gb=>$gb);

## PROPERTIES

### gb

Returns the H3 GeoBoundray Object as returned from the API

## METHODS

### coordinates

Returns an array reference of hashes i.e. \[{lat=>$lat, lon=>$lon}, ...\]

## SEE ALSO

[Geo::H3](https://metacpan.org/pod/Geo::H3), [Geo::H3::FFI](https://metacpan.org/pod/Geo::H3::FFI)

## AUTHOR

Michael R. Davis

## COPYRIGHT AND LICENSE

MIT License

Copyright (c) 2020 Michael R. Davis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

