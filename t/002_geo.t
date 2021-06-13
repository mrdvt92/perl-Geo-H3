#! --perl--
use strict;
use warnings;
use Test::More tests => 9;
require_ok 'Geo::H3::Geo';

my $lat = 38.780276;
my $lon = -77.386706;
my $geo = Geo::H3::Geo->new(lat=>$lat, lon=>$lon);
isa_ok($geo, 'Geo::H3::Geo');
can_ok($geo, 'new');
can_ok($geo, 'lat');
can_ok($geo, 'lon');
can_ok($geo, 'h3');
can_ok($geo, 'pointDistKm');
can_ok($geo, 'pointDistM');
can_ok($geo, 'pointDistRads');
