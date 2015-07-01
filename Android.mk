# Copyright (C) 2015 The Android Open Source Project
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
include $(CLEAR_VARS)

libevent_sys_src := \
	select.c \
	poll.c \
	epoll.c \
	signal.c

libevent_core_src := \
	buffer.c \
	bufferevent.c \
	bufferevent_filter.c \
	bufferevent_pair.c \
	bufferevent_ratelim.c \
	bufferevent_sock.c \
	event.c \
	evmap.c \
	evthread.c \
	evutil.c \
	evutil_rand.c \
	listener.c \
	log.c \
	strlcpy.c

libevent_extra_src := \
	evdns.c \
	event_tagging.c \
	evrpc.c \
	http.c

LOCAL_ARM_MODE := arm
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_SRC_FILES := \
	$(libevent_sys_src) \
	$(libevent_core_src) \
	$(libevent_extra_src)
LOCAL_SHARED_LIBRARIES := libc
LOCAL_MODULE := libevent
LOCAL_CFLAGS := \
	-O3 \
	-Wno-implicit-function-declaration \
	-Wno-strict-aliasing \
	-Wno-unused-parameter

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include

include $(BUILD_SHARED_LIBRARY)
