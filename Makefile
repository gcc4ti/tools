# TI-68k Developer Utilities Makefile
# Copyright (C) 2009-2011, Lionel Debroux

ifeq ($(OSTYPE), msys)
EXEEXT = .exe
else
EXEEXT =
endif

CC ?= gcc
CFLAGS = -Os -s -fno-exceptions -pipe -Wall -W -Wwrite-strings -Wp,-D_FORTIFY_SOURCE=2

all: setup ttbin2hex ttbin2oth ttbin2str ttextract ttstrip ttarchive ttpack ttunpack ttdos2ebk tthelp ttinfo ttebkgen ttchecksum ttbin2bin ttsplit ttppggen tttiler ttunebk ttunarchive tthex2bin ttsetname ttbin2txt

ttbin2hex ttbin2oth ttbin2str ttextract ttstrip ttarchive ttpack ttunpack ttdos2ebk tthelp ttinfo ttebkgen ttchecksum ttbin2bin ttsplit ttppggen tttiler ttunebk ttunarchive tthex2bin ttsetname ttbin2txt: $?
	$(CC) $@.c -o bin/$@ $^ $(CFLAGS) $(WARN_CFLAGS)

clean:
	rm -Rf bin

setup:
	mkdir -p bin

docs:
	echo "#############################################################################" > tooldocs.txt
	echo "SHORT USAGE INFORMATION of included PCTOOLS                                  " >> tooldocs.txt
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	echo "NOTE: tooldocs.txt will be automatically generated by calling each tool      " >> tooldocs.txt
	echo "      without any commandline parameter.                                     " >> tooldocs.txt
	echo "      Don't modify this document by hand. You will loose your changes        " >> tooldocs.txt
	echo "      when `make docs` will be run again                                     " >> tooldocs.txt
	echo "#############################################################################" >> tooldocs.txt
	bin/ttarchive$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttbin2str$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttbin2hex$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttbin2oth$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttbin2bin$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttbin2txt$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttchecksum$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttdos2ebk$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttebkgen$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttextract$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttinfo$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttpack$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttppggen$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttsetname$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttsplit$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttstrip$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/tttiler$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttunarchive$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttunebk$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	bin/ttunpack$(EXEEXT) >> tooldocs.txt || true
	echo "-----------------------------------------------------------------------------" >> tooldocs.txt
	echo tooldocs.txt generated.