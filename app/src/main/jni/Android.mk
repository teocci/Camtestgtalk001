LOCAL_PATH:= $(call my-dir)
MY_LOCAL_PATH = $(LOCAL_PATH)

###########################################################
# build android libgtalk
# libgtalk: clone from libjingle, for generat NDK appplicaton
#      threads, socket, signal/slot and messages, etc.
#
include $(CLEAR_VARS)
LOCAL_MODULE := libgtalk
LOCAL_CPP_EXTENSION := .cc .cpp
LOCAL_CPPFLAGS := -O2 -DHAMMER_TIME=1 -DLOGGING=1 -DHASHNAMESPACE=__gnu_cxx -DHASH_NAMESPACE=__gnu_cxx -DPOSIX -DDISABLE_DYNAMIC_CAST -D_REENTRANT -DOS_LINUX=OS_LINUX -DLINUX -D_DEBUG  -DANDROID

#including source files
include $(LOCAL_PATH)/lib_build.mk

LOCAL_LDLIBS := -llog -lz

include $(BUILD_SHARED_LIBRARY)

###########################################################
# the native jni interface library
#
include $(CLEAR_VARS)
LOCAL_MODULE    := ipcamera
LOCAL_CPPFLAGS := -O2 -DHAMMER_TIME=1 -DLOGGING=1 -DHASHNAMESPACE=__gnu_cxx -DHASH_NAMESPACE=__gnu_cxx -DPOSIX -DDISABLE_DYNAMIC_CAST -D_REENTRANT -DOS_LINUX=OS_LINUX -DLINUX -D_DEBUG  -DANDROID
LOCAL_C_INCLUDES :=  ./
LOCAL_SHARED_LIBRARIES := libgtalk
LOCAL_LDLIBS := -llog

include $(LOCAL_PATH)/build.mk

include $(BUILD_SHARED_LIBRARY)
