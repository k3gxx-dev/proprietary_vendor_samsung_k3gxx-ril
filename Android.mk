# Copyright (C) 2026 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

# Shim for Intel RIL (atomic CAS function replacement)
include $(CLEAR_VARS)
LOCAL_MODULE := libshim_secnative
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES := shims/libshim_secnative.cpp
include $(BUILD_SHARED_LIBRARY)

# Intel XMM6360 RIL Driver
include $(CLEAR_VARS)
LOCAL_MODULE := libsec-ril
LOCAL_SRC_FILES := proprietary/lib/libsec-ril.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := samsung
LOCAL_VENDOR_MODULE := true
LOCAL_MULTILIB := 32
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

# Modem boot daemon (cbd)
include $(CLEAR_VARS)
LOCAL_MODULE := cbd
LOCAL_SRC_FILES := proprietary/bin/cbd
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := samsung
LOCAL_VENDOR_MODULE := true
LOCAL_MULTILIB := 32
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)
