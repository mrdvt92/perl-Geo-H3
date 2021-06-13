#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
use Geo::H3;
use Geo::GoogleEarth::Pluggable;
use Geo::GoogleEarth::Pluggable::Plugin::Styles;
use Path::Class qw{file};

=head1 NAME

perl-Geo-H3-geo-to-googleearth.pl - Creates an Google Earth document from Coordinates, H3, Parent, Children and Hex Ring.

=cut

my $lat            = shift //  38.889480654699476;
my $lon            = shift // -77.03523875953579;

my $gh3            = Geo::H3->new;
my $geo            = $gh3->geo(lat=>$lat, lon=>$lon);
my $h3             = $geo->h3(8);
my $center         = $h3->geo;

my $document       = Geo::GoogleEarth::Pluggable->new(name=>"Geo::H3");
my $style_index    = $document->Style(PolyStyle=>$document->AreaStyleBlue(alpha=>"20%") , LineStyle=>$document->LineStyleBlue(width=>4));
my $style_child    = $document->Style(PolyStyle=>$document->AreaStyleBlack(alpha=>"20%"), LineStyle=>$document->LineStyleBlack(width=>2, alpha=>"50%"));
my $style_parent   = $document->Style(PolyStyle=>$document->AreaStyleWhite(alpha=>"20%"), LineStyle=>$document->LineStyleWhite(width=>2, alpha=>"50%"));
my $style_hex_ring = $document->Style(PolyStyle=>$document->AreaStyleGreen(alpha=>"20%"), LineStyle=>$document->LineStyleGreen(width=>2, alpha=>"50%"));
$document->Point(name=>"Input" , lat=>$lat,         lon=>$lon);
$document->Point(name=>"Center", lat=>$center->lat, lon=>$center->lon);

{
  my $folder = $document->Folder(name=>"Parent");
  my $parent = $h3->parent;
  $folder->LinearRing(name=>$parent->string, coordinates=>$parent->geo_boundary->coordinates, style=>$style_parent);
}

{
  my $folder = $document->Folder(name=>"Hex Ring");
  foreach my $hex (@{$h3->hex_ring}) {
    $folder->LinearRing(name=>$hex->string, coordinates=>$hex->geo_boundary->coordinates, style=>$style_hex_ring);
  }
}

{
  my $folder = $document->Folder(name=>"Children");
  foreach my $child (@{$h3->children}) {
    $folder->LinearRing(name=>$child->string, coordinates=>$child->geo_boundary->coordinates, style=>$style_child);
  }
}

$document->LinearRing(name=>$h3->string, coordinates=>$h3->geo_boundary->coordinates, style=>$style_index);

my $outfile = file("output.kmz");
$outfile->spew($document->archive);
