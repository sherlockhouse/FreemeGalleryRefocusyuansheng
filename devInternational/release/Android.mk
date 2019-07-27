LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# Module name should match apk name to be installed
LOCAL_MODULE := FreemeGallery
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED

LOCAL_OVERRIDES_PACKAGES := Gallery Gallery3D GalleryNew3D Gallery2 DreamGallery2 NewGallery2 MtkGallery2

LOCAL_PRIVILEGED_MODULE := true
LOCAL_MULTILIB :=32
LOCAL_PREBUILT_JNI_LIBS_arm     := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/lib/armeabi-v7a/*.so))

LOCAL_REQUIRED_MODULES := freemegallery_custom.properties classifier.pb classifier.txt

# Supports Sprd Refocus.
ifeq ($(strip $(FREEME_PRODUCT_CHIPVENDOR)),sprd)
  LOCAL_JNI_SHARED_LIBRARIES += libjni_refocus_newgallery libjni_sprd_refocus_bokeh
  LOCAL_REQUIRED_MODULES += libjni_sprd_newrefocus
endif

include $(BUILD_PREBUILT)

#####################################################
include $(CLEAR_VARS)
LOCAL_MODULE := freemegallery_custom.properties
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := classifier.pb
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := classifier.txt
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
