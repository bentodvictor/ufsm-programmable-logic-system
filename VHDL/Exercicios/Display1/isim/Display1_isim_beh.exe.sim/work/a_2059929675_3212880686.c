/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Keli Tauana/Documents/SLP/Display1/Display1.vhd";



static void work_a_2059929675_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    unsigned char t10;
    char *t11;
    int t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 2672);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t9 = *((int *)t8);
    t10 = (t9 < 7);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2752);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast_port(t2);

LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 1152U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB8:    xsi_set_current_line(47, ng0);
    t7 = (t0 + 1032U);
    t11 = *((char **)t7);
    t12 = *((int *)t11);
    t13 = (t12 + 1);
    t7 = (t0 + 2752);
    t14 = (t7 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((int *)t17) = t13;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB9;

}


extern void work_a_2059929675_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2059929675_3212880686_p_0};
	xsi_register_didat("work_a_2059929675_3212880686", "isim/Display1_isim_beh.exe.sim/work/a_2059929675_3212880686.didat");
	xsi_register_executes(pe);
}
