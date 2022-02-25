VPATH = .:TMP

.SUFFIXES:
.SUFFIXES: .o .F90 .F 

include make.inc


# AIX (xlf) peculiarities. NB: Only necessary for Fortran files
ifneq (,$(findstring -DAIX,$(CPPFLAGS)))
   subs=-WF,-
   CPPFLAGS:=$(subst -,$(subs),$(CPPFLAGS))
endif


# Rules for running cpp and updating files in TMP directory
.F90.o:
	cd ./TMP ; $(CF90) -c $(CPPFLAGS) $(FFLAGS) $(F90FLG) $(INCLUDE) -o $*.o ../$<

.F.o:
	cd ./TMP ; $(CF77) -c $(CPPFLAGS) $(FFLAGS) $(F77FLG) $(INCLUDE) -o $*.o ../$<



TARGET = testpseudo2D

all : $(TARGET) 


#############################################################################
OBJECTS= \
			memory_stack.o \
			m_set_random_seed.o \
			sangoma_base.o \
			mod_pseudo.o \
			p_testpseudo2D.o


$(TARGET): $(OBJECTS) 
	cd ./TMP ; $(LD) $(LINKFLAGS) -o ../$(TARGET) $(OBJECTS) $(LIBS) 
#############################################################################

clean:
	rm $(TARGET) 
	cd ./TMP ; rm *.o *.mod
