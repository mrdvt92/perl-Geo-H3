#!/usr/bin/perl
use strict;
use warnings;
use Geo::H3;

my $string = shift || '892aaaa2e77ffff'; #res 9
my $rings  = shift || 4;

my $hex         = Geo::H3::Index->new(string=>$string);
my $kring_array = $hex->kRing($rings); #isa ARRAY of Geo::H3::Index objects

foreach my $ring_hex (@$kring_array) {
  printf "%s to %s is %s h3 distance units\n", $hex->string, $ring_hex->string, $hex->distance($ring_hex);
}

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
