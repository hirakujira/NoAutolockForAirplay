TWEAK_NAME = NoAutoLockForAirPlay
NoAutoLockForAirPlay_OBJCC_FILES = Tweak.mm
SYSROOT=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk
NoAutoLockForAirPlay_CFLAGS = -F$(SYSROOT)/System/Library/CoreServices
NoAutoLockForAirPlay_PRIVATE_FRAMEWORKS = UIKit CoreGraphics Foundation
LDFLAGS += -march=armv7
include theos/makefiles/common.mk
include theos/makefiles/tweak.mk

sync: stage
	rsync -z _/Library/MobileSubstrate/DynamicLibraries/* root@10.0.2.16:/Library/MobileSubstrate/DynamicLibraries/
	ssh root@10.0.2.16 killall SpringBoard