#!/usr/bin/perl
use strict;
use warnings;
use Path::Class qw{file};
use Geo::H3;
use Geo::GoogleEarth::Pluggable;

my $lat       = shift ||  38.889480654699476;
my $lon       = shift || -77.03523875953579;

my $gh3       = Geo::H3->new;
my $geo       = $gh3->geo(lat=>$lat, lon=>$lon);
my $h3        = $geo->h3(8);
my $center    = $h3->geo;
my $gb        = $h3->geo_boundary;

my $document  = Geo::GoogleEarth::Pluggable->new(name=>"Geo::H3");
my $polystyle = $document->Style(
                  PolyStyle=>$document->AreaStyleBlue(alpha=>"20%"),
                  LineStyle=>$document->LineStyleBlue(width=>2),
                );
$document->Point(name=>"Input" , lat=>$lat, lon=>$lon);
$document->Point(name=>"Center", lat=>$center->lat, lon=>$center->lon);

$document->LinearRing(name=>$h3->string, coordinates=>$gb->coordinates, style=>$polystyle);
my $outfile   = file("output.kmz");
$outfile->spew($document->archive);
