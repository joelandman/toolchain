include Makefile.conf

#### R  
RVER		= 3.2.2
R			= R-${RVER}
R_INST_PATH	= ${SICE_INST_PATH}
OSREV		= `uname -r`
CFLAGS		= "-mtune=corei7-avx "
FFLAGS		= ${CFLAGS}
FCFLAGS		= ${CFLAGS}
CXXFLAGS	= ${CFLAGS}
#FC		= gfortran-4.9
#CXX		= g++-4.9
#CC		= gcc-4.9
#CXX11		= g++-4.9 -std=c++11
RFLAGS		= --with-blas --with-lapack --with-readline  --with-system-zlib --with-system-bzlib --with-system-pcre --with-system-xz --with-recommended-packages --with-x
#--------------------------------------------------------------------------#

all:    	install-R-modules

clean:		clean-R  

config-R:	
	tar -zxvf sources/${R}.tar.gz
	cd ${R} ; export CFLAGS=${CFLAGS} CXXFLAGS=${CXXFLAGS}  FFLAGS=${FFLAGS} FCFLAGS=${FCFLAGS} ; ./configure --prefix=${SICE_INST_PATH} ${RFLAGS}
	cd ${R} ; /bin/bash tools/rsync-recommended 			  
	touch config-R

make-R: config-R
	cd ${R} ;	CFLAGS=${CFLAGS} make -j8
	touch make-R

install-R: make-R
	# below to fix a build issue
	mkdir -p ${SICE_INST_PATH}/lib/R/lib/
	cd ${R} ; CFLAGS=${CFLAGS} make install
	touch install-R

install-R-modules: install-R
	# create the .Rprofile file
	#echo 'cat(".Rprofile: Setting US repository")' > ${HOME}/.Rprofile
	echo 'r = getOption("repos") # use the US repo for CRAN' >> ${HOME}/.Rprofile
	echo 'r["CRAN"] = "http://cran.us.r-project.org"' >> ${HOME}/.Rprofile
	echo 'options(repos = r)' >> ${HOME}/.Rprofile
	echo 'rm(r)' >> ${HOME}/.Rprofile
	#
	# create an .Renviron file to make packages installable by everyone
	mkdir /opt/scalable/Rpackages/ ; chown -R 1777 /opt/scalable/Rpackages/
	echo 'R_LIBS=/opt/scalable/Rpackages/' >> ${HOME}/.Renviron
	#
	# now install the modules we want
	/opt/scalable/bin/R --no-save --quiet -e 'install.packages("ggplot")'
	/opt/scalable/bin/R --no-save --quiet -e 'install.packages("tseries")'
	/opt/scalable/bin/R --no-save --quiet -e 'install.packages("urca")'
	/opt/scalable/bin/R --no-save --quiet -e 'install.packages("HH")'
	/opt/scalable/bin/R --no-save --quiet -e 'install.packages("tsDyn")'
	/opt/scalable/bin/R --no-save --quiet -e 'install.packages("car")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("gplots")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("TTR")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("gtools")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("hts")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("parallelize.dynamic")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("partools")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("zoo")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("fts")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("tframe")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("forecast")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("ltsa")'
	/opt/scalable/bin/R --no-save --quiet -e  'install.packages("bspec")' 
	touch install-R-modules

clean-R:
	rm -rf ${R} make-R config-R install-R install-R-modules ${R}
