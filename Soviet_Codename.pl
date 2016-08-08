#!perl

use warnings;
use utf8;
use strict;

my $menu_choice = "RUN";
my %CODE_HASH;


#Creates CODENAME HASH	
sub CH {
	my @CH_PARSE;
	open (my $CH, "<", "CODENAME_HASH.txt")
		or die "Can't open < CODENAME_HASH.txt: $!";

	while (my $CH_LINE = <$CH>){
		chomp $CH_LINE;
		push (@CH_PARSE, split (/\t/, $CH_LINE));
	}
	%CODE_HASH = (@CH_PARSE);
}
#INITIAL creation on load
&CH;


#HELP Menu Text
sub HELP {
	print "To exit the program type \"EXIT\".\nTo lookup a real name using a codename type \"CODE\".\nTo look up a codename using a real name type \"REAL\".\n\n";
}


#CODE Subroutine
sub CODE {
	print "Please enter the CODENAME:\n";
	chomp( my $CODENAME = <STDIN> );
	if( defined( $CODE_HASH{$CODENAME} )){
		print "The codename $CODENAME was used for $CODE_HASH{$CODENAME}.\n\n\n";
	}
	else {
		print "There is no entry for the codename $CODENAME.\n\n\n";
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


#ENTRY Subroutine can add new code names to the file I have for storing them
sub ENTRY {
	open (my $CH, ">>", "CODENAME_HASH.txt")
		or die "Can't open >> CODENAME_HASH.txt: $!";
	print "Please enter the CODENAME:\n";
	chomp( my $ENTRY_C = <STDIN> );
	print "Please enter the Real Name:\n";
	chomp( my $ENTRY_R = <STDIN> );
	print "Please confirm this is correct.\n$ENTRY_C\t\'$ENTRY_R\'\n";
	chomp( my $CONFIRM = <STDIN> );
	if ( $CONFIRM eq "YES" ){
		print{$CH} "$ENTRY_C\t\'$ENTRY_R\'\n";
		}
	close $CH;
	&CH;
}

#MAIN MENU
while ( $menu_choice ne "EXIT" ){
	print "******\nWelcome to Ben\'s Soviet Codename program. You can type HELP for a help menu. What would you like to do?\n";
	chomp( $menu_choice = <STDIN> );
	
	#HELP
	if ( $menu_choice eq "HELP"){
		&HELP;
	}
	
	#CODE
	if ( $menu_choice eq "CODE" ){
		&CODE;
	}
	
	#ENTRY
	if ( $menu_choice eq "ENTRY"){
		&ENTRY;
	}
}



