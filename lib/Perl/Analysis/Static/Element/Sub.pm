package Perl::Analysis::Static::Element::Sub;
# ABSTRACT: a subroutine declaration

use Moose;

extends 'Perl::Analysis::Static::Element';

has 'name' => ( is => 'rw', isa => 'Str' );


sub stringify {
    my ($self) = @_;
    return $self->from.'-'.$self->to.': '.$self->name();
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Element::Sub - a subroutine declaration

=head1 VERSION

version 0.003

=head2 stringify

TODO:

tell me if it's a function or a method.
tell me the arguments.
show me the body.

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

