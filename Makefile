WORK_DIR:=$(shell pwd)
CROSS_TOOL:=arm-himix100-linux
#CROSS_TOOL:=aarch64-himix100-linux
export CROSS_TOOL
export PREFIX=$(WORK_DIR)/install

export ac_cv_func_realloc_0_nonnull=yes
export ac_cv_func_malloc_0_nonnull=yes

# ifeq ($(CROSS_TOOL), )
# $(error you must set CROSS_TOOL first!)
# endif

LIBUSB_VER:=1.0.22
OPENSSL_VER:=1.1.1d
LIBPLIST_VER:=2.1.0
LIBUSBMUXD_VER:=2.0.2
LIBIMOBILELIST_VER:=1.2.1
USBMUXD_VER:=1.1.1

packages := libusb openssl libplist libusbmuxd libimobiledevice usbmuxd zlib openssh wireless libnl hostapd wpa ntp usb-modeswitch

.PHONY : $(packages)
all: $(packages)
	@echo -e "\e[33;1m""---------make all done!!---------""\033[00m";
clean: $(foreach n, $(packages), $(n)_clean)
distclean: $(foreach n, $(packages), $(n)_distclean)
#	-rm -rf $(PREFIX)

libusb:
	@echo -e "\e[33;1m""---------task [1] build libusb---------""\033[00m";
	make -C $(WORK_DIR)/libusb all;
libusb_clean:
	@echo -e "\e[33;1m""---------task [1] clean libusb---------""\033[00m";
	make -C $(WORK_DIR)/libusb clean;
libusb_distclean:
	@echo -e "\e[33;1m""---------task [1] distclean libusb---------""\033[00m";
	make -C $(WORK_DIR)/libusb distclean;

openssl:
	@echo -e "\e[33;1m""---------task [2] build openssl---------""\033[00m";
	make -C $(WORK_DIR)/openssl all;
openssl_clean:
	@echo -e "\e[33;1m""---------task [2] clean openssl---------""\033[00m";
	make -C $(WORK_DIR)/openssl clean;
openssl_distclean:
	@echo -e "\e[33;1m""---------task [2] distclean openssl---------""\033[00m";
	make -C $(WORK_DIR)/openssl distclean;

libplist:
	@echo -e "\e[33;1m""---------task [3] build libplist---------""\033[00m";
	make -C $(WORK_DIR)/libplist all;
libplist_clean:
	@echo -e "\e[33;1m""---------task [3] clean libplist---------""\033[00m";
	make -C $(WORK_DIR)/libplist clean;
libplist_distclean:
	@echo -e "\e[33;1m""---------task [3] distclean libplist---------""\033[00m";
	make -C $(WORK_DIR)/libplist distclean;

libusbmuxd:
	@echo -e "\e[33;1m""---------task [4] build libusbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/libusbmuxd all;
libusbmuxd_clean:
	@echo -e "\e[33;1m""---------task [4] clean libusbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/libusbmuxd clean;
libusbmuxd_distclean:
	@echo -e "\e[33;1m""---------task [4] distclean libusbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/libusbmuxd distclean;

libimobiledevice:
	@echo -e "\e[33;1m""---------task [5] build libimobiledevice---------""\033[00m";
	make -C $(WORK_DIR)/libimobiledevice all;
libimobiledevice_clean:
	@echo -e "\e[33;1m""---------task [5] clean libimobiledevice---------""\033[00m";
	make -C $(WORK_DIR)/libimobiledevice clean;
libimobiledevice_distclean:
	@echo -e "\e[33;1m""---------task [5] distclean libimobiledevice---------""\033[00m";
	make -C $(WORK_DIR)/libimobiledevice distclean;

usbmuxd:
	@echo -e "\e[33;1m""---------task [6] build usbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/usbmuxd all;
usbmuxd_clean:
	@echo -e "\e[33;1m""---------task [6] clean usbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/usbmuxd clean;
usbmuxd_distclean:
	@echo -e "\e[33;1m""---------task [6] distclean usbmuxd---------""\033[00m";
	make -C $(WORK_DIR)/usbmuxd distclean;

zlib:
	@echo -e "\e[33;1m""---------task build zlib---------""\033[00m";
	make -C $(WORK_DIR)/zlib all;
zlib_clean:
	@echo -e "\e[33;1m""---------task clean zlib---------""\033[00m";
	make -C $(WORK_DIR)/zlib clean;
zlib_distclean:
	@echo -e "\e[33;1m""---------task distclean zlib---------""\033[00m";
	make -C $(WORK_DIR)/zlib distclean;

openssh: zlib openssl
	@echo -e "\e[33;1m""---------task build openssh---------""\033[00m";
	make -C $(WORK_DIR)/openssh all;
openssh_clean:
	@echo -e "\e[33;1m""---------task clean openssh---------""\033[00m";
	make -C $(WORK_DIR)/openssh clean;
openssh_distclean:
	@echo -e "\e[33;1m""---------task distclean openssh---------""\033[00m";
	make -C $(WORK_DIR)/openssh distclean;

wireless:
	@echo -e "\e[33;1m""---------task build wireless---------""\033[00m";
	make -C $(WORK_DIR)/wireless all;
wireless_clean:
	@echo -e "\e[33;1m""---------task clean wireless---------""\033[00m";
	make -C $(WORK_DIR)/wireless clean;
wireless_distclean:
	@echo -e "\e[33;1m""---------task distclean wireless---------""\033[00m";
	make -C $(WORK_DIR)/wireless distclean;

libnl:
	@echo -e "\e[33;1m""---------task build libnl---------""\033[00m";
	make -C $(WORK_DIR)/libnl all;
libnl_clean:
	@echo -e "\e[33;1m""---------task clean libnl---------""\033[00m";
	make -C $(WORK_DIR)/libnl clean;
libnl_distclean:
	@echo -e "\e[33;1m""---------task distclean libnl---------""\033[00m";
	make -C $(WORK_DIR)/libnl distclean;

hostapd: openssl libnl
	@echo -e "\e[33;1m""---------task build hostapd---------""\033[00m";
	make -C $(WORK_DIR)/hostapd all;
hostapd_clean:
	@echo -e "\e[33;1m""---------task clean hostapd---------""\033[00m";
	make -C $(WORK_DIR)/hostapd clean;
hostapd_distclean:
	@echo -e "\e[33;1m""---------task distclean hostapd---------""\033[00m";
	make -C $(WORK_DIR)/hostapd distclean;

wpa: openssl libnl
	@echo -e "\e[33;1m""---------task build wpa_supplicant---------""\033[00m";
	make -C $(WORK_DIR)/wpa all;
wpa_clean:
	@echo -e "\e[33;1m""---------task clean wpa_supplicant---------""\033[00m";
	make -C $(WORK_DIR)/wpa clean;
wpa_distclean:
	@echo -e "\e[33;1m""---------task distclean wpa_supplicant---------""\033[00m";
	make -C $(WORK_DIR)/wpa distclean;

ntp: openssl
	@echo -e "\e[33;1m""---------task build ntp---------""\033[00m";
	make -C $(WORK_DIR)/ntp all;
ntp_clean:
	@echo -e "\e[33;1m""---------task clean ntp---------""\033[00m";
	make -C $(WORK_DIR)/ntp clean;
ntp_distclean:
	@echo -e "\e[33;1m""---------task distclean ntp---------""\033[00m";
	make -C $(WORK_DIR)/ntp distclean;

usb-modeswitch:
	@echo -e "\e[33;1m""---------task build usb-modeswitch---------""\033[00m";
	make -C $(WORK_DIR)/usb-modeswitch all;
usb-modeswitch_clean:
	@echo -e "\e[33;1m""---------task clean usb-modeswitch---------""\033[00m";
	make -C $(WORK_DIR)/usb-modeswitch clean;
usb-modeswitch_distclean:
	@echo -e "\e[33;1m""---------task distclean usb-modeswitch---------""\033[00m";
	make -C $(WORK_DIR)/usb-modeswitch distclean;

