/*
 * RT-Thread Space Special Edition
 * 
 * Copyright (c) 2011-2020, Shanghai Real-Thread Electronic Technology Co., Ltd.
 *
 * All rights reserved.
 *
 * Change Logs:
 * Date           Author       Notes
 * 2017/10/15     bernard      the first version
 */

#ifndef __RTT_LIBC_H__
#define __RTT_LIBC_H__

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif
int libc_system_init(void);

int libc_stdio_set_console(const char* device_name, int mode);
int libc_stdio_get_console(void);
int libc_stdio_read(void* buffer, size_t size);
int libc_stdio_write(const void* buffer, size_t size);
#ifdef __cplusplus
}
#endif

#endif
