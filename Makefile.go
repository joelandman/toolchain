include Makefile.conf

#### Perl  
GOVER		= 1.5.1
GO		= go
GOSRC		= ${GO}${GOVER}.linux-amd64
GO_INST_PATH	= ${SICE_INST_PATH}
OSREV		= `uname -r`
#--------------------------------------------------------------------------#

all:    	install-go

clean:		clean-go  


install-go: 
	mkdir -p ${SICE_INST_PATH}/go
	tar -zxvf sources/${GOSRC}.tar.gz -C ${SICE_INST_PATH}/go
	rm -f /etc/profile.d/test.sh
	# and now the following hack because make is so ... so ... ... smart ...
	# no ... wait ... that other one ... not smart ...
	echo  "export PATH=DOLLAR_PATH:${SICE_INST_PATH}/go/bin" >> /etc/profile.d/test.sh
	sed -i 's/DOLLAR_PATH/$$PATH/g' /etc/profile.d/test.sh
	# yes, I really did that.  And you need to as well
	# because echo "something $PATH" > file is completely borked in make
	touch install-go

clean-go:
	rm -rf ${GO} make-go install-go 
