#ifndef ONLY_INCLUDE_INLINE_INTEGRATION

#include "ds_sundials_extensions/ds_sundials_extensions.h"
#include "cvode_impl.h"

/* Step Root functionality Added by 3ds.com */
SUNDIALS_EXPORT int DSCVodeStepRootInit(void *cvode_mem, CVStepRootFn g) 
{
  CVodeMem cv_mem;

  /* Check cvode_mem pointer */
  if (cvode_mem == NULL) {
    cvProcessError(NULL, CV_MEM_NULL, "CVODE", "CVodeRootInit", MSGCV_NO_MEM);
    return(CV_MEM_NULL);
  }
  cv_mem = (CVodeMem) cvode_mem;

  cv_mem->cv_stepgfun = g;
  return(CV_SUCCESS);
}

#endif
