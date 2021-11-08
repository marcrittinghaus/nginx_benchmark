UK_ROOT  ?= $(PWD)/../../unikraft
UK_LIBS  ?= $(PWD)/../../libs

LIBS-y       := $(UK_LIBS)/lib-lwip
LIBS-y       := $(LIBS-y):$(UK_LIBS)/lib-nginx
LIBS-y       := $(LIBS-y):$(UK_LIBS)/lib-pthread-embedded
LIBS-y       := $(LIBS-y):$(UK_LIBS)/lib-newlib

PLATS-y      :=

all:
	@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS-y)

$(MAKECMDGOALS):
	@$(MAKE) -C $(UK_ROOT) A=$(PWD) L=$(LIBS-y) $(MAKECMDGOALS)
