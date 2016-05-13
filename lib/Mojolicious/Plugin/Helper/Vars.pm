package Mojolicious::Plugin::Che::Vars;

use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.0001';

=pod

=encoding utf8

Доброго всем

=head1 Mojolicious::Plugin::Che::Vars

¡ ¡ ¡ ALL GLORY TO GLORIA ! ! !

=head1 NAME

Mojolicious::Plugin::Che::Vars - Stash & every_params to one var named.

=head1 SINOPSYS

    $app->plugin('Che::Vars');


=head1 OPTIONS

=over 4

=item * B<helper>

Name of the helper. Default - 'vars'.

=back

=head1 SEE ALSO

L<>

=head1 AUTHOR

Михаил Че (Mikhail Che), C<< <mche [on] cpan.org> >>

=head1 BUGS / CONTRIBUTING

Please report any bugs or feature requests at L<https://github.com/mche/Mojolicious-Plugin-Che-Vars/issues>. Pull requests also welcome.

=head1 COPYRIGHT

Copyright 2016 Mikhail Che.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

sub register {
  my ($self, $app, $conf)  = @_;
  my $helper = delete $conf->{helper} || 'evars';
  $app->helper($helper => sub {
    my $c = shift;
    my $name = shift
    decode $enc,
      Data::Dumper->new(Data::Recursive::Encode->encode($enc, \@_),)
      ->Indent(1)->Sortkeys(1)->Terse(1)->Useqq(0)->Dump;
  });
  return $self;
}



1;