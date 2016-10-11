#
# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

# build profiler for Nfc.
include $(CLEAR_VARS)

LOCAL_MODULE := libvts_profiler_hidl_nfc@1.0

LOCAL_SRC_FILES := \
   Nfc.vts \
   types.vts \

LOCAL_C_INCLUDES += \
  test/vts/drivers/libprofiling \

LOCAL_VTS_MODE := PROFILER

LOCAL_SHARED_LIBRARIES := \
   android.hardware.nfc@1.0 \
   libbase \
   libcutils \
   liblog \
   libhidl \
   libhwbinder \
   libprotobuf-cpp-full \
   libvts_common \
   libvts_multidevice_proto \
   libvts_profiling \
   libutils \

LOCAL_PROTOC_OPTIMIZE_TYPE := full

include $(BUILD_SHARED_LIBRARY)

# build profiler for NfcClientCallback.
include $(CLEAR_VARS)

LOCAL_MODULE := libvts_profiler_hidl_nfc_client_callback_@1.0

LOCAL_SRC_FILES := \
   NfcClientCallback.vts \
   types.vts \

LOCAL_C_INCLUDES += \
  test/vts/drivers/libprofiling \

LOCAL_VTS_MODE := PROFILER

LOCAL_SHARED_LIBRARIES := \
   android.hardware.nfc@1.0 \
   libbase \
   libcutils \
   liblog \
   libhidl \
   libhwbinder \
   libprotobuf-cpp-full \
   libvts_common \
   libvts_multidevice_proto \
   libvts_profiling \
   libutils \

LOCAL_PROTOC_OPTIMIZE_TYPE := full

include $(BUILD_SHARED_LIBRARY)