include Makefile.conf 

#--------------------------------------------------------------------------#
minimal:	perl perlmodules python node vendor-tools

all:    	perl perlmodules  julia python node  ruby spark R Jerasure vendor-tools



perl:		
	$(MAKE) -f Makefile.perl5
	touch perl

perlmodules:	perl
	$(MAKE) -f Makefile.perlmodules
	touch perlmodules

spark:
	$(MAKE) -f Makefile.spark
	touch spark

julia:
	$(MAKE) -f Makefile.julia
	touch julia

ruby:
	$(MAKE) -f Makefile.ruby
	touch ruby

python:
	$(MAKE) -f Makefile.python
	touch python

node:
	$(MAKE) -f Makefile.node
	touch node

R:
	$(MAKE) -f Makefile.R
	touch R

Jerasure:
	$(MAKE) -f Makefile.Jerasure
	touch Jerasure

vendor-tools:
	$(MAKE) -f Makefile.vendor-tools

clean:	clean-perl clean-julia clean-julia clean-python clean-node \
	clean-ruby clean-spark clean-R clean-Jerasure \
	clean-vendor-tools clean-octave clean-go

clean-vendor-tools:
	$(MAKE) -f Makefile.vendor-tools clean

clean-perl:
	$(MAKE) -f Makefile.perl5 clean
	$(MAKE) -f Makefile.perlmodules clean
	rm -f perl perlmodules

clean-julia:
	$(MAKE) -f Makefile.julia clean

clean-python:
	$(MAKE) -f Makefile.python clean

clean-ruby:
	$(MAKE) -f Makefile.ruby clean

clean-node:
	$(MAKE) -f Makefile.node clean
	rm -fr node*

clean-spark:
	$(MAKE) -f Makefile.spark clean	

clean-R:
	$(MAKE) -f Makefile.R clean

clean-Jerasure:
	$(MAKE) -f Makefile.Jerasure clean

clean-octave:
	$(MAKE) -f Makefile.octave clean

clean-go:
	$(MAKE) -f Makefile.go clean
