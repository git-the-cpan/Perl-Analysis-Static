package Perl::Analysis::Static::Element;
{
  $Perl::Analysis::Static::Element::VERSION = '0.004'; # TRIAL
}
# ABSTRACT: represents an element of a Perl document

use Moose;
use PPI::Node;


has 'from' => ( is => 'rw', isa => 'Int' );
has 'to' => ( is => 'rw', isa => 'Int' );
has 'ppi_node' => ( is => 'rw', isa => 'PPI::Node' );

sub stringify {
    my ($self) = @_;
    
    die 'implement me';
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Element - represents an element of a Perl document

=head1 VERSION

version 0.004

=head1 ATTRIBUTES

=head2 from

The line this element starts on.

=head2 to

The line this element ends on.

=head2 ppi_node

The instance of PPI::Node this element originated from.

The analysis that created this element used L<PPI> to scan
the document and found some L<PPI::Node>s. Use this node
if the element isn't sufficient for some reason. This might
be the case if you want to do some L<PPI> magic with it
(maybe refactoring?).

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

