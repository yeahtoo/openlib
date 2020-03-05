PACKAGE_DIR := $(shell pwd)
PACKAGE_NAME := zlib-1.2.11
PACKAGE_TAR := $(PACKAGE_NAME).tar.gz
PREFIX ?= $(PACKAGE_DIR)/install
CROSS_TOOL ?= aarch64-himix100-linux

#http://www.zlib.net/zlib-1.2.11.tar.gz

all:
	@-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
	@-rm -rf $(PACKAGE_DIR)/install;
	@tar -xzf $(PACKAGE_TAR);
	@pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/; \
		echo -e "\e[32;1m""[1] configure""\033[0m"; \
		./configure --prefix=$(PREFIX); \
		patch -p1 < $(PACKAGE_DIR)/$(CROSS_TOOL).patch; \
		echo -e "\e[32;1m""[2] make""\033[0m"; \
		make -j 20; \
		echo -e "\e[32;1m""[3] install""\033[0m"; \
		make install; \
		echo -e "\e[32;1m""$(PACKAGE_NAME) down!""\033[0m" \
	popd

.PHONY: clean
clean:
	@-pushd $(PACKAGE_DIR)/$(PACKAGE_NAME)/ &&\
	make -C $(PACKAGE_DIR)/$(PACKAGE_NAME)/ clean && \
	popd

.PHONY: distclean
distclean:
	-rm -rf $(PACKAGE_DIR)/$(PACKAGE_NAME);
#	-rm -rf $(PREFIX);
	-rm -rf install;

