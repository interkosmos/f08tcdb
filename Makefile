FC      = gfortran9
RPATH   = -Wl,-rpath=/usr/local/lib/gcc9/
FFLAGS  = -Wall $(RPATH) -std=f2008 -Wall -fmax-errors=1 -fcheck=all
LDFLAGS = -I/usr/local/include/ -L/usr/local/lib/
LDLIBS  = -ltokyocabinet -lz -lbz2 -lrt -lpthread -lm -lc

.PHONY: all clean examples

all: tcdb examples

examples:
	$(FC) $(FFLAGS) $(LDFLAGS) -O1 -o hdb examples/hdb/hdb.f90 tcutil.o tchdb.o $(LDLIBS)

tcdb:
	$(FC) $(FFLAGS) $(LDFLAGS) -c src/tcutil.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -c src/tclist.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -c src/tcmdb.f90
	$(FC) $(FFLAGS) $(LDFLAGS) -c src/tchdb.f90

clean:
	rm *.mod *.o hdb
