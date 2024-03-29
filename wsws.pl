#!/usr/bin/perl -w

use strict;
use Encode;
use Lingua::Wortschatz;

my @args=map {encode("utf8",$_)} @ARGV;
if (defined($args[0]) && ($args[0] !~ /^help/)) {
	if (my $result=Lingua::Wortschatz::use_service(@args)) {
		$result->dump();
		exit;
	}
} else { shift @args }
print <<HELP;
wsws - Wortschatz-Webservice-Client (c) 2005 Daniel Schr�er

Usage: $0 service arguments
Type "$0 help full" for a complete description of all services.

Available services:
HELP
print Lingua::Wortschatz::help(@args);

__END__

=head1 NAME

wsws.pl - Command line client for the web services at wortschatz.uni-leipzig.de

=head1 SYNOPSIS

  wsws.pl help
  wsws.pl help Thesaurus
  wsws.pl Thesaurus toll
  wsws.pl help C
  wsws.pl C toll 300
  wsws.pl help full

=head1 DESCRIPTION

This is a full featured command line client for the web services
at L<http://wortschatz.uni-leipzig.de>.

The general syntax is

  wsws.pl servicename serviceparameter1 serviceparameter2 ...

All public services at L<http://wortschatz.uni-leipzig.de> are
available. Below is a list of service names and their parameters.
Any parameters with = are optional and default to the given value.
Service names can be abbreviated to the shortest possible form.

  * ServiceOverview Name=
  * Cooccurrences Wort Mindestsignifikanz=1 Limit=10
  * Baseform Wort
  * Sentences Wort Limit=10
  * RightNeighbours Wort Limit=10
  * LeftNeighbours Wort Limit=10
  * Frequencies Wort Limit=10
  * Synonyms Wort Limit=10
  * Thesaurus Wort Limit=10
  * Wordforms Word Limit=10
  * Similarity Wort Limit=10
  * LeftCollocationFinder Wort Wortart Limit=10
  * RightCollocationFinder Wort Wortart Limit=10

Type

  wsws.pl help
  
or

  wsws.pl help full

for a online description of all available services, their parameters and
additional information on what each service does.

=head1 SEE ALSO

=over 2

=item L<Lingua::Wortschatz>

=item L<http://wortschatz.uni-leipzig.de>

=item L<SOAP::Lite>

=back

=head1 AUTHOR/COPYRIGHT

This is C<$Id: wsws.pl,v 1.13 2005/10/26 23:06:18 wolfgang Exp $>.

Copyright 2005 Daniel Schr�er (L<mailto: daniel@daimla1.de>).

This program is free software;
you can redistribute it and/or modify it under the same terms as Perl itself.

=cut
