#!/usr/bin/env perl
use strict;
use warnings;
use FFI::CheckLib qw{};
use FFI::Platypus qw{};
use FFI::C qw{};

my $lib = FFI::CheckLib::find_lib_or_die(lib => 'h3');
my $ffi = FFI::Platypus->new(api => 1, lib => $lib);

FFI::C->ffi($ffi); #Beware: Class setting

package Geo::H3::GeoCoord {
  FFI::C->struct(geo_coord_t => [lat_rad => 'double', lon_rad => 'double']);
  sub lat {my $self = shift; return main::radsToDegs($self->lat_rad)};
  sub lon {my $self = shift; return main::radsToDegs($self->lon_rad)};
}

package Geo::H3::H3Index  {
  FFI::C->struct(h3_index_t  => [index => 'uint64'                ]);
  sub string {my $self = shift; return sprintf("%x", $self->index)};
  sub string2 {my $self = shift; return sprintf("%x", $self->index)};
}

$ffi->attach('degsToRads' => ['double'] => 'double');
$ffi->attach('radsToDegs' => ['double'] => 'double');
$ffi->attach('h3ToString' => ['h3_index_t', 'opaque', 'size_t'] => 'void');
$ffi->attach('geoToH3'
             => ['geo_coord_t', 'int']
             => 'uint64' #Segmentation fault when this is h3_index_t. Why?
             => sub {my $xsub = shift; my $return = $xsub->(@_); return Geo::H3::H3Index->new({index => $return})} #force return into Geo::H3::H3Index class
            );
$ffi->attach('h3ToGeo'
             => ['h3_index_t', 'geo_coord_t']
             => 'void'
             => sub {my $xsub = shift; my $return = $xsub->(@_); return $return}
            );

my ( $lt, $ln   ) = ( 40.689167, -74.044444 );
my ( $lat_rad, $lon_rad ) = ( degsToRads($lt), degsToRads($ln) );
my ( $olt, $oln ) = ( radsToDegs($lat_rad), radsToDegs($lon_rad) );

print "$lt -> $lat_rad -> (and back) -> $olt \n";
print "$ln -> $lon_rad -> (and back) -> $oln \n";

print "-" x 80, "\n";

my $gc    = Geo::H3::GeoCoord->new({lat_rad => $lat_rad, lon_rad => $lon_rad});
my $level = 10;
my $index = geoToH3($gc, $level);

printf "index: %s; index in hex %s\n", $index->index, $index->string;

my $gc2   = Geo::H3::GeoCoord->new({}); #empty structure
h3ToGeo($index, $gc2); #assigns into structure

my ($gc2lat, $gc2lon) = ( $gc2->lat_rad, $gc2->lon_rad );
printf "gc2lat: %s -> degs: %s ; gc2lon: %s -> degs: %s\n", $gc2->lat_rad, $gc2->lat, $gc2->lon_rad, $gc2->lon;
