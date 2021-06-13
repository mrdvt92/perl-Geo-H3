#! --perl--
use strict;
use warnings;
use Test::Number::Delta;
use Test::More tests => 13;
require_ok 'Geo::H3::Index';

#$ geoToH3 -r 10 --lat 38.780276 --lon -77.386706
#8a2aaaa2e747fff
#
#h3ToGeo --index 8a2aaaa2e747fff
#38.7808807598 -77.3865869231

my $index  = 622247346431098879;
my $string = '8a2aaaa2e747fff';
my $h3    = Geo::H3::Index->new(index=>$index);
isa_ok($h3, 'Geo::H3::Index');
can_ok($h3, 'new');
can_ok($h3, 'index');
can_ok($h3, 'string');
can_ok($h3, 'geo');
can_ok($h3, 'resolution');
#can_ok($h3, 'geo_boundary');
is($h3->index, $index, 'index');
is($h3->string, $string, 'string');
is($h3->resolution, 10, 'resolution');
isa_ok($h3->geo, 'Geo::H3::Geo', 'geo');
delta_within($h3->geo->lat, 38.7808807598,  1e-10, '$h3->geo->lat');
delta_within($h3->geo->lon, -77.3865869231, 1e-10, '$h3->geo->lon');
