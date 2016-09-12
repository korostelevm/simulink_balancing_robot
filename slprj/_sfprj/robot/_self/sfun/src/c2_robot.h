#ifndef __c2_robot_h__
#define __c2_robot_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc2_robotInstanceStruct
#define typedef_SFc2_robotInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_robot;
  real_T *c2_z;
  real_T *c2_y;
  real_T *c2_in_min;
  real_T *c2_in_max;
  real_T *c2_x_out;
} SFc2_robotInstanceStruct;

#endif                                 /*typedef_SFc2_robotInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c2_robot_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_robot_get_check_sum(mxArray *plhs[]);
extern void c2_robot_method_dispatcher(SimStruct *S, int_T method, void *data);

#endif
