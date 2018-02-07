LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        buffer.c \
        bufferevent.c \
        bufferevent_filter.c \
        bufferevent_pair.c \
        bufferevent_ratelim.c \
        bufferevent_sock.c \
        bufferevent_openssl.c \
        event.c \
        evmap.c \
        evthread.c \
        evthread_pthread.c \
        evutil.c \
        evutil_rand.c \
        listener.c \
        log.c \
        signal.c \
        strlcpy.c \
        evdns.c \
        event_tagging.c \
        evrpc.c \
        http.c \
        poll.c \
        epoll.c \
        select.c

LOCAL_C_INCLUDES += \
    external/openssl/include \
	$(LOCAL_PATH)/include

LOCAL_CFLAGS += -D_BSD_SOURCE \
				 -Wno-implicit-function-declaration \
				 -Wno-strict-aliasing \
				 -DSIZE_MAX=4294967295U
LOCAL_LDLIBS += -lpthread

LOCAL_SHARED_LIBRARIES += libssl libcrypto

LOCAL_MODULE_TAGS := eng

LOCAL_MODULE := libevent

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        http-server.c

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include

LOCAL_CFLAGS += -D_BSD_SOURCE \
				 -Wno-implicit-function-declaration \
				 -Wno-strict-aliasing \
				 -DSIZE_MAX=4294967295U

LOCAL_MODULE_TAGS := eng

LOCAL_SHARED_LIBRARIES += libevent

LOCAL_MODULE := httpserver

include $(BUILD_EXECUTABLE)
