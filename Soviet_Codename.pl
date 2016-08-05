#!perl

use warnings;
use utf8;
use strict;

my $menu_choice = "RUN";

#TEMPORARY CODENAME HASH
my %CODE_HASH = (
ANTENNA => 'Julius Rosenberg',
LIBERAL => 'Julius Rosenberg',
KAPITAN => 'President Roosevelt',
BABYLON => 'San Francisco',
);

#HELP Menu Text
sub HELP {
	print "To exit the program type \"EXIT\".\nTo lookup a real name using a codename type \"CODE\".\nTo look up a codename using a real name type \"REAL\".\n\n";
}


#CODE Subroutine
sub CODE {
	print "Please enter the CODENAME:\n";
	chomp( my $CODENAME = <STDIN> );
	if( defined( $CODE_HASH{$CODENAME} )){
		print "The codename $CODENAME was used for $CODE_HASH{$CODENAME}.\n\n";
	}
	else {
		print "There is no entry for the codename $CODENAME.\n\n";
		#Currently this takes you back to the main menu which is fine since if you didn't have a legit codename you would be stuck in this subroutine...
	}
}


#REAL Subroutine
sub REAL {
	print "Please enter the Realname:\n";
	chomp( my $realname = <STDIN> );
	#DEBUG
	print "You have entered $realname \n\n";
	#DEBUG
}

#MAIN MENU
while ( $menu_choice ne "EXIT" ){
	print "Welcome to Ben\'s Soviet Codename program. You can type HELP for a help menu. What would you like to do?\n";
	chomp( $menu_choice = <STDIN> );
	
	#HELP
	if ( $menu_choice eq "HELP"){
		&HELP;
	}
	
	#CODE
	if ( $menu_choice eq "CODE" ){
		&CODE;
	}
}



