#ifndef _DS_SUNDIALS_EXTENSIONS_H
#define _DS_SUNDIALS_EXTENSIONS_H

#ifndef ONLY_INCLUDE_INLINE_INTEGRATION

#include <cvode/cvode.h>

typedef struct SparseFunctions {
	SUNMatrix (*sun_sparse_matrix)(sunindextype M, sunindextype N, sunindextype NNZ, int sparsetype, SUNContext sunctx);
	SUNLinearSolver (*sun_linsol_superlumt)(N_Vector y, SUNMatrix A, int num_threads, SUNContext sunctx);
	sunindextype* (*sun_sparse_matrix_index_pointers)(SUNMatrix A);
	sunindextype* (*sun_sparse_matrix_index_values)(SUNMatrix A);
	realtype* (*sun_sparse_matrix_data)(SUNMatrix A);
	void (*ds_superlumt_free_global_data)(SUNLinearSolver S);
	void (*ds_superlumt_reinit)(SUNLinearSolver S);
} SparseFunctions;

#ifdef __cplusplus
extern "C" {
#endif

SUNDIALS_EXPORT int DSCVodeStepRootInit(void *cvode_mem, CVStepRootFn g);

#if !defined(FMU_SOURCE_CODE_EXPORT) || defined(FMU_SOURCE_CODE_EXPORT_SPARSE)
SUNDIALS_EXPORT void DSSetSparseFunctions(struct SparseFunctions* functions);
#endif

#ifdef __cplusplus
}
#endif

#endif
#endif
