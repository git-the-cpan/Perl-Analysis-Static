package Perl::Analysis::Static::Element::String;
{
  $Perl::Analysis::Static::Element::String::VERSION = '0.004'; # TRIAL
}
# ABSTRACT: a string

use Moose;

extends 'Perl::Analysis::Static::Element';

has 'string' => ( is => 'rw', isa => 'Str' );


sub stringify {
    my ($self) = @_;
    
    return $self->from.': '.$self->string();
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Element::String - a string

=head1 VERSION

version 0.004

=head2 stringify

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

