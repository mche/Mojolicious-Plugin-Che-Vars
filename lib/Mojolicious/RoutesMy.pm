package Mojolicious::RoutesMy;
use Mojo::Base 'Mojolicious::Routes';

sub continue {
  my ($self, $c) = @_;

  my $match    = $c->match;
  my $stack    = $match->stack;
  my $position = $match->position;
  return _render($c) unless my $field = $stack->[$position];
  
  warn ">>>>", $c->dumper($field);

  # Merge captures into stash
  my $stash = $c->stash;
  @{$stash->{'mojo.captures'} //= {}}{keys %$field} = values %$field;
  @$stash{keys %$field} = values %$field;

  my $continue;
  my $last = !$stack->[++$position];
  if (my $cb = $field->{cb}) { $continue = $self->_callback($c, $cb, $last) }
  else { $continue = $self->_controller($c, $field, $last) }
  $match->position($position);
  $self->continue($c) if $last || $continue;
}