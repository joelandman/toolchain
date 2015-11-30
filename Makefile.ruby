include Makefile.conf

RUBY_INST_PATH	= ${SICE_INST_PATH}
RUBY_VERSION	= 2.1.2




all:    	install-ruby

clean:		clean-ruby  

config-ruby:	
	tar -zxvf sources/ruby-${RUBY_VERSION}.tar.gz
	cd ruby-${RUBY_VERSION} ; ./configure --prefix=${RUBY_INST_PATH}  --enable-load-relative  --enable-shared
	touch config-ruby

make-ruby: config-ruby
	cd ruby-${RUBY_VERSION}; make -j4
	touch make-ruby

install-ruby: make-ruby
	cd ruby-${RUBY_VERSION} ; make install
	touch install-ruby

clean-ruby:
	rm -rf ruby install-ruby make-ruby config-ruby ruby-${RUBY_VERSION}
