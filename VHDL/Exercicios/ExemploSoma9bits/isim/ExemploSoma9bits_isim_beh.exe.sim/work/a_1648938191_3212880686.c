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
static const char *ng0 = "C:/Users/Keli Tauana/Documents/SLP/ExemploSoma9bits/ExemploSoma9bits.vhd";
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_2254111597_3536714472(char *, char *, char *, char *, char *, char *);


static void work_a_1648938191_3212880686_p_0(char *t0)
{
    char t1[16];
    char t4[16];
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(41, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t5 = ((IEEE_P_3499444699) + 2616);
    t6 = (t0 + 4640U);
    t2 = xsi_base_array_concat(t2, t4, t5, (char)99, (unsigned char)2, (char)97, t3, t6, (char)101);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 4640U);
    t9 = ieee_p_3499444699_sub_2254111597_3536714472(IEEE_P_3499444699, t1, t2, t4, t8, t7);
    t10 = (t1 + 12U);
    t11 = *((unsigned int *)t10);
    t12 = (1U * t11);
    t13 = (5U != t12);
    if (t13 == 1)
        goto LAB5;

LAB6:    t14 = (t0 + 2912);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t9, 5U);
    xsi_driver_first_trans_fast_port(t14);

LAB2:    t19 = (t0 + 2832);
    *((int *)t19) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(5U, t12, 0);
    goto LAB6;

}


extern void work_a_1648938191_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1648938191_3212880686_p_0};
	xsi_register_didat("work_a_1648938191_3212880686", "isim/ExemploSoma9bits_isim_beh.exe.sim/work/a_1648938191_3212880686.didat");
	xsi_register_executes(pe);
}
