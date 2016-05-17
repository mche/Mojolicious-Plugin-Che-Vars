#!/usr/bin/env perl
# find ~/perl5/lib/ -type f -exec grep -Hni 'is not a controller' {} \;

use Mojo::Base 'Mojolicious';


use FindBin;
use lib "$FindBin::Bin/lib";

sub startup {# 
  my $app = shift;
  $app->plugin('Helper::Vars', helper=>'myvars');
  $app->routes->any('/:bar/:bar'=>sub{my $c = shift; $c->render(format=>'txt', text=>$c->dumper([$c->myvars('bar')]))});
}
__PACKAGE__->new()->start();



