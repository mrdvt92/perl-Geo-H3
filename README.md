# NAME

Geo::H3 - H3 Geospatial Hexagon Indexing System

# SYNOPSIS

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
    

# DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System C library using libffi and FFI::Platypus.

# CONSTRUCTORS

## h3

Returns a [Geo::H3::Index](https://metacpan.org/pod/Geo::H3::Index) object

    my $h3 = $gh3->h3(index  => $int);    #isa Geo::H3::Index
    my $h3 = $gh3->h3(string => $string); #isa Geo::H3::Index

## geo

Returns a [Geo::H3::Geo](https://metacpan.org/pod/Geo::H3::Geo) object

    my $geo = $gh3->geo(lat=>$lat_deg, lon=>$lon_deg); #isa Geo::H3::Geo

# SEE ALSO

[https://h3geo.org/](https://h3geo.org/), [https://github.com/uber/h3/](https://github.com/uber/h3/), [Geo::H3::FFI](https://metacpan.org/pod/Geo::H3::FFI)

# AUTHOR

Michael R. Davis

# COPYRIGHT AND LICENSE

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
