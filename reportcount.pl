#!/usr/bin/perl

sub numerically { $a <=> $b; }

while(<>) {
    @fields = split /\t/;
    $report{$fields[0]} = $report{$fields[0]} + 1;
    $sums{$fields[0]} = $report{$fields[0]} + $fields[1];
}

$total=0;

while( ($key,$value) = each(%report) ) {
    $avg = $sums{$key} / ${value};
    $avgstr = sprintf("%.2f", $avg);
    push @report, ("$avgstr - $key\n");
    $total += $value;
}

$"="\n";

print reverse sort numerically @report;

print "\nRows: ". keys(%report) . "\n";
print "Total: ${total}\n";
