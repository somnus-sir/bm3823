/*  linkcmds
 *
 *  $Id: linkcmds,v 1.8.2.1 2000/05/24 17:06:38 joel Exp $
 */

OUTPUT_ARCH(sparc)
__DYNAMIC  =  0;

/*
 * The memory map looks like this:
 * +--------------------+ <- low memory
 * | .text              |
 * |        etext       |
 * |        ctor list   | the ctor and dtor lists are for
 * |        dtor list   | C++ support
 * |        _endtext    |
 * +--------------------+
 * | .data              | initialized data goes here
 * |        _sdata      |
 * |        _edata      |
 * +--------------------+
 * | .bss               |
 * |        __bss_start | start of bss, cleared by crt0
 * |        _end        | start of heap, used by sbrk()
 * +--------------------+
 * |    heap space      |
 * |        _ENDHEAP    |
 * |    stack space     | 
 * |        __stack     | top of stack
 * +--------------------+ <- high memory
 */


/*
 * User modifiable values:
 *
 * _CLOCK_SPEED               in Mhz (used to program the counter/timers)
 *
 * _PROM_SIZE                 size of PROM (permissible values are 128K, 256K,
 *                               512K, 1M, 2M, 4M, 8M and 16M)
 * _RAM_SIZE                  size of RAM (permissible values are 256K, 512K,
 *                               1M, 2M, 4M, 8M, 16M, and 32M)
 *
 */

/* Default values, can be overridden */

_PROM_SIZE = 2M;
_RAM_SIZE = 4M;

_RAM_START = 0x20000000;
_RAM_END = _RAM_START + _RAM_SIZE;

_PROM_START = 0x00000000;
_PROM_END = _PROM_START + _PROM_SIZE;

/*
 *  Alternate names without leading _.
 */

PROM_START = _PROM_START;
PROM_SIZE = _PROM_SIZE;
PROM_END = _PROM_END;

RAM_START = _RAM_START;
RAM_SIZE = _RAM_SIZE;
RAM_END = _RAM_END;

/*
 PROVIDE (__stack = _RAM_END);	//move to the file of stack.ld
*/

/*
 *  Base address of the on-CPU peripherals
 */

_LEON_REG = 0x81000000;
LEON_REG = 0x81000000;

/* these are the maximum values */

MEMORY
{
  rom     : ORIGIN = 0x00000000, LENGTH = 256M
  ram     : ORIGIN = 0x20000000, LENGTH = 1024M
}

/*
 * stick everything in ram (of course)
 */
/* ENTRY(_hardreset) */
/* STARTUP(build/kernel/libcpu/sparcv8/trap.o) */
ENTRY(_hardreset)
SECTIONS
{
  .text :
  {
    _hardreset = .;
    KEEP(*(.text.entrypoint))       /* The entry point */
    CREATE_OBJECT_SYMBOLS
    . = ALIGN (16);

    text_start = .;
    _text_start = .;
    *(.text)                        /* remaining code */
    *(.text.*)                      /* remaining code */
    . = ALIGN (16);

    *(.eh_frame)
    . = ALIGN (16);
    
   /* *(.gnu.linkonce.t*) */

    /*
     * C++ constructors
     */
    __CTOR_LIST__ = .;
    LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
    *(.ctors)
    LONG(0)
    __CTOR_END__ = .;
    __DTOR_LIST__ = .;
    LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
    *(.dtors)
    LONG(0)
    __DTOR_END__ = .;

    . = ALIGN(4);
    __rt_init_start = .;
    KEEP(*(SORT(.rti_fn*)))
    __rt_init_end = .;
    . = ALIGN(4);

    /* section information for utest */
    . = ALIGN(4);
    __rt_utest_tc_tab_start = .;
    KEEP(*(UtestTcTab))
    __rt_utest_tc_tab_end = .;

    /* section information for finsh shell */
    . = ALIGN(4);
    __fsymtab_start = .;
    KEEP(*(FSymTab))
    __fsymtab_end = .;
    . = ALIGN(4);
    __vsymtab_start = .;
    KEEP(*(VSymTab))
    __vsymtab_end = .;
    . = ALIGN(4);

    _rodata_start = . ;
    *(.rodata*)
  /*  *(.gnu.linkonce.r*) */
    _erodata = ALIGN( 0x10 ) ;

    etext = ALIGN(0x10);
    _etext = .;
    *(.init)
    *(.fini)
    *(.lit)
    *(.shdata)
    . = ALIGN (16);
    _endtext = .;
  } >ram
  
  /*
  .dynamic	  : { *(.dynamic) 	} >ram
  .got		  : { *(.got) 		} >ram
  .plt   	  : { *(.plt) 		} >ram
  .hash		  : { *(.hash)		} >ram
  .dynrel	  : { *(.dynrel)	} >ram
  .dynsym	  : { *(.dynsym)	} >ram
  .dynstr	  : { *(.dynstr)	} >ram
  .hash		  : { *(.hash)		} >ram
  */
  
  .data :
  {
    data_start = .;
    _data_start = .;
    _sdata = . ;
    *(.data)
    /*
    *(.gnu.linkonce.d*)
    *(.gcc_except_table)
    */
    . = ALIGN(0x10);
    edata = .;
    _edata = .;
  } > ram
  .shbss :
  {
    *(.shbss)
  } 
  .bss :
  {
    __bss_start = ALIGN(0x8);
    _bss_start = .;
    bss_start = .;
    *(.bss)
    *(COMMON)
    __bss_end = .;
    end = .;
    _end = ALIGN(0x8);
    __end = ALIGN(0x8);
  }  > ram
  
  
   .jcr . (NOLOAD)  : { *(.jcr) 		}
  
  .stab . (NOLOAD) :
  {
    [ .stab ]
  }
  .stabstr . (NOLOAD) :
  {
    [ .stabstr ]
  }
  
  
}
