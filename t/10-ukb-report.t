use strict;
use warnings;
use Test::More tests => 2;
use Test::Exception;

use_ok('ukb::report');

subtest 'Prints report' => sub {
    plan tests => 1;
    my $report = ukb::report->new();
    my $dummy;
    lives_ok{$dummy = $report->print_report()};
};

1;
