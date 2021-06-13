use strict;
use warnings;

use Test::More tests => 8;
require_ok 'Geo::H3';

my $lat = 40.689167;
my $lon = -74.044444;
my $geo = Geo::H3->geo(lat=>$lat, lon=>$lon);

isa_ok($geo, 'Geo::H3::Geo');
is($geo->lat, $lat, 'lat');
is($geo->lon, $lon, 'lon');

#$ geoToH3 --latitude 40.689167 --longitude -74.044444 --resolution 7
#872a1072bffffff

my $resolution = 7;
my $h3         = $geo->h3($resolution);
isa_ok($h3, 'Geo::H3::Index');
is($h3->index, '608725951823478783', 'index');
is($h3->string, '872a1072bffffff', 'string');
is($h3->resolution, $resolution);
