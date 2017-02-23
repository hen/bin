#!/usr/bin/perl

sub numerically { $a <=> $b; }

while(<>) {
    $report{$_} = $report{$_} + 1;
}

$total=0;

while( ($key,$value) = each(%report) ) {
    push @report, ("$value - $key");
    $total += $value;
}

$"="\n";

print reverse sort numerically @report;

print "\nAuthors: ". keys(%report) . "\n";
print "Total: ${total}\n";
