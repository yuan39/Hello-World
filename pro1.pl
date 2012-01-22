#!/usr/bin/perl 
use warnings;
use strict;

my %longday = (
    "Sun" => "Sunday",
    "Mon" => "Monday",
    "Tue" => "Tuesday",
    "Wed" => "Wednesday",
    "Thu" => "Thursday",
    "Fri" => "Friday",
    "Sat" => "Saturday"
);
for my $day (keys %longday){
 print $day. ' ';
}
my %grades; 
open(GRADES,"in.txt") or die "Can't open grades: $!\n";
while(my $line = <GRADES>){
	my($student,$grade) = split(" ", $line);
	$grades{$student} .= $grade . " ";
}

foreach my $student(sort keys %grades){
	my $scores = 0;
	my $total = 0;
	my @grades = split(" ",$grades{$student});
	foreach my $grades (@grades){
		$total += $grades;
		$scores++;
	}
	my $average = $total / $scores;
	print "$student: $grades{$student}\tAverage: $average\n";
}

