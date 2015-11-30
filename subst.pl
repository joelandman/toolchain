#!/usr/bin/perl

# copyright (c) 2004 Scalable Informatics LLC 
# subst is not free software.  You may not distribute
# this code without written permission from Scalable Informatics LLC

use strict;
use constant true	=> (1==1);
use constant false	=> (1==0);

use Getopt::Long;
my ($from,$to,$rc,$debug);

$debug	= false;
$rc 	= GetOptions (
		       "from=s"	=> \$from,
		       "to=s"	=> \$to,
		       "debug"	=> \$debug
                     ); 
 
printf "from pattern: \'%s\'\n",$from if ($debug);
printf "  to pattern: \'%s\'\n",$to   if ($debug);

while (<>)
  {
    $_	=~ s/$from/$to/g;
    printf "%s",$_;
  }
