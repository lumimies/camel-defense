#!/usr/bin/perl

use strict;
use warnings;
use lib '../lib';
use SDL::Events;
use SDLx::App;
use aliased 'CamelDefense::Grid::Markers';
use aliased 'CamelDefense::Waypoints';

my ($app_w, $app_h)  = (640, 480);

my $app = SDLx::App->new(
    title  => 'Waypoints Example',
    width  => $app_w,
    height => $app_h,
);

my $markers = Markers->new(
    w       => $app_w,
    h       => $app_h,
    spacing => 23,
);

my $waypoints = Waypoints->new(
    marks     => $markers,
    waypoints => [
        [0.00, 0.30],
        [0.30, 0.30],
        [0.30, 0.60],
        [0.10, 0.60],
        [0.10, 0.45],
        [0.15, 0.45],
        [0.15, 0.50],
        [0.15, 0.50],
    ],
);

$app->add_event_handler(sub { $_[1]->stop if $_[0]->type == SDL_QUIT });
$app->add_show_handler(\&show_handler);

$app->run;

sub show_handler {
    my $dt = shift;
    $markers->render($app);
    $waypoints->render($app);
    $app->update;
}

