#!/usr/bin/perl -w

use strict;
use lib qw(lib);
package Everything::node::codearchive;
use base qw(Everything::node::htmlcode);

sub node_to_xml
{
	my ($this, $NODE, $dbh) = @_;

	# Strip old windows line endings
	$NODE->{doctext} = $this->_clean_code($NODE->{doctext});
	return $this->SUPER::node_to_xml($NODE, $dbh);
}

sub node_id_equivs
{
	my ($this) = @_;
	return ["document_id", @{$this->SUPER::node_id_equivs()}];
}

sub xml_no_consider
{
	my ($this) = @_;
	return ["edittime", @{$this->SUPER::xml_no_consider()}];
}

1;