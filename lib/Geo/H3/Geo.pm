package Geo::H3::Geo;
use strict;
use warnings;
use base qw{Geo::H3::Base}; #provides new, ffi, and Geo::H3::FFI::Struct::GeoCoord
require Geo::H3::Index;

our $VERSION = '0.03';
our $PACKAGE = __PACKAGE__;

=head1 NAME

Geo::H3::Geo - H3 Geospatial Hexagon Indexing System

=head1 SYNOPSIS

  use Geo::H3::Geo;
  my $geo    = Geo::H3::Geo->new(lat=>$lat, lon=>$lon); #isa Geo::H3::Geo
  my $h3     = $geo->h3($resolution);                   #isa Geo::H3::Index
  my $center = $h3->center;                             #isa Geo::H3::Geo
  my $lat    = $center->lat;                            #isa double WGS-84 Decimal Degrees
  my $lon    = $center->lon;                            #isa double WGS-84 Decimal Degrees
  
=head1 DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System.

=head1 CONSTRUCTORS

=head2 new

  my $geo = Geo::H3::Geo->new(lat => $lat, lon => $lon);

=head1 PROPERTIES

=head2 lat

Returns the latitude in degrees

=cut

sub lat {
  my $self = shift;
  $self->{'lat'} = shift if @_;
  return $self->{'lat'};
}

=head2 lon

Returns the longitude in degrees

=cut

sub lon {
  my $self = shift;
  $self->{'lon'} = shift if @_;
  return $self->{'lon'};
}

=head1 METHODS

=head2 struct

=cut

sub struct {
  my $self = shift;
  my $lat  = $self->ffi->degsToRads($self->lat);
  my $lon  = $self->ffi->degsToRads($self->lon);
  return Geo::H3::FFI::Struct::GeoCoord->new({lat=>$lat, lon=>$lon});
}

=head2 h3 

Indexes the location at the specified resolution, returning the index object L<Geo::H3::Index> of the cell containing the location.

  my $h3 = $geo->h3;    #default resolution is 0
  my $h3 = $geo->h3(7); #isa Geo::H3::H3Index

Returns undef on error.

=cut

sub h3 {
  my $self  = shift;
  my $res   = shift || 0;
  my $index = $self->ffi->geoToH3Wrapper(lat=>$self->lat, lon=>$self->lon, resolution=>$res, uom=>"deg")
                or die("Error: API geoToH3Wrapper return index invalid");
  return  Geo::H3::Index->new(index=>$index);
}

=head2 pointDistKm

Gives the "great circle" or "haversine" distance between pairs of points (lat/lon pairs) in kilometers.

  my $distance = $geoA->pointDistKm($geoB); #isa Double

=cut

sub pointDistKm {
  my $a        = shift;
  my $b        = shift or die("Error: package $PACKAGE method pointDistKm requires a distination point");
  my $distance = $a->ffi->pointDistKm($a->struct, $b->struct);
  return $distance;
}

=head2 pointDistM

Gives the "great circle" or "haversine" distance between pairs of points (lat/lon pairs) in meters.

  my $distance = $geoA->pointDistM($geoB); #isa Double

=cut 

sub pointDistM {
  my $a        = shift;
  my $b        = shift or die("Error: package $PACKAGE method pointDistM requires a distination point");
  my $distance = $a->ffi->pointDistM($a->struct, $b->struct);
  return $distance;
}

=head2 pointDistRads

Gives the "great circle" or "haversine" distance between pairs of points (lat/lon pairs) in radians.

  my $distance = $geoA->pointDistRads($geoB); #isa Double

=cut

sub pointDistRads {
  my $a        = shift;
  my $b        = shift or die("Error: package $PACKAGE method pointDistRads requires a distination point");
  my $distance = $a->ffi->pointDistRads($a->struct, $b->struct);
  return $distance;
}

=head1 SEE ALSO

L<Geo::H3>, L<Geo::H3::FFI>

=head1 AUTHOR

Michael R. Davis

=head1 COPYRIGHT AND LICENSE

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

=cut

1;
