#!/usr/bin/perl

use feature "say";
use feature "switch";
use warnings;
no warnings 'experimental';

if(scalar(@ARGV)!=0)
{
	say "Non devi specificare nessun argomento.";
    exit(-1);
}

open(OUTPUT,"<","output.txt");

qx(dos2unix output.txt); #REQUISITO ALTRIMENTI NON MATCHA COLPA DI MICROSOFT


while(<OUTPUT>)
{
	
	if($_ =~ /^\{(.*)\}$/)
	{
		$output=$1;
		@facts=split(', ',$output);
	}
}

#my @factsGrid=(([("-") x 20 ]) x 13);
my @factsGrid;

for(my $m = 0; $m <= 13; $m++)
{  
   for(my $n = 0; $n <= 25 ; $n++)
   { 
      $factsGrid[$m][$n]='-'; 
   }  
} 

foreach my $i (@facts)
{
    given ($i)
	{
		when (/safe\((\d+),(\d+),0\)/) 
		{
			if($factsGrid[$2][$1] eq '-')
			{
				$factsGrid[$2][$1]="s";
				say "trovato $_ , $1 e $2";
			}
		}
		when (/carPos\((\d+),(\d+)\)/) 
		{
			$factsGrid[$2][$1]="C";
			say "trovato $_, $1 e $2, Inserito $factsGrid[$2][$1]";
		}
		when (/trunk\((\d+),(\d+)\)/) 
		{
			$factsGrid[$2][$1]="T";
			say "trovato $_, $1 e $2, Inserito $factsGrid[$2][$1]";
		}
		when (/turtle\((\d+),(\d+)\)/) 
		{
			$factsGrid[$2][$1]="t";
			say "trovato $_, $1 e $2, Inserito $factsGrid[$2][$1]";
		}
		when (/playerPos\((\d+),(\d+)\)/) 
		{
			$factsGrid[$2][$1]='P';
			say "trovato $_, $1 e $2, Inserito $factsGrid[$2][$1]";
		}
		when (/goal\((\d+),(\d+),\w+\)/) 
		{
			$factsGrid[$2][$1]="G";
			say "trovato $_, $1 e $2, Inserito $factsGrid[$2][$1]";
		}
		default 
		{
			#say "$_ default";
		}
	}
}

# for my $row (@factsGrid) {
    # print join(",", @{$row}), "\n";
# }

for(my $m = 12; $m >= 0; $m--)
{  
   for(my $n = 0; $n <= 20 ; $n++)
   { 
      print "$factsGrid[$m][$n] "; 
   } 
   print "\n";
} 


close(OUTPUT);