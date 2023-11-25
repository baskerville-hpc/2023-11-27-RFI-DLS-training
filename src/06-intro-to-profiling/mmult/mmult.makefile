include common.makefile

# The MPI compiler commands (typically mpicc and mpif90) are autodetected
# by common.makefile. You can override by uncommenting the following:
#MPICC=
#MPIF90=

CFLAGS = -g

targets = mmult_c mmult_c_correct mmult_f

.PHONY: all
all: $(targets)

mmult_c: mmult.c
	$(MPICC) $(CFLAGS) -std=c99 $^ -o $@

mmult_c_correct: mmult_correct.c
	$(MPICC) $(CFLAGS) -std=c99 $^ -o $@

mmult_f: mmult.f90
	$(MPIF90) $(CFLAGS) $(LEGACY_STD_FCFLAG) -cpp $^ -o $@

clean:
	$(RM) $(targets) mmult_c mmult_c_correct mmult_f res*.mat

