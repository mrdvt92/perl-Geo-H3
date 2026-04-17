#!/usr/bin/perl
use strict;
use warnings;
use Geo::H3;

my $string = shift || '892aaaa2e77ffff'; #res 9

my $hex    = Geo::H3::Index->new(string=>$string);
my @krings = map {$_->[0]} grep {$_->[1] == 1} @{$hex->kRingDistances(1)};

foreach my $kring (@krings) {
  printf "%s to %s has edge length of %s meters\n", $hex->string, $kring->string, $hex->edgeLength($kring);
}
printf "Average edge length: %s\n", $hex->edgeLengthAverage;

__END__

=head1 NAME

perl-Geo-H3-index-to-kring-distance.pl - Calculate hex distance between two hexes example with K-ring

=head1 SYNTAX

  perl-Geo-H3-geo-to-googleearth.pl [hex_string] [kring_number]

=head1 EXAMPLE

  perl-Geo-H3-geo-to-googleearth.pl 892aaaa2e77ffff 4

=head1 SEE ALSO

L<Geo::H3>

=head1 COPYRIGHT AND LICENSE

MIT License

Copyright (c) 2026 Michael R. Davis

=cut
