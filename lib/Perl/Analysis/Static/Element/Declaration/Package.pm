package Perl::Analysis::Static::Element::Declaration::Package;
# ABSTRACT: declaration of a package

use Moose;

extends 'Perl::Analysis::Static::Element::Declaration';

has 'name' => ( is => 'rw', isa => 'Str' );


sub stringify {
    my ($self)=@_;
    
    return $self->from.': '.$self->name;
}

1;
__END__
=pod

=head1 NAME

Perl::Analysis::Static::Element::Declaration::Package - declaration of a package

=head1 VERSION

version 0.003

=head2 stringify ()

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

