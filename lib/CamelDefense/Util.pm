package CamelDefense::Util;

use strict;
use warnings;
use base 'Exporter';

our @EXPORT_OK = qw(analyze_right_angle_line);

sub analyze_right_angle_line {
    my ($x1, $y1, $x2, $y2) = @_;

    my $is_horizontal = $x1 == $x2? 0:
                        $y1 == $y2? 1:
                        die 'Can only analyze horizontal or vertical lines';

    my $dir = $is_horizontal? $x1 <= $x2? 1: -1:
                              $y1 <= $y2? 1: -1;

    return ($is_horizontal, $dir);
}

1;
