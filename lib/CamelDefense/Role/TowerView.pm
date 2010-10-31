package CamelDefense::Role::TowerView;

use Moose::Role;
use MooseX::Types::Moose qw(Num Str);
use aliased 'CamelDefense::World';

has world => (is => 'ro', required => 1, isa => World, weak_ref => 1);

has range => (is => 'ro', isa => Num, default => 100); # in pixels

with 'CamelDefense::Role::GridAlignedSprite';

sub compute_cell_center { shift->world->compute_cell_center(@_) }

sub render_range {
    my ($self, $surface, $color, $area_color) = @_;

    if ($area_color) {
        $surface->draw_circle_filled(
            [$self->center_x, $self->center_y],
            $self->range,
            $area_color,
        );
    }
    $surface->draw_circle(
        [$self->center_x, $self->center_y],
        $self->range,
        $color,
        1,
    );
}

1;

