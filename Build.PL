#!/usr/bin/perl
#$Id: Build.PL,v 1.1 2005/10/25 22:02:50 wolfgang Exp $

use strict;
use Module::Build;

my $build=Module::Build->new(
    module_name => 'Lingua::Wortschatz', 
    license     => 'perl',
    requires    => {
        'SOAP::Lite'            => 0,
        'HTML::Entities'        => 0,
        'Text::Autoformat'	    => 0,
        'Encode'	            => 0,
    },
    script_files    => ['wsws.pl'],
    create_readme   => 0,
    dist_author		=> 'Daniel Schroeer <daniel@daimla1.de>');
$build->create_build_script;
