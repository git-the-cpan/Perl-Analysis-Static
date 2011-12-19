package Perl::Analysis::Static::Document;
# ABSTRACT: a Perl document

use Moose;
use PPI;
use PPI::Cache;

use Module::Runtime qw(use_module);
    
has 'filename' => ( is => 'rw', isa => 'Str' );
has 'ppi' => (
    is      => 'rw',
    isa     => 'PPI::Document',
    lazy    => 1,
    builder => '_build_ppi'
);


sub find {
    my ($self, $class) = @_;

    unless ($class =~ m{Perl::Analysis::Static::Element::(.+)}) {
        # we should do something else here
        die "BUG: Unable to match class '$class'";
    }
    my $element=$1;
    
    # get name of analysis
    my $analysis_class = 'Perl::Analysis::Static::Analysis::'.$element;

    use_module($analysis_class);
    
    # TODO
    my $analysis=$analysis_class->new();
    return $analysis->analyse($self);
}


sub _build_ppi {
    my ($self) = @_;

    # content ought to be passed as reference
#    my $ppi = PPI::Document->new( \$self->source()->content() );
    my $ppi = PPI::Document->new( $self->filename );
	unless ($ppi) {
		die "Unable to create instance of '".$self->filename."'";
	}

    # we have to set the tab width and call index_locations or we won't get
    # correct information about the location (or maybe no location information
    # at all). I don't know if this is always the case or just a matter of
    # versioning.
    $ppi->tab_width(4);
    $ppi->index_locations() or die 'index';

    return $ppi;
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Document - a Perl document

=head1 VERSION

version 0.003

=head2 find ($class)

Find all elements of a certain $class.

=head1 INTERNAL METHODS

=head2 _build_ppi ()

Return PPI::Document of this document.

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

