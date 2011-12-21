package Perl::Analysis::Static::Filter::Range;
{
  $Perl::Analysis::Static::Filter::Range::VERSION = '0.004'; # TRIAL
}
# ABSTRACT: Does the element lie in this range of lines?

use Moose;

extends 'Perl::Analysis::Static::Filter';

has 'from' => ( is => 'rw', isa => 'Int' );
has 'to'   => ( is => 'rw', isa => 'Int' );

sub _filter {
    my ( $self, $element ) = @_;

#warn "element is ", $element->from(), " - ", $self->to,"\n";
    return 1 if $element->from() >= $self->from()
      and $element->to() <= $self->to();
}

sub _set_arguments {
    my ( $self, $arguments ) = @_;

    $self->from( $arguments->[0] );
    $self->to( $arguments->[1] );

#warn "set args to ", $self->from," - ",$self->to,"\n";
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Filter::Range - Does the element lie in this range of lines?

=head1 VERSION

version 0.004

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

