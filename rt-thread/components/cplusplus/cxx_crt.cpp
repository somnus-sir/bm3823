/*
 * RT-Thread Space Special Edition
 * 
 * Copyright (c) 2011-2020, Shanghai Real-Thread Electronic Technology Co., Ltd.
 *
 * All rights reserved.
 *
* Change Logs:
* Date           Author       Notes
* 2015-03-07     Bernard      Add copyright header.
*/

#include <rtthread.h>
#include "crt.h"

void *operator new(size_t size)
{
    return rt_malloc(size);
}

void *operator new[](size_t size)
{
    return rt_malloc(size);
}

void operator delete(void *ptr)
{
    rt_free(ptr);
}

void operator delete[](void *ptr)
{
    return rt_free(ptr);
}

void __cxa_pure_virtual(void)
{
    rt_kprintf("Illegal to call a pure virtual function.\n");
}
