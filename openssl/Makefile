PACKAGE_DIR := $(shell pwd)
PACKAGE_NAME := openssl-1.1.1d
PACKAGE_TAR := $(PACKAGE_NAME).tar.gz
PREFIX ?= $(PACKAGE_DIR)/install
CROSS_TOOL ?= aarch64-himix100-linux

all: configure
	@echo -e "\e[32;1m""[2] make""\033[0m";
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/;
	@echo -e "\e[32;1m""[3] install""\033[0m";
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/ install_sw;
	@echo -e "\e[32;1m""$(PACKAGE_NAME) down!""\033[0m";

.PHONY: configure
configure:
	@echo -e "\e[32;1m""[1] configure""\033[0m";
	@-rm -rf $(PACKAGE_DIR)/install;
ifeq ($(wildcard $(PACKAGE_DIR)/$(PACKAGE_NAME)/.*), )
	tar -xzf $(PACKAGE_TAR)
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		./config \
		--prefix=$(PREFIX) \
		CROSS_COMPILE=$(CROSS_TOOL)- \
		no-asm shared no-async; \
		echo -e "\e[32;1m""--- patch ---""\033[0m"; \
		patch -p1 < $(PACKAGE_DIR)/package.patch; \
	popd
endif

.PHONY: clean
clean:
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/ clean;

.PHONY: distclean
distclean:
	-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
#	-rm -rf $(PREFIX);
	-rm -rf install;

