package Perl::Analysis::Static::Question::Sub::Name;
# ABSTRACT: Has the subroutine this name?

use Moose;

extends 'Perl::Analysis::Static::Question';

sub set_arguments {
	my ($self, $arguments) = @_;
	$self->class('Perl::Analysis::Static::Element::Sub');
	$self->filter(    ['Name'] );
	$self->arguments( [split(/:/, $arguments)] );
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Question::Sub::Name - Has the subroutine this name?

=head1 VERSION

version 0.003

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

