LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.benchmarks.msgq@1.0
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

intermediates := $(local-generated-sources-dir)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

#
# Build IBenchmarkMsgQ.hal
#
GEN := $(intermediates)/android/hardware/benchmarks/msgq/1.0/BenchmarkMsgQAll.cpp
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IBenchmarkMsgQ.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
    $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
    -Lc++ -randroid.hardware:hardware/interfaces\
    android.hardware.benchmarks.msgq@1.0::$(patsubst %.hal,%,$(notdir $(PRIVATE_DEPS)))

$(GEN): $(LOCAL_PATH)/IBenchmarkMsgQ.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

LOCAL_EXPORT_C_INCLUDE_DIRS := $(intermediates)
LOCAL_SHARED_LIBRARIES := \
  libhidl \
  libhwbinder \
  libutils \

include $(BUILD_SHARED_LIBRARY)