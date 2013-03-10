#!/usr/bin/perl

use CGI;
use File::Util;

my $f = File::Util->new();
my $tiles = $f->load_file('/var/www/images/ESE4-1/tiles.json', '--no-lock');
my $req = CGI->new;
my $callback = $req->param('callback');

if ($callback) {
	print "Access-Control-Allow-Origin: *\n";
	print "Access-Control-Allow-Methods: GET\n"; 
	print "Content-type: application/json-p\n\n";
	print $callback . '(' . $tiles . ');';
} else {
	print "Content-type: application/json\n\n"; 
	print $tiles;
}

exit 0;

