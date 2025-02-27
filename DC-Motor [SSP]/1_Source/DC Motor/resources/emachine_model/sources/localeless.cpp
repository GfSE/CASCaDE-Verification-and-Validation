#include "localeless.h"
#include <math.h>
#if (_MSC_VER >= 1400 || defined(__gnu_linux__)) && !defined(NO_LOCALE) 
#include <locale.h>
#define HANDLE_SET_LOCALE(category, locale) setlocale(category, locale)
#else
/* To avoid compilation error on dSPACE DS1006 (gcc) and very slow locale handling on MinGW */
#define HANDLE_SET_LOCALE(category, locale)
#endif

#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>


#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
#ifdef __cplusplus
class MyCLocal {
	MyCLocal(MyCLocal const&);
	void operator=(MyCLocal const&);
public:
	_locale_t cloc;
	MyCLocal() { cloc = _create_locale(LC_ALL, "C"); }
	~MyCLocal() { _free_locale(cloc); }
};
static _locale_t *Clocale() {
	/* Avoiding memory leak at end */
	static MyCLocal myloc;
	return &myloc.cloc;
};
void freeClocale() {
	/*Emtpy in CPP only relevant for c code*/
};
#else /*  __cplusplus */
static _locale_t cloc = NULL;
static int firstTime = 1;
static _locale_t *Clocale() {
	/* The c-version has a memory leak; cannot avoid without using atexit and atexit for DLLs seems bad */
	if (firstTime) cloc = _create_locale(LC_ALL, "C");
	firstTime = 0;
	return &cloc;
}
void freeClocale() {
	_free_locale(cloc);
	cloc = NULL;
	firstTime = 1;
}
#endif  /* __cplusplus */

#else /* _MSC_VER >= 1400 */

#if defined(__gnu_linux__) && !defined(NO_LOCALE)

#define CLOC_BUF_SIZE 128
static char cloc_static[CLOC_BUF_SIZE];
static char* cloc_dynamic = NULL;
static char* cloc = NULL;
static int firstTime = 1;
static const char* Clocale() {
	if (firstTime) {
		char* originalLoc = setlocale(LC_ALL, NULL);
		if (originalLoc != NULL) {
			int clocsize = strlen(originalLoc) + 1;
			if (clocsize <= CLOC_BUF_SIZE) {
				strcpy(cloc_static, originalLoc);
				cloc = cloc_static;
				firstTime = 0;
			} else {
				cloc_dynamic = (char*)malloc(clocsize);
				if (cloc_dynamic != NULL) {
					strcpy(cloc_dynamic, originalLoc);
					cloc = cloc_dynamic;
					firstTime = 0;
				}
			}
		}
	}
	return cloc;
}

void freeClocale() {
	if (cloc_dynamic != NULL) {
		free(cloc_dynamic);
		cloc = cloc_dynamic = NULL;
	}
	firstTime = 1;
}

DYMOLA_STATIC const char* setAndSaveLocale() {
	const char* oldLoc = Clocale();
	setlocale(LC_ALL, "C");
	return oldLoc;
}

#define INT_CALL1(func, arg)                                         \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg);                                               \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);                                 \
  return val

#define DOUBLE_CALL1(func, arg1)                                     \
  const char* oldLoc = setAndSaveLocale();			                 \
  double val = func(arg1);                                           \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#define INT_CALL2(func, arg1, arg2)                                  \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg1, arg2);                                        \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#define INT_CALL3(func, arg1, arg2, arg3)                            \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg1, arg2, arg3);                                  \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#define INT_CALL4(func, arg1, arg2, arg3, arg4)                      \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg1, arg2, arg3, arg4);                            \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#define INT_CALL5(func, arg1, arg2, arg3, arg4, arg5)                \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg1, arg2, arg3, arg4, arg5);                      \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#define INT_CALL6(func, arg1, arg2, arg3, arg4, arg5, arg6)          \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg1, arg2, arg3, arg4, arg5, arg6);                \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#define INT_CALL7(func, arg1, arg2, arg3, arg4, arg5, arg6, arg7)    \
  const char* oldLoc = setAndSaveLocale();                           \
  int val = func(arg1, arg2, arg3, arg4, arg5, arg6, arg7);          \
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);			                     \
  return val

#else /* defined(__gnu_linux__) */

DYMOLA_STATIC char* setAndSaveLocale() {
	return "";
}

#define INT_CALL1(func, arg)                                         \
  return func(arg)

#define DOUBLE_CALL1(func, arg)                                      \
  return func(arg)

#define INT_CALL2(func, arg1, arg2)                                  \
  return func(arg1, arg2)

#define INT_CALL3(func, arg1, arg2, arg3)                            \
  return func(arg1, arg2, arg3)

#define INT_CALL4(func, arg1, arg2, arg3, arg4)                      \
  return func(arg1, arg2, arg3, arg4)

#define INT_CALL5(func, arg1, arg2, arg3, arg4, arg5)                \
  return func(arg1, arg2, arg3, arg4, arg5)

#define INT_CALL6(func, arg1, arg2, arg3, arg4, arg5, arg6)          \
  return func(arg1, arg2, arg3, arg4, arg5, arg6)

#define INT_CALL7(func, arg1, arg2, arg3, arg4, arg5, arg6, arg7)    \
  return func(arg1, arg2, arg3, arg4, arg5, arg6, arg7)

#endif /* defined(__gnu_linux__) */
#endif /* _MSC_VER >= 1400 */

double atofC(const char *str) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _atof_l(str, *Clocale());
#else
	DOUBLE_CALL1(atof, str);
#endif
}

int atoiC(const char *str) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _atoi_l(str, *Clocale());
#else
	INT_CALL1(atoi,str);
#endif
}

int atolC(const char *str) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _atol_l(str, *Clocale());
#else
	INT_CALL1(atol, str);
#endif
}

#if _MSC_VER
int _stricmpC(const char *string1,const char *string2) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _stricmp_l(string1, string2, *Clocale());
#else
	return _stricmp(string1, string2);
#endif
}
#endif /* _MSC_VER */

int isalnumC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _isalnum_l(c, *Clocale());
#else
	INT_CALL1(isalnum, c);
#endif
}

int isalphaC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _isalpha_l(c, *Clocale());
#else
	INT_CALL1(isalpha, c);
#endif
}

int isdigitC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _isdigit_l(c, *Clocale());
#else
	INT_CALL1(isdigit, c);
#endif
}

int isupperC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _isupper_l(c, *Clocale());
#else
	INT_CALL1(isupper, c);
#endif
}

int islowerC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _islower_l(c, *Clocale());
#else
	INT_CALL1(islower, c);
#endif
}

int isspaceC(int c) {
	if (c == ' ') return 1;
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _isspace_l(c, *Clocale());
#else
	INT_CALL1(isspace, c);
#endif
}

int toupperC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _toupper_l(c, *Clocale());
#else
 #if !defined(NO_FILE)
	INT_CALL1(toupper, c);
 #else
	return c;
 #endif
#endif
}

int tolowerC(int c) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _tolower_l(c, *Clocale());
#else
	INT_CALL1(tolower, c);
#endif
}

extern int fscanfC_Bracket_255s(FILE*f, char*s, char *s2) {
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	_fscanf_l(f, "%[^\\[]255s", *Clocale(), s);
	return _fscanf_l(f, "%1s", *Clocale(), s2);
 #else
	const char* oldLoc = setAndSaveLocale();
	int val = fscanf(f, "%[^\\[]255s", s);
	val = fscanf(f, "%1s", s2);
	HANDLE_SET_LOCALE(LC_ALL, oldLoc);
	return val;
 #endif
#else
	return 0;
#endif
}

extern int fscanfC255s(FILE*f, char*s) {
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _fscanf_l(f, "%255s", *Clocale(), s);
 #else
	INT_CALL3(fscanf, f, "%255s", s);
 #endif
#else
	return 0;
#endif
}

extern int fscanfClf(FILE*f, double*x) {
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _fscanf_l(f, " %lg", *Clocale(), x);
 #else
	INT_CALL3(fscanf, f, "%lg", x);
 #endif
#else
	return 0;
#endif
}
extern int fscanfClf3(FILE*f, double*x, double*y, double*z) {
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _fscanf_l(f, " %lg %lg %lg",  *Clocale(), x,y,z);
 #else
	INT_CALL5(fscanf, f, " %lg %lg %lg", x, y, z);
 #endif
#else
	return 0;
#endif	
}
extern int fscanfCg(FILE*f, float*x) {
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _fscanf_l(f,  " %g", *Clocale(), x);
 #else
	INT_CALL3(fscanf, f, " %g", x);
 #endif
#else
	return 0;
#endif
}
extern int sscanfCd(const char*line, int*x) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line, " %d", *Clocale(), x);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, " %d", x);
#else
	return 0;
#endif
#endif
}
extern int sscanfCd5(const char*line, int*a, int*b,int*c,int*d,int*e) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line, " %d %d %d %d %d", *Clocale(), a,b,c,d,e);
#else
#if !defined(NO_FILE)
	INT_CALL7(sscanf, line, " %d %d %d %d %d", a, b, c, d, e);
#else
	return 0;
#endif
#endif
}

extern int sscanfCd_minus3(const char*line, int*y,int*m,int*d) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line, "%d-%d-%d", *Clocale(), y, m, d);
#else
#if !defined(NO_FILE)
	INT_CALL5(sscanf, line, "%d-%d-%d", y, m, d);
#else
	return 0;
#endif
#endif
}
extern int sscanfCg(const char*line, float*x){
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  " %g", *Clocale(), x);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, " %g", x);
#else
	return 0;
#endif
#endif
}
extern int sscanfCx2_underscore(const char*line,unsigned int*a,unsigned int*b) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%x_%x", *Clocale(), a,b);
#else
#if !defined(NO_FILE)
	INT_CALL4(sscanf, line, "%x_%x", a, b);
#else
	return 0;
#endif
#endif
}
extern int sscanfClu(const char*line, unsigned int*a) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%u", *Clocale(), a);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, "%u", a);
#else
	return 0;
#endif
#endif
}



extern int sscanfCg_comma(const char*line, float*x){
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  " %g,", *Clocale(),x);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, " %g,", x);
#else
	return 0;
#endif
#endif
}

extern int sscanfClg(const char*line, double*x) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line, " %lg", *Clocale(), x);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, " %lg", x);
#else
	return 0;
#endif
#endif
}
extern int sscanfCcomp_s_par(const char*line, char*cond, char*vers) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  " %[<>=] %s)",*Clocale(), cond, vers);
#else
#if !defined(NO_FILE)
	INT_CALL4(sscanf, line, " %[<>=] %s)", cond, vers);
#else
	return 0;
#endif
#endif
}
extern int sscanfCu(const char*line, unsigned*x) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  " %u", *Clocale(),x);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, " %u", x);
#else
	return 0;
#endif
#endif
}
extern int sscanfCi_comma4(const char*line, int*a,int*b,int*c,int*d) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line, "%i,%i,%i,%i,", *Clocale(),  a,b,c,d);
#else
#if !defined(NO_FILE)
	INT_CALL6(sscanf, line, "%i,%i,%i,%i,", a, b, c, d);
#else
	return 0;
#endif
#endif
}
extern int sscanfCi(const char*line, int*a) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%i",*Clocale(),a);
#else
#if !defined(NO_FILE)
	INT_CALL3(sscanf, line, "%i",a);
#else
	return 0;
#endif
#endif
}
extern int sscanfClfc(const char*line, double*d, char*dummy) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%lg %c",*Clocale(), d, dummy);
#else
#if !defined(NO_FILE)
	INT_CALL4(sscanf, line, "%lg %c", d, dummy);
#else
	return 0;
#endif
#endif
}
extern int sscanfCtext_ssdd(const char*line, const char*fmt, char*a,char*b, int *c,int *d) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  fmt,*Clocale(), a,b,c,d);
#else
#if !defined(NO_FILE)
	INT_CALL6(sscanf, line, fmt, a, b, c, d);
#else
	return 0;
#endif
#endif
}
extern int sscanfCincludename(const char*line, char*s) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "#include \"%[^\"]\"",*Clocale(), s);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL3(sscanf, line, "#include \"%[^\"]\"", s);
#else
	return 0;
#endif
#endif
}

extern int sscanfCtext_d(const char*line, const char*txtWithPercentD, int*x) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  txtWithPercentD,*Clocale(), x);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL3(sscanf, line, txtWithPercentD, x);
#else
	return 0;
#endif
#endif
}
extern int sscanfCtext_d3(const char*line, const char*txtWithPercentD, int*r,int*g,int*b) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  txtWithPercentD,*Clocale(), r,g,b);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL5(sscanf, line, txtWithPercentD, r, g, b);
#else
	return 0;
#endif
#endif
}

extern int sscanfCtext_d4(const char*line, const char*txtWithPercentD, int*a,int*b,int*c,int*d) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  txtWithPercentD,*Clocale(), a,b,c,d);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL6(sscanf, line, txtWithPercentD, a, b, c, d);
#else
	return 0;
#endif
#endif
}
extern int sscanfCtext_d5(const char*line, const char*txtWithPercentD, int*a,int*b,int*c,int*d,int*e) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  txtWithPercentD,*Clocale(), a,b,c,d,e);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL7(sscanf, line, txtWithPercentD, a, b, c, d, e);
#else
	return 0;
#endif
#endif
}
extern int sscanfCi3_slash(const char*line,int*a,int*b,int*c) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%i/%i/%i",*Clocale(), a,b,c);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL5(sscanf, line, "%i/%i/%i", a, b, c);
#else
	return 0;
#endif
#endif
}
extern int sscanfCi2_slash(const char*line,int*a,int*b) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%i/%i",*Clocale(), a,b);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL4(sscanf, line, "%i/%i", a, b);
#else
	return 0;
#endif
#endif
}
extern int sscanfCi2_slashlash(const char*line,int*a,int*b) {
	#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%i//%i",*Clocale(), a,b);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL4(sscanf, line, "%i//%i", a, b);
#else
	return 0;
#endif
#endif
}
		
extern int sscanfC255s_n(const char*line, char*s,int*length) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%255s%n",*Clocale(), s, length);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL4(sscanf, line, "%255s%n", s, length);
#else
	return 0;
#endif
#endif
}
extern int sscanfC255s(const char*line, char*s) {
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	return _sscanf_l(line,  "%255s",*Clocale(), s);
#else
#if !defined(NO_FILE) && !defined(LABCAR)
	INT_CALL3(sscanf, line, "%255s", s);
#else
	return 0;
#endif
#endif
}
extern int sprintfC(char*s, const char*format, ...) {
	va_list extra;
	int res;
	va_start(extra, format);
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	res = _vsprintf_l(s, format, *Clocale(), extra);
#else
	const char* oldLoc = setAndSaveLocale();
	res = vsprintf(s, format, extra);
	HANDLE_SET_LOCALE(LC_ALL, oldLoc);
#endif
	va_end(extra);
	return res;
}

extern int fprintfC(FILE*f, const char*format, ...) {
	va_list extra;
	int res;
	va_start(extra, format);
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	res = _vfprintf_l(f, format, *Clocale(), extra);
 #else
	const char* oldLoc = setAndSaveLocale();
	res = vfprintf(f, format, extra);
	HANDLE_SET_LOCALE(LC_ALL, oldLoc);
 #endif
#else
	res = -1;
#endif
	va_end(extra);
	return res;
}

extern int vfprintfC(FILE*f, const char*format, va_list extra) {
	int res;
#if !defined(NO_FILE)
 #if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	res = _vfprintf_l(f, format, *Clocale(), extra);
 #else
	const char* oldLoc = setAndSaveLocale();
	res = vfprintf(f, format, extra);
	HANDLE_SET_LOCALE(LC_ALL, oldLoc);
 #endif
#else
	res = -1;
#endif
	return res;
}

extern int vsnprintfC(char*buf,size_t buf_len,const char*fmt,va_list arg) {
  int res;
  /* Use len-1 to ensure that string will be nul-terminated. */
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
  res=_vsnprintf_l(buf, buf_len-1, fmt, *Clocale(), arg);
#elif defined(_MSC_VER) && _MSC_VER >= 1200
  res=_vsnprintf(buf, buf_len-1, fmt, arg);
#else
  const char* oldLoc = setAndSaveLocale();
  res = vsnprintf(buf, buf_len-1, fmt, arg);
  HANDLE_SET_LOCALE(LC_ALL, oldLoc);
#endif
  buf[buf_len-1] = 0;
  return res;
}

extern int snprintfC(char* s, size_t buf_len, const char* format, ...) {
	va_list extra;
	int res;
	va_start(extra, format);
#if _MSC_VER >= 1400 && !defined(NO_LOCALE)
	res = _vsnprintf_l(s, buf_len - 1, format, *Clocale(), extra);
#else
	const char* oldLoc = setAndSaveLocale();
	res = vsnprintf(s, buf_len - 1, format, extra);
	HANDLE_SET_LOCALE(LC_ALL, oldLoc);
#endif
	va_end(extra);
	s[buf_len] = 0;
	return res;
}
