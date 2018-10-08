package ukb::report;

use Moose;
use npg_tracking::util::types;
use npg_qc::Schema;
use npg_qc::autoqc::role::result;

with qw/MooseX::Getopt/;

our $VERSION = '0';

Readonly::Scalar my $CLASS_FIELD             => q[__CLASS__];
Readonly::Scalar my $SEQ_COMPOSITION_PK_NAME => q[id_seq_composition];
Readonly::Scalar my $SLEEP_TIME              => 180;

has 'id_run'  => ( is          => 'ro',
                   isa         => 'ArrayRef[NpgTrackingRunId]',
                   required    => 0,
                   default     => sub {[]},
                 );

has 'lane'    => ( is          => 'ro',
                   isa         => 'ArrayRef[NpgTrackingLaneNumber]',
                   required    => 0,
                   default     => sub {[]},
                 );

has 'schema' =>    ( isa        => 'npg_qc::Schema',
                     metaclass  => 'NoGetopt',
                     is         => 'ro',
                     required   => 0,
                     lazy_build => 1,
                    );
sub _build_schema {
  return npg_qc::Schema->connect();
}

has '_schema_sources' => (isa        => 'ArrayRef',
                          is         => 'ro',
                          required   => 0,
                          lazy_build => 1,
                         );
sub _build__schema_sources {
  my $self = shift;
  return [$self->schema()->sources()];
}

sub _schema_has_source {
  my ($self, $source_name) = @_;
  return any { $_ eq $source_name } @{$self->_schema_sources()};
}

sub print_report(){
    my $self = shift;
    my $report = "Hello World!";
    return $report;
}

__PACKAGE__->meta->make_immutable;

1;

__END__


=head1 NAME

ukb::report

=head1 SYNOPSIS

=head1 DESCRIPTION

Overkill module for printing QC reports.

=head1 SUBROUTINES/METHODS

=head1 DEPENDENCIES

=over

=item Moose

=item MooseX::StrictConstructor

=item namespace::autoclean

=back

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

Ruben Bautista E<lt>rb11@sanger.ac.ukE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2018 GRL

This file is part of NPG.

NPG is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

=cut
