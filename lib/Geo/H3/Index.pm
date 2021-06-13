package Geo::H3::Index;
use strict;
use warnings;
use base qw{Geo::H3::Base}; #provides new and ffi
require Geo::H3::Geo;
require Geo::H3::GeoBoundary;

our $VERSION = '0.01';
our $PACKAGE = __PACKAGE__;

=head1 NAME

Geo::H3::Index - H3 Geospatial Hexagon Indexing System

=head1 SYNOPSIS

  use Geo::H3::Index;
  my $h3       = Geo::H3::Index->new(index=$index); #isa Geo::H3::Index
  my $centroid = $h3->geo;                          #isa Geo::H3::GeoCoord
  my $lat      = $center->lat;                      #isa double WGS-84 Decimal Degrees
  my $lon      = $center->lon;                      #isa double WGS-84 Decimal Degrees
  
=head1 DESCRIPTION

Perl API to the H3 Geospatial Hexagon Indexing System.

=head1 CONSTRUCTORS

=head2 new

  my $geo = Geo::H3::Index->new(index=>$index);

=head1 PROPERTIES

=head2 index

Returns the H3 index uint64 representation

=cut

sub index {
  my $self = shift;
  return $self->{'index'};
}

=head1 METHODS

=head2 string

Returns the H3 string representation.

=cut

sub string {
  my $self = shift;
  return sprintf("%x", $self->index);
}

=head2 resolution

Returns the resolution of the index.

=cut

sub resolution {
  my $self = shift;
  return $self->ffi->h3GetResolution($self->index);
}

=head2 geo

Returns the centroid of the index as a L<Geo::H3::Geo> object.

=cut

sub geo {
  my $self = shift;
  unless ($self->{'geo'}) {
    my $geo        = $self->ffi->h3ToGeoWrapper($self->index);
    my $lat        = $self->ffi->radsToDegs($geo->lat);
    my $lon        = $self->ffi->radsToDegs($geo->lon);
    $self->{'geo'} = Geo::H3::Geo->new(lat=>$lat, lon=>$lon, ffi=>$self->ffi);
  }
  return $self->{'geo'};
}

=head2 geo_boundary

=cut

sub geo_boundary {
  my $self = shift;
  unless ($self->{'geo_boundary'}) {
    my $ffigb               = $self->ffi->h3ToGeoBoundaryWrapper($self->index);
    my $gb                  = Geo::H3::GeoBoundary->new(gb=>$ffigb, ffi=>$self->ffi);
    $self->{'geo_boundary'} = $gb;
  }
  return $self->{'geo_boundary'};
}

=head2 isValid

Returns non-zero if this is a valid H3 index.

=cut

sub isValid {
  my $self = shift;
  return $self->ffi->h3IsValid($self->index);
}

=head2 isResClassIII

Returns non-zero if this index has a resolution with Class III orientation.

=cut

sub isResClassIII {
  my $self = shift;
  return $self->ffi->h3IsResClassIII($self->index);
}

=head2 isPentagon

Returns non-zero if this index represents a pentagonal cell.

=cut

sub isPentagon {
  my $self = shift;
  return $self->ffi->h3IsPentagon($self->index);
}

=head2 maxFaceCount

Returns the maximum number of icosahedron faces the given H3 index may intersect.

=cut

sub maxFaceCount {
  my $self = shift;
  return $self->ffi->maxFaceCount($self->index);
}

=head2 struct

Returns the H3 index as an L<FFI::C> struct in the  L<Geo::H3::FFI::Struct::Index> namespace

=cut

sub struct {
  my $self          = shift;
  $self->{'struct'} = Geo::H3::FFI::Struct::Index->new({index=>$self->index}) unless $self->{'struct'};
  return $self->{'struct'};
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
