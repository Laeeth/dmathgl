/**
	port of mathgl library to the D programming language

	status - C bindings are done, although functions requiring variadic arguments with no fixed arguments have not been wrapped (dmd complains)
	not tested at all beyond the first trivial example (which does compile and run)

	to do
	 - port tests to D.
	 - get these variadic functions working too.
	 -  port the C++ wrappers to D
*/
module kaleidic.api.mathgl.lowlevel;
import core.stdc.stdint;
import core.stdc.config;
import core.stdc.stdio;


///
alias double mreal;
///
alias double mdual;
///
alias double ddual;
//alias <unimplemented> mdual;
//alias <unimplemented> ddual;

///
extern __gshared ulong[16] mgl_mask_val;

///
enum _Anonymous_0
{
	mglCartesian = 0,
	mglPolar = 1,
	mglSpherical = 2,
	mglParabolic = 3,
	mglParaboloidal = 4,
	mglOblate = 5,
	mglProlate = 6,
	mglElliptic = 7,
	mglToroidal = 8,
	mglBispherical = 9,
	mglBipolar = 10,
	mglLogLog = 11,
	mglLogX = 12,
	mglLogY = 13
}

///
enum _Anonymous_1
{
	mglWarnNone = 0,
	mglWarnDim = 1,
	mglWarnLow = 2,
	mglWarnNeg = 3,
	mglWarnFile = 4,
	mglWarnMem = 5,
	mglWarnZero = 6,
	mglWarnLeg = 7,
	mglWarnSlc = 8,
	mglWarnCnt = 9,
	mglWarnOpen = 10,
	mglWarnLId = 11,
	mglWarnSize = 12,
	mglWarnFmt = 13,
	mglWarnTern = 14,
	mglWarnNull = 15,
	mglWarnSpc = 16,
	mglScrArg = 17,
	mglScrCmd = 18,
	mglScrLong = 19,
	mglScrStr = 20,
	mglWarnEnd = 21
}

extern (C)
{
	///
	double mgl_hypot (double x, double y);
	///
	size_t mgl_wcslen (const(dchar)* str);
	///
	void mgl_chrrgb (char id, float[3] rgb);
	///
	c_long mgl_have_color (const(char)* stl);
	///
	const(char*) mglchr (const(char)* str, char ch);
	///
	const(char*) mglchrs (const(char)* str, const(char)* chr);
	///
	void mgl_set_num_thr (int n);
	///
	void mgl_set_num_thr_ (int* n);
	///
	void mgl_test_txt (const(char)* str, ...);
	///
	void mgl_set_test_mode (int enable);
	///
	void mgl_strtrim (char* str);
	///
	void mgl_wcstrim (dchar* str);
	///
	void mgl_strlwr (char* str);
	///
	void mgl_wcslwr (dchar* str);
	///
	void mgl_wcstombs (char* dst, const(dchar)* src, int size);
	///
	void mgl_clear_fft ();
	///
	void mgl_set_global_warn (const(char)* text);
	///
	void mgl_set_global_warn_ (const(char)* text, int);
	///
	const(char)* mgl_get_global_warn ();
	///
	int mgl_get_global_warn_ (char* out_, int len);
	///
	alias HMGL=void*;
	///
	alias HMDT=void*;
	///
	alias HCDT=void*;
	///
	alias HMEX=void*;
	///
	alias HAEX=void*;
	///
	alias HMPR=void*;


	///
	int mgl_check_version (const(char)* ver);
	///
	int mgl_check_version_ (const(char)* ver, int);
	///
	void mgl_suppress_warn (int on);
	///
	void mgl_suppress_warn_ (int* on);
	///
	int mgl_get_warn (HMGL gr);
	///
	int mgl_get_warn_ (uintptr_t* gr);
	///
	void mgl_set_warn (HMGL gr, int code, const(char)* text);
	///
	void mgl_set_warn_ (uintptr_t* gr, int* code, const(char)* text, int);
	///
	const(char)* mgl_get_mess (HMGL gr);
	///
	int mgl_get_mess_ (uintptr_t* gr, char* out_, int len);
	///
	void mgl_set_plotid (HMGL gr, const(char)* id);
	///
	void mgl_set_plotid_ (uintptr_t* gr, const(char)* id, int);
	///
	const(char)* mgl_get_plotid (HMGL gr);
	///
	int mgl_get_plotid_ (uintptr_t* gr, char* out_, int len);
	///
	void mgl_ask_stop (HMGL gr, int stop);
	///
	void mgl_ask_stop_ (uintptr_t* gr, int* stop);
	///
	int mgl_need_stop (HMGL gr);
	///
	int mgl_need_stop_ (uintptr_t* gr);
	///
	void mgl_set_event_func (HMGL gr, void function (void*) func, void* par);
	///
	int mgl_get_quality (HMGL gr);
	///
	int mgl_get_quality_ (uintptr_t* gr);
	///
	void mgl_set_quality (HMGL gr, int qual);
	///
	void mgl_set_quality_ (uintptr_t* gr, int* qual);
	///
	void mgl_set_draw_reg (HMGL gr, c_long nx, c_long ny, c_long m);
	///
	void mgl_set_draw_reg_ (uintptr_t* gr, int* nx, int* ny, int* m);
	///
	int mgl_is_frames (HMGL gr);
	///
	int mgl_get_flag (HMGL gr, uint flag);
	///
	int mgl_get_flag_ (uintptr_t* gr, c_ulong* flag);
	///
	void mgl_set_flag (HMGL gr, int val, uint flag);
	///
	void mgl_set_flag_ (uintptr_t* gr, int* val, c_ulong* flag);
	///
	c_long mgl_use_graph (HMGL gr, int inc);
	///
	c_long mgl_use_graph_ (uintptr_t* gr, int* inc);
	///
	void mgl_set_rdc_acc (HMGL gr, int reduce);
	///
	void mgl_set_rdc_acc_ (uintptr_t* gr, int* reduce);
	///
	void mgl_start_group (HMGL gr, const(char)* name);
	///
	void mgl_start_group_ (uintptr_t* gr, const(char)* name, int);
	///
	void mgl_end_group (HMGL gr);
	///
	void mgl_end_group_ (uintptr_t* gr);
	///
	void mgl_highlight (HMGL gr, int id);
	///
	void mgl_highlight_ (uintptr_t* gr, int* id);
	///
	void mgl_set_palette (HMGL gr, const(char)* colors);
	///
	void mgl_set_palette_ (uintptr_t* gr, const(char)* colors, int);
	///
	void mgl_set_pal_color_ (uintptr_t* gr, int* n, mreal* r, mreal* g, mreal* b);
	///
	void mgl_set_pal_num_ (uintptr_t* gr, int* num);
	///
	void mgl_set_color (char id, double r, double g, double b);
	///
	void mgl_set_color_ (char* id, mreal* r, mreal* g, mreal* b, int);
	///
	void mgl_set_def_sch (HMGL gr, const(char)* sch);
	///
	void mgl_set_def_sch_ (uintptr_t* gr, const(char)* sch, int);
	///
	void mgl_set_mask (char id, const(char)* mask);
	///
	void mgl_set_mask_ (const(char)* id, const(char)* mask, int, int);
	///
	void mgl_set_mask_val (char id, ulong mask);
	///
	void mgl_set_mask_val_ (const(char)* id, ulong* mask, int);
	///
	void mgl_set_mask_angle (HMGL gr, int angle);
	///
	void mgl_set_mask_angle_ (uintptr_t* gr, int* angle);
	///
	void mgl_set_alpha_default (HMGL gr, double alpha);
	///
	void mgl_set_alpha_default_ (uintptr_t* gr, mreal* alpha);
	///
	void mgl_set_bar_width (HMGL gr, double width);
	///
	void mgl_set_bar_width_ (uintptr_t* gr, mreal* width);
    ///
	void	 mgl_set_meshnum (HMGL gr, int num);
    ///
	void	 mgl_set_meshnum_ (uintptr_t* gr, int* num);
    ///
	void	 mgl_set_facenum (HMGL gr, int num);
    ///
	void	 mgl_set_facenum_ (uintptr_t* gr, int* num);
    ///
	void	 mgl_clear_unused (HMGL gr);
    ///
	void	 mgl_clear_unused_ (uintptr_t* gr);
    ///
	void	 mgl_set_ambbr (HMGL gr, double i);
    ///
	void	 mgl_set_ambbr_ (uintptr_t* gr, mreal* i);
    ///
	void	 mgl_set_difbr (HMGL gr, double i);
    ///
	void	 mgl_set_difbr_ (uintptr_t* gr, mreal* i);
    ///
	void	 mgl_set_light_dif (HMGL gr, int enable);
    ///
	void	 mgl_set_light_dif_ (uintptr_t* gr, int* enable);
    ///
	void	 mgl_set_cut (HMGL gr, int cut);
    ///
	void	 mgl_set_cut_ (uintptr_t* gr, int* cut);
    ///
	void	 mgl_set_cut_box (HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2);
    ///
	void	 mgl_set_cut_box_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2);
    ///
	void	 mgl_set_cutoff (HMGL gr, const(char)* EqC);
    ///
	void	 mgl_set_cutoff_ (uintptr_t* gr, const(char)* EqC, int);
    ///
	void	 mgl_set_ranges (HMGL gr, double x1, double x2, double y1, double y2, double z1, double z2);
    ///
	void	 mgl_set_ranges_ (uintptr_t* gr, mreal* x1, mreal* x2, mreal* y1, mreal* y2, mreal* z1, mreal* z2);
    ///
	void	 mgl_set_range_val (HMGL gr, char dir, double v1, double v2);
    ///
	void	 mgl_set_range_val_ (uintptr_t* gr, const(char)* dir, mreal* v1, mreal* v2, int);
    ///
	void	 mgl_add_range_val (HMGL gr, char dir, double v1, double v2);
    ///
	void	 mgl_add_range_val_ (uintptr_t* gr, const(char)* dir, mreal* v1, mreal* v2, int);
    ///
	void	 mgl_set_range_dat (HMGL gr, char dir, HCDT a, int add);
    ///
	void	 mgl_set_range_dat_ (uintptr_t* gr, const(char)* dir, uintptr_t* a, int* add, int);
    ///
	void	 mgl_set_auto_ranges (HMGL gr, double x1, double x2, double y1, double y2, double z1, double z2, double c1, double c2);
    ///
	void	 mgl_set_auto_ranges_ (uintptr_t* gr, mreal* x1, mreal* x2, mreal* y1, mreal* y2, mreal* z1, mreal* z2, mreal* c1, mreal* c2);
    ///
	void	 mgl_zoom_axis (HMGL gr, double x1, double y1, double z1, double c1, double x2, double y2, double z2, double c2);
    ///
	void	 mgl_zoom_axis_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* c1, mreal* x2, mreal* y2, mreal* z2, mreal* c2);
    ///
	void	 mgl_set_origin (HMGL gr, double x0, double y0, double z0);
    ///
	void	 mgl_set_origin_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0);
    ///
	void	 mgl_set_func (HMGL gr, const(char)* EqX, const(char)* EqY, const(char)* EqZ, const(char)* EqA);
    ///
	void	 mgl_set_func_ (uintptr_t* gr, const(char)* EqX, const(char)* EqY, const(char)* EqZ, const(char)* EqA, int, int, int, int);
    ///
	void	 mgl_set_coor (HMGL gr, int how);
    ///
	void	 mgl_set_coor_ (uintptr_t* gr, int* how);
    ///
	void	 mgl_set_ternary (HMGL gr, int kind);
    ///
	void	 mgl_set_ternary_ (uintptr_t* gr, int* kind);
    ///
	void	 mgl_set_tick_rotate (HMGL gr, int enable);
    ///
	void	 mgl_set_tick_rotate_ (uintptr_t* gr, int* enable);
    ///
	void	 mgl_set_tick_skip (HMGL gr, int enable);
    ///
	void	 mgl_set_tick_skip_ (uintptr_t* gr, int* enable);
    ///
	void	 mgl_def_font (const(char)* name, const(char)* path);
    ///
	void	 mgl_def_font_ (const(char)* name, const(char)* path, int, int);
    ///
	void	 mgl_set_mark_size (HMGL gr, double size);
    ///
	void	 mgl_set_mark_size_ (uintptr_t* gr, mreal* size);
    ///
	void	 mgl_set_arrow_size (HMGL gr, double size);
    ///
	void	 mgl_set_arrow_size_ (uintptr_t* gr, mreal* size);
    ///
	void	 mgl_set_font_size (HMGL gr, double size);
    ///
	void	 mgl_set_font_size_ (uintptr_t* gr, mreal* size);
    ///
	void	 mgl_set_font_def (HMGL gr, const(char)* fnt);
    ///
	void	 mgl_set_font_def_ (uintptr_t* gr, const(char)* fnt, int);
    ///
	void	 mgl_set_rotated_text (HMGL gr, int enable);
    ///
	void	 mgl_set_rotated_text_ (uintptr_t* gr, int* enable);
    ///
	void	 mgl_load_font (HMGL gr, const(char)* name, const(char)* path);
    ///
	void	 mgl_load_font_ (uintptr_t* gr, char* name, char* path, int l, int n);
    ///
	void	 mgl_copy_font (HMGL gr, HMGL gr_from);
    ///
	void	 mgl_copy_font_ (uintptr_t* gr, uintptr_t* gr_from);
    ///
	void	 mgl_restore_font (HMGL gr);
    ///
	void	 mgl_restore_font_ (uintptr_t* gr);


	//alias void gsl_vector;
	//alias void gsl_matrix;

	///
	void mgl_srnd (c_long seed);
    ///
	void	 mgl_srnd_ (int* seed);
	///
	double mgl_rnd ();
	///
	double mgl_ipow (double x, int n);
	///
	double mgl_ipow_ (mreal* x, int* n);
	///
	double mgl_get_time (const(char)* time, const(char)* fmt);
	///
	double mgl_get_time_ (const(char)* time, const(char)* fmt, int, int);
	///
	HMDT mgl_create_data ();
	///
	uintptr_t mgl_create_data_ ();
	///
	HMDT mgl_create_data_size (c_long nx, c_long ny, c_long nz);
	///
	uintptr_t mgl_create_data_size_ (int* nx, int* ny, int* nz);
	///
	HMDT mgl_create_data_file (const(char)* fname);
	///
	uintptr_t mgl_create_data_file_ (const(char)* fname, int len);
    ///
	void	 mgl_delete_data (HMDT dat);
    ///
	void	 mgl_delete_data_ (uintptr_t* dat);
    ///
	void	 mgl_data_rearrange (HMDT dat, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_data_rearrange_ (uintptr_t* dat, int* mx, int* my, int* mz);
    ///
	void	 mgl_data_link (HMDT dat, mreal* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_data_link_ (uintptr_t* d, mreal* A, int* nx, int* ny, int* nz);
    ///
	void	 mgl_data_set_float (HMDT dat, const(float)* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_data_set_float_ (uintptr_t* dat, const(float)* A, int* NX, int* NY, int* NZ);
    ///
	void	 mgl_data_set_float1_ (uintptr_t* d, const(float)* A, int* N1);
    ///
	void	 mgl_data_set_double (HMDT dat, const(double)* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_data_set_double_ (uintptr_t* dat, const(double)* A, int* NX, int* NY, int* NZ);
    ///
	void	 mgl_data_set_double1_ (uintptr_t* d, const(double)* A, int* N1);
    ///
	void	 mgl_data_set_float2 (HMDT d, const(float*)* A, c_long N1, c_long N2);
    ///
	void	 mgl_data_set_float2_ (uintptr_t* d, const(float)* A, int* N1, int* N2);
    ///
	void	 mgl_data_set_double2 (HMDT d, const(double*)* A, c_long N1, c_long N2);
    ///
	void	 mgl_data_set_double2_ (uintptr_t* d, const(double)* A, int* N1, int* N2);
    ///
	void	 mgl_data_set_float3 (HMDT d, const(float**)* A, c_long N1, c_long N2, c_long N3);
    ///
	void	 mgl_data_set_float3_ (uintptr_t* d, const(float)* A, int* N1, int* N2, int* N3);
    ///
	void	 mgl_data_set_double3 (HMDT d, const(double**)* A, c_long N1, c_long N2, c_long N3);
    ///
	void	 mgl_data_set_double3_ (uintptr_t* d, const(double)* A, int* N1, int* N2, int* N3);
    ///
	void	 mgl_data_set (HMDT dat, HCDT a);
    ///
	void	 mgl_data_set_ (uintptr_t* dat, uintptr_t* a);
    ///
	void	 mgl_data_set_vector (HMDT dat, gsl_vector* v);
    ///
	void	 mgl_data_set_matrix (HMDT dat, gsl_matrix* m);
    ///
	void	 mgl_data_set_value (HMDT dat, mreal v, c_long i, c_long j, c_long k);
    ///
	void	 mgl_data_set_value_ (uintptr_t* d, mreal* v, int* i, int* j, int* k);
	///
	mreal mgl_data_get_value (HCDT dat, c_long i, c_long j, c_long k);
	///
	mreal mgl_data_get_value_ (uintptr_t* d, int* i, int* j, int* k);
    ///
	void	 mgl_data_set_values (HMDT dat, const(char)* val, c_long nx, c_long ny, c_long nz);
    ///
	void	 mgl_data_set_values_ (uintptr_t* d, const(char)* val, int* nx, int* ny, int* nz, int l);
    ///
	int mgl_data_read_hdf (HMDT d, const(char)* fname, const(char)* data);
    ///
	int mgl_data_read_hdf_ (uintptr_t* d, const(char)* fname, const(char)* data, int l, int n);
    ///
	int mgl_data_read (HMDT dat, const(char)* fname);
    ///
	int mgl_data_read_ (uintptr_t* d, const(char)* fname, int l);
    ///
	int mgl_data_read_mat (HMDT dat, const(char)* fname, c_long dim);
    ///
	int mgl_data_read_mat_ (uintptr_t* dat, const(char)* fname, int* dim, int);
    ///
	int mgl_data_read_dim (HMDT dat, const(char)* fname, c_long mx, c_long my, c_long mz);
    ///
	int mgl_data_read_dim_ (uintptr_t* dat, const(char)* fname, int* mx, int* my, int* mz, int);
    ///
	int mgl_data_read_range (HMDT d, const(char)* templ, double n1, double n2, double step, int as_slice);
    ///
	int mgl_data_read_range_ (uintptr_t* d, const(char)* fname, mreal* n1, mreal* n2, mreal* step, int* as_slice, int l);
    ///
	int mgl_data_read_all (HMDT dat, const(char)* templ, int as_slice);
    ///
	int mgl_data_read_all_ (uintptr_t* d, const(char)* fname, int* as_slice, int l);
    ///
	void	 mgl_data_import (HMDT dat, const(char)* fname, const(char)* scheme, mreal v1, mreal v2);
    ///
	void	 mgl_data_import_ (uintptr_t* dat, const(char)* fname, const(char)* scheme, mreal* v1, mreal* v2, int, int);
    ///
	void	 mgl_data_create (HMDT dat, c_long nx, c_long ny, c_long nz);
    ///
	void	 mgl_data_create_ (uintptr_t* dat, int* nx, int* ny, int* nz);
    ///
	void	 mgl_data_transpose (HMDT dat, const(char)* dim);
    ///
	void	 mgl_data_transpose_ (uintptr_t* dat, const(char)* dim, int);
    ///
	void	 mgl_data_norm (HMDT dat, mreal v1, mreal v2, c_long sym, c_long dim);
    ///
	void	 mgl_data_norm_ (uintptr_t* dat, mreal* v1, mreal* v2, int* sym, int* dim);
    ///
	void	 mgl_data_norm_slice (HMDT dat, mreal v1, mreal v2, char dir, c_long keep_en, c_long sym);
    ///
	void	 mgl_data_norm_slice_ (uintptr_t* dat, mreal* v1, mreal* v2, char* dir, int* keep_en, int* sym, int l);
    ///
	HMDT mgl_data_subdata (HCDT dat, c_long xx, c_long yy, c_long zz);
    ///
	uintptr_t mgl_data_subdata_ (uintptr_t* dat, int* xx, int* yy, int* zz);
    ///
	HMDT mgl_data_subdata_ext (HCDT dat, HCDT xx, HCDT yy, HCDT zz);
    ///
	uintptr_t mgl_data_subdata_ext_ (uintptr_t* dat, uintptr_t* xx, uintptr_t* yy, uintptr_t* zz);
    ///
	HMDT mgl_data_column (HCDT dat, const(char)* eq);
    ///
	uintptr_t mgl_data_column_ (uintptr_t* dat, const(char)* eq, int l);
    ///
	void	 mgl_data_set_id (HMDT d, const(char)* id);
    ///
	void	 mgl_data_set_id_ (uintptr_t* dat, const(char)* id, int l);
    ///
	void	 mgl_data_fill (HMDT dat, mreal x1, mreal x2, char dir);
    ///
	void	 mgl_data_fill_ (uintptr_t* dat, mreal* x1, mreal* x2, const(char)* dir, int);
    ///
	void	 mgl_data_fill_eq (HMGL gr, HMDT dat, const(char)* eq, HCDT vdat, HCDT wdat, const(char)* opt);
    ///
	void	 mgl_data_fill_eq_ (uintptr_t* gr, uintptr_t* dat, const(char)* eq, uintptr_t* vdat, uintptr_t* wdat, const(char)* opt, int, int);
    ///
	void	 mgl_data_refill_gs (HMDT dat, HCDT xdat, HCDT vdat, mreal x1, mreal x2, c_long sl);
    ///
	void	 mgl_data_refill_gs_ (uintptr_t* dat, uintptr_t* xdat, uintptr_t* vdat, mreal* x1, mreal* x2, c_long* sl);
    ///
	void	 mgl_data_refill_x (HMDT dat, HCDT xdat, HCDT vdat, mreal x1, mreal x2, c_long sl);
    ///
	void	 mgl_data_refill_x_ (uintptr_t* dat, uintptr_t* xdat, uintptr_t* vdat, mreal* x1, mreal* x2, c_long* sl);
    ///
	void	 mgl_data_refill_xy (HMDT dat, HCDT xdat, HCDT ydat, HCDT vdat, mreal x1, mreal x2, mreal y1, mreal y2, c_long sl);
    ///
	void	 mgl_data_refill_xy_ (uintptr_t* dat, uintptr_t* xdat, uintptr_t* ydat, uintptr_t* vdat, mreal* x1, mreal* x2, mreal* y1, mreal* y2, c_long* sl);
    ///
	void	 mgl_data_refill_xyz (HMDT dat, HCDT xdat, HCDT ydat, HCDT zdat, HCDT vdat, mreal x1, mreal x2, mreal y1, mreal y2, mreal z1, mreal z2);
    ///
	void	 mgl_data_refill_xyz_ (uintptr_t* dat, uintptr_t* xdat, uintptr_t* ydat, uintptr_t* zdat, uintptr_t* vdat, mreal* x1, mreal* x2, mreal* y1, mreal* y2, mreal* z1, mreal* z2);
    ///
	void	 mgl_data_refill_gr (HMGL gr, HMDT dat, HCDT xdat, HCDT ydat, HCDT zdat, HCDT vdat, c_long sl, const(char)* opt);
    ///
	void	 mgl_data_refill_gr_ (uintptr_t* gr, uintptr_t* dat, uintptr_t* xdat, uintptr_t* ydat, uintptr_t* zdat, uintptr_t* vdat, c_long* sl, const(char)* opt, int);
    ///
	void	 mgl_data_grid (HMGL gr, HMDT d, HCDT xdat, HCDT ydat, HCDT zdat, const(char)* opt);
    ///
	void	 mgl_data_grid_ (uintptr_t* gr, uintptr_t* dat, uintptr_t* xdat, uintptr_t* ydat, uintptr_t* zdat, const(char)* opt, int);
    ///
	void	 mgl_data_grid_xy (HMDT d, HCDT xdat, HCDT ydat, HCDT zdat, mreal x1, mreal x2, mreal y1, mreal y2);
    ///
	void	 mgl_data_grid_xy_ (uintptr_t* dat, uintptr_t* xdat, uintptr_t* ydat, uintptr_t* zdat, mreal* x1, mreal* x2, mreal* y1, mreal* y2);
    ///
	void	 mgl_data_put_val (HMDT dat, mreal val, c_long i, c_long j, c_long k);
    ///
	void	 mgl_data_put_val_ (uintptr_t* dat, mreal* val, int* i, int* j, int* k);
    ///
	void	 mgl_data_put_dat (HMDT dat, HCDT val, c_long i, c_long j, c_long k);
    ///
	void	 mgl_data_put_dat_ (uintptr_t* dat, uintptr_t* val, int* i, int* j, int* k);
    ///
	void	 mgl_data_modify (HMDT dat, const(char)* eq, c_long dim);
    ///
	void	 mgl_data_modify_ (uintptr_t* dat, const(char)* eq, int* dim, int);
    ///
	void	 mgl_data_modify_vw (HMDT dat, const(char)* eq, HCDT vdat, HCDT wdat);
    ///
	void	 mgl_data_modify_vw_ (uintptr_t* dat, const(char)* eq, uintptr_t* vdat, uintptr_t* wdat, int);
    ///
	void	 mgl_data_squeeze (HMDT dat, c_long rx, c_long ry, c_long rz, c_long smooth);
    ///
	void	 mgl_data_squeeze_ (uintptr_t* dat, int* rx, int* ry, int* rz, int* smooth);
    ///
	mreal* mgl_data_value (HMDT dat, c_long i, c_long j, c_long k);
    ///
	mreal* mgl_data_data (HMDT dat);
    ///
	c_long mgl_data_get_nx (HCDT d);
    ///
	c_long mgl_data_get_nx_ (uintptr_t* d);
    ///
	c_long mgl_data_get_ny (HCDT d);
    ///
	c_long mgl_data_get_ny_ (uintptr_t* d);
    ///
	c_long mgl_data_get_nz (HCDT d);
    ///
	c_long mgl_data_get_nz_ (uintptr_t* d);
    ///
	HMDT mgl_data_combine (HCDT dat1, HCDT dat2);
    ///
	uintptr_t mgl_data_combine_ (uintptr_t* dat1, uintptr_t* dat2);
    ///
	void	 mgl_data_extend (HMDT dat, c_long n1, c_long n2);
    ///
	void	 mgl_data_extend_ (uintptr_t* dat, int* n1, int* n2);
    ///
	void	 mgl_data_insert (HMDT dat, char dir, c_long at, c_long num);
    ///
	void	 mgl_data_insert_ (uintptr_t* dat, const(char)* dir, int* at, int* num, int);
    ///
	void	 mgl_data_delete (HMDT dat, char dir, c_long at, c_long num);
    ///
	void	 mgl_data_delete_ (uintptr_t* dat, const(char)* dir, int* at, int* num, int);
    ///
	void	 mgl_data_join (HMDT dat, HCDT d);
    ///
	void	 mgl_data_join_ (uintptr_t* dat, uintptr_t* d);
    ///
	void	 mgl_data_smooth (HMDT d, const(char)* dirs, mreal delta);
    ///
	void	 mgl_data_smooth_ (uintptr_t* dat, const(char)* dirs, mreal* delta, int);
    ///
	HMDT mgl_data_sum (HCDT dat, const(char)* dir);
    ///
	uintptr_t mgl_data_sum_ (uintptr_t* dat, const(char)* dir, int);
    ///
	HMDT mgl_data_max_dir (HCDT dat, const(char)* dir);
    ///
	uintptr_t mgl_data_max_dir_ (uintptr_t* dat, const(char)* dir, int);
    ///
	HMDT mgl_data_min_dir (HCDT dat, const(char)* dir);
    ///
	uintptr_t mgl_data_min_dir_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_cumsum (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_cumsum_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_integral (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_integral_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_diff (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_diff_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_diff_par (HMDT dat, HCDT v1, HCDT v2, HCDT v3);
    ///
	void	 mgl_data_diff_par_ (uintptr_t* dat, uintptr_t* v1, uintptr_t* v2, uintptr_t* v3);
    ///
	void	 mgl_data_diff2 (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_diff2_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_swap (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_swap_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_roll (HMDT dat, char dir, c_long num);
    ///
	void	 mgl_data_roll_ (uintptr_t* dat, const(char)* dir, int* num, int);
    ///
	void	 mgl_data_mirror (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_mirror_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_sort (HMDT dat, c_long idx, c_long idy);
    ///
	void	 mgl_data_sort_ (uintptr_t* dat, int* idx, int* idy);
    ///
	void	 mgl_data_hankel (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_hankel_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_sinfft (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_sinfft_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_cosfft (HMDT dat, const(char)* dir);
    ///
	void	 mgl_data_cosfft_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_fill_sample (HMDT dat, const(char)* how);
    ///
	void	 mgl_data_fill_sample_ (uintptr_t* dat, const(char)* how, int);
    ///
	HMDT mgl_data_correl (HCDT dat1, HCDT dat2, const(char)* dir);
    ///
	uintptr_t mgl_data_correl_ (uintptr_t* dat1, uintptr_t* dat2, const(char)* dir, int);
    ///
	void	* mgl_fft_alloc (c_long n, void** space, c_long nthr);
    ///
	void	* mgl_fft_alloc_thr (c_long n);
    ///
	void	 mgl_fft_free (void* wt, void** ws, c_long nthr);
    ///
	void	 mgl_fft_free_thr (void* wt);
    ///
	void	 mgl_fft (double* x, c_long s, c_long n, const(void)* wt, void* ws, int inv);
    ///
	void	 mgl_clear_fft ();
    ///
	mreal mgl_data_spline (HCDT dat, mreal x, mreal y, mreal z);
    ///
	mreal mgl_data_spline_ (uintptr_t* dat, mreal* x, mreal* y, mreal* z);
    ///
	mreal mgl_data_linear (HCDT dat, mreal x, mreal y, mreal z);
    ///
	mreal mgl_data_linear_ (uintptr_t* dat, mreal* x, mreal* y, mreal* z);
    ///
	mreal mgl_data_spline_ext (HCDT dat, mreal x, mreal y, mreal z, mreal* dx, mreal* dy, mreal* dz);
    ///
	mreal mgl_data_spline_ext_ (uintptr_t* dat, mreal* x, mreal* y, mreal* z, mreal* dx, mreal* dy, mreal* dz);
    ///
	HMDT mgl_gspline_init (HCDT x, HCDT v);
    ///
	uintptr_t mgl_gspline_init_ (uintptr_t* x, uintptr_t* v);
    ///
	mreal mgl_gspline (HCDT coef, mreal dx, mreal* d1, mreal* d2);
    ///
	mreal mgl_gspline_ (uintptr_t* c, mreal* dx, mreal* d1, mreal* d2);
    ///
	mreal mgl_data_linear_ext (HCDT dat, mreal x, mreal y, mreal z, mreal* dx, mreal* dy, mreal* dz);
    ///
	mreal mgl_data_linear_ext_ (uintptr_t* dat, mreal* x, mreal* y, mreal* z, mreal* dx, mreal* dy, mreal* dz);
    ///
	mreal mgl_data_solve_1d (HCDT dat, mreal val, int spl, c_long i0);
    ///
	mreal mgl_data_solve_1d_ (uintptr_t* dat, mreal* val, int* spl, int* i0);
    ///
	HMDT mgl_data_solve (HCDT dat, mreal val, char dir, HCDT i0, int norm);
    ///
	uintptr_t mgl_data_solve_ (uintptr_t* dat, mreal* val, const(char)* dir, uintptr_t* i0, int* norm, int);
    ///
	HMDT mgl_data_trace (HCDT d);
    ///
	uintptr_t mgl_data_trace_ (uintptr_t* d);
    ///
	HMDT mgl_data_resize (HCDT dat, c_long mx, c_long my, c_long mz);
    ///
	uintptr_t mgl_data_resize_ (uintptr_t* dat, int* mx, int* my, int* mz);
    ///
	HMDT mgl_data_resize_box (HCDT dat, c_long mx, c_long my, c_long mz, mreal x1, mreal x2, mreal y1, mreal y2, mreal z1, mreal z2);
    ///
	uintptr_t mgl_data_resize_box_ (uintptr_t* dat, int* mx, int* my, int* mz, mreal* x1, mreal* x2, mreal* y1, mreal* y2, mreal* z1, mreal* z2);
    ///
	HMDT mgl_data_hist (HCDT dat, c_long n, mreal v1, mreal v2, c_long nsub);
    ///
	uintptr_t mgl_data_hist_ (uintptr_t* dat, int* n, mreal* v1, mreal* v2, int* nsub);
    ///
	HMDT mgl_data_hist_w (HCDT dat, HCDT weight, c_long n, mreal v1, mreal v2, c_long nsub);
    ///
	uintptr_t mgl_data_hist_w_ (uintptr_t* dat, uintptr_t* weight, int* n, mreal* v1, mreal* v2, int* nsub);
    ///
	HMDT mgl_data_momentum (HCDT dat, char dir, const(char)* how);
    ///
	uintptr_t mgl_data_momentum_ (uintptr_t* dat, char* dir, const(char)* how, int, int);
    ///
	HMDT mgl_data_evaluate (HCDT dat, HCDT idat, HCDT jdat, HCDT kdat, int norm);
    ///
	uintptr_t mgl_data_evaluate_ (uintptr_t* dat, uintptr_t* idat, uintptr_t* jdat, uintptr_t* kdat, int* norm);
    ///
	void	 mgl_data_envelop (HMDT dat, char dir);
    ///
	void	 mgl_data_envelop_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_data_sew (HMDT dat, const(char)* dirs, mreal da);
    ///
	void	 mgl_data_sew_ (uintptr_t* dat, const(char)* dirs, mreal* da, int);
    ///
	void	 mgl_data_crop (HMDT dat, c_long n1, c_long n2, char dir);
    ///
	void	 mgl_data_crop_ (uintptr_t* dat, int* n1, int* n2, const(char)* dir, int);
    ///
	void	 mgl_data_clean (HMDT dat, c_long id);
    ///
	void	 mgl_data_clean_ (uintptr_t* dat, int* id);
    ///
	void	 mgl_data_mul_dat (HMDT dat, HCDT d);
    ///
	void	 mgl_data_mul_dat_ (uintptr_t* dat, uintptr_t* d);
    ///
	void	 mgl_data_div_dat (HMDT dat, HCDT d);
    ///
	void	 mgl_data_div_dat_ (uintptr_t* dat, uintptr_t* d);
    ///
	void	 mgl_data_add_dat (HMDT dat, HCDT d);
    ///
	void	 mgl_data_add_dat_ (uintptr_t* dat, uintptr_t* d);
    ///
	void	 mgl_data_sub_dat (HMDT dat, HCDT d);
    ///
	void	 mgl_data_sub_dat_ (uintptr_t* dat, uintptr_t* d);
    ///
	void	 mgl_data_mul_num (HMDT dat, mreal d);
    ///
	void	 mgl_data_mul_num_ (uintptr_t* dat, mreal* d);
    ///
	void	 mgl_data_div_num (HMDT dat, mreal d);
    ///
	void	 mgl_data_div_num_ (uintptr_t* dat, mreal* d);
    ///
	void	 mgl_data_add_num (HMDT dat, mreal d);
    ///
	void	 mgl_data_add_num_ (uintptr_t* dat, mreal* d);
    ///
	void	 mgl_data_sub_num (HMDT dat, mreal d);
    ///
	void	 mgl_data_sub_num_ (uintptr_t* dat, mreal* d);
    ///
	HMDT mgl_transform_a (HCDT am, HCDT ph, const(char)* tr);
    ///
	uintptr_t mgl_transform_a_ (uintptr_t* am, uintptr_t* ph, const(char)* tr, int);
    ///
	HMDT mgl_transform (HCDT re, HCDT im, const(char)* tr);
    ///
	uintptr_t mgl_transform_ (uintptr_t* re, uintptr_t* im, const(char)* tr, int);
    ///
	void	 mgl_data_fourier (HMDT re, HMDT im, const(char)* dir);
    ///
	void	 mgl_data_fourier_ (uintptr_t* re, uintptr_t* im, const(char)* dir, int l);
    ///
	HMDT mgl_data_stfa (HCDT re, HCDT im, c_long dn, char dir);
    ///
	uintptr_t mgl_data_stfa_ (uintptr_t* re, uintptr_t* im, int* dn, char* dir, int);
    ///
	HMDT mgl_triangulation_3d (HCDT x, HCDT y, HCDT z);
    ///
	uintptr_t mgl_triangulation_3d_ (uintptr_t* x, uintptr_t* y, uintptr_t* z);
    ///
	HMDT mgl_triangulation_2d (HCDT x, HCDT y);
    ///
	uintptr_t mgl_triangulation_2d_ (uintptr_t* x, uintptr_t* y);
    ///
	mreal mgl_find_root (mreal function (mreal, void*) func, mreal ini, void* par);
    ///
	mreal mgl_find_root_txt (const(char)* func, mreal ini, char var_id);
    ///
	mreal mgl_find_root_txt_ (const(char)* func, mreal* ini, const(char)* var_id, int, int);
    ///
	HMDT mgl_data_roots (const(char)* func, HCDT ini, char var_id);
    ///
	uintptr_t mgl_data_roots_ (const(char)* func, uintptr_t* ini, const(char)* var_id, int, int);
    ///
	HMEX mgl_create_expr (const(char)* expr);
    ///
	uintptr_t mgl_create_expr_ (const(char)* expr, int);
    ///
	void	 mgl_delete_expr (HMEX ex);
    ///
	void	 mgl_delete_expr_ (uintptr_t* ex);
    ///
	double mgl_expr_eval (HMEX ex, double x, double y, double z);
    ///
	double mgl_expr_eval_ (uintptr_t* ex, mreal* x, mreal* y, mreal* z);
    ///
	double mgl_expr_eval_v (HMEX ex, mreal* vars);
    ///
	double mgl_expr_diff (HMEX ex, char dir, double x, double y, double z);
    ///
	double mgl_expr_diff_ (uintptr_t* ex, const(char)* dir, mreal* x, mreal* y, mreal* z, int);
    ///
	double mgl_expr_diff_v (HMEX ex, char dir, mreal* vars);

    ///
	alias void* HADT;

    ///
	struct gsl_matrix {};
    ///
	struct gsl_vector {};

    ///
	void mgl_srnd (c_long seed);
    ///
	double mgl_rnd ();
    ///
	mdual mgl_ipowc (mdual x, int n);
    ///
	mdual mgl_ipowc_ (mdual* x, int* n);
    ///
	mdual mgl_expi (mdual a);
    ///
	HADT mgl_create_datac ();
    ///
	uintptr_t mgl_create_datac_ ();
    ///
	HADT mgl_create_datac_size (c_long nx, c_long ny, c_long nz);
    ///
	uintptr_t mgl_create_datac_size_ (int* nx, int* ny, int* nz);
    ///
	HADT mgl_create_datac_file (const(char)* fname);
    ///
	uintptr_t mgl_create_datac_file_ (const(char)* fname, int len);
    ///
	void	 mgl_delete_datac (HADT dat);
    ///
	void	 mgl_delete_datac_ (uintptr_t* dat);
    ///
	void	 mgl_datac_rearrange (HADT dat, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_datac_rearrange_ (uintptr_t* dat, int* mx, int* my, int* mz);
    ///
	void	 mgl_datac_link (HADT dat, mdual* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_datac_link_ (uintptr_t* d, mdual* A, int* nx, int* ny, int* nz);
    ///
	void	 mgl_datac_set_float (HADT dat, const(float)* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_datac_set_float_ (uintptr_t* dat, const(float)* A, int* NX, int* NY, int* NZ);
    ///
	void	 mgl_datac_set_double (HADT dat, const(double)* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_datac_set_double_ (uintptr_t* dat, const(double)* A, int* NX, int* NY, int* NZ);
    ///
	void	 mgl_datac_set_complex (HADT dat, const(mdual)* A, c_long mx, c_long my, c_long mz);
    ///
	void	 mgl_datac_set_complex_ (uintptr_t* d, const(mdual)* A, int* NX, int* NY, int* NZ);
    ///
	void	 mgl_datac_set (HADT dat, HCDT a);
    ///
	void	 mgl_datac_set_ (uintptr_t* dat, uintptr_t* a);
    ///
	void	 mgl_datac_set_vector (HADT dat, gsl_vector* v);
    ///
	void	 mgl_datac_set_matrix (HADT dat, gsl_matrix* m);
    ///
	void	 mgl_datac_set_value (HADT dat, mdual v, c_long i, c_long j, c_long k);
    ///
	void	 mgl_datac_set_value_ (uintptr_t* d, mdual* v, int* i, int* j, int* k);
    ///
	mdual mgl_datac_get_value (HCDT dat, c_long i, c_long j, c_long k);
    ///
	mdual mgl_datac_get_value_ (uintptr_t* d, int* i, int* j, int* k);
    ///
	void	 mgl_datac_set_values (HADT dat, const(char)* val, c_long nx, c_long ny, c_long nz);
    ///
	void	 mgl_datac_set_values_ (uintptr_t* d, const(char)* val, int* nx, int* ny, int* nz, int l);
    ///
	mdual* mgl_datac_data (HADT dat);
    ///
	mdual* mgl_datac_value (HADT dat, c_long i, c_long j, c_long k);
    ///
	void	 mgl_datac_set_ri (HADT dat, HCDT re, HCDT im);
    ///
	void	 mgl_datac_set_ri_ (uintptr_t* dat, uintptr_t* re, uintptr_t* im);
    ///
	void	 mgl_datac_set_ap (HADT dat, HCDT abs, HCDT phi);
    ///
	void	 mgl_datac_set_ap_ (uintptr_t* dat, uintptr_t* abs, uintptr_t* phi);
    ///
	int mgl_datac_read (HADT dat, const(char)* fname);
    ///
	int mgl_datac_read_ (uintptr_t* d, const(char)* fname, int l);
    ///
	int mgl_datac_read_mat (HADT dat, const(char)* fname, c_long dim);
    ///
	int mgl_datac_read_mat_ (uintptr_t* dat, const(char)* fname, int* dim, int);
    ///
	int mgl_datac_read_dim (HADT dat, const(char)* fname, c_long mx, c_long my, c_long mz);
    ///
	int mgl_datac_read_dim_ (uintptr_t* dat, const(char)* fname, int* mx, int* my, int* mz, int);
    ///
	int mgl_datac_read_range (HADT d, const(char)* templ, double from, double to, double step, int as_slice);
    ///
	int mgl_datac_read_range_ (uintptr_t* d, const(char)* fname, mreal* from, mreal* to, mreal* step, int* as_slice, int l);
    ///
	int mgl_datac_read_all (HADT dat, const(char)* templ, int as_slice);
    ///
	int mgl_datac_read_all_ (uintptr_t* d, const(char)* fname, int* as_slice, int l);
    ///
	void	 mgl_datac_save (HCDT dat, const(char)* fname, c_long ns);
    ///
	void	 mgl_datac_save_ (uintptr_t* dat, const(char)* fname, int* ns, int);
    ///
	int mgl_datac_read_hdf (HADT d, const(char)* fname, const(char)* data);
    ///
	int mgl_datac_read_hdf_ (uintptr_t* d, const(char)* fname, const(char)* data, int l, int n);
    ///
	void	 mgl_datac_save_hdf (HCDT d, const(char)* fname, const(char)* data, int rewrite);
    ///
	void	 mgl_datac_save_hdf_ (uintptr_t* d, const(char)* fname, const(char)* data, int* rewrite, int l, int n);
    ///
	void	 mgl_datac_create (HADT dat, c_long nx, c_long ny, c_long nz);
    ///
	void	 mgl_datac_create_ (uintptr_t* dat, int* nx, int* ny, int* nz);
    ///
	void	 mgl_datac_transpose (HADT dat, const(char)* dim);
    ///
	void	 mgl_datac_transpose_ (uintptr_t* dat, const(char)* dim, int);
    ///
	HADT mgl_datac_subdata (HCDT dat, c_long xx, c_long yy, c_long zz);
    ///
	uintptr_t mgl_datac_subdata_ (uintptr_t* dat, int* xx, int* yy, int* zz);
    ///
	HADT mgl_datac_subdata_ext (HCDT dat, HCDT xx, HCDT yy, HCDT zz);
    ///
	uintptr_t mgl_datac_subdata_ext_ (uintptr_t* dat, uintptr_t* xx, uintptr_t* yy, uintptr_t* zz);
    ///
	HADT mgl_datac_column (HCDT dat, const(char)* eq);
    ///
	uintptr_t mgl_datac_column_ (uintptr_t* dat, const(char)* eq, int l);
    ///
	HADT mgl_datac_trace (HCDT d);
    ///
	uintptr_t mgl_datac_trace_ (uintptr_t* d);
    ///
	HADT mgl_datac_resize (HCDT dat, c_long mx, c_long my, c_long mz);
    ///
	uintptr_t mgl_datac_resize_ (uintptr_t* dat, int* mx, int* my, int* mz);
    ///
	HADT mgl_datac_resize_box (HCDT dat, c_long mx, c_long my, c_long mz, mreal x1, mreal x2, mreal y1, mreal y2, mreal z1, mreal z2);
    ///
	uintptr_t mgl_datac_resize_box_ (uintptr_t* dat, int* mx, int* my, int* mz, mreal* x1, mreal* x2, mreal* y1, mreal* y2, mreal* z1, mreal* z2);
    ///
	HADT mgl_datac_momentum (HCDT dat, char dir, const(char)* how);
    ///
	uintptr_t mgl_datac_momentum_ (uintptr_t* dat, char* dir, const(char)* how, int, int);
    ///
	HADT mgl_datac_evaluate (HCDT dat, HCDT idat, HCDT jdat, HCDT kdat, int norm);
    ///
	uintptr_t mgl_datac_evaluate_ (uintptr_t* dat, uintptr_t* idat, uintptr_t* jdat, uintptr_t* kdat, int* norm);
    ///
	HADT mgl_datac_sum (HCDT dat, const(char)* dir);
    ///
	uintptr_t mgl_datac_sum_ (uintptr_t* dat, const(char)* dir, int);
    ///
	HADT mgl_datac_combine (HCDT dat1, HCDT dat2);
    ///
	uintptr_t mgl_datac_combine_ (uintptr_t* dat1, uintptr_t* dat2);
    ///
	void	 mgl_datac_set_id (HADT d, const(char)* id);
    ///
	void	 mgl_datac_set_id_ (uintptr_t* dat, const(char)* id, int l);
    ///
	void	 mgl_datac_fill (HADT dat, mdual x1, mdual x2, char dir);
    ///
	void	 mgl_datac_fill_ (uintptr_t* dat, mdual* x1, mdual* x2, const(char)* dir, int);
    ///
	void	 mgl_datac_fill_eq (HMGL gr, HADT dat, const(char)* eq, HCDT vdat, HCDT wdat, const(char)* opt);
    ///
	void	 mgl_datac_fill_eq_ (uintptr_t* gr, uintptr_t* dat, const(char)* eq, uintptr_t* vdat, uintptr_t* wdat, const(char)* opt, int, int);
    ///
	void	 mgl_datac_modify (HADT dat, const(char)* eq, c_long dim);
    ///
	void	 mgl_datac_modify_ (uintptr_t* dat, const(char)* eq, int* dim, int);
    ///
	void	 mgl_datac_modify_vw (HADT dat, const(char)* eq, HCDT vdat, HCDT wdat);
    ///
	void	 mgl_datac_modify_vw_ (uintptr_t* dat, const(char)* eq, uintptr_t* vdat, uintptr_t* wdat, int);
    ///
	void	 mgl_datac_put_val (HADT dat, mdual val, c_long i, c_long j, c_long k);
    ///
	void	 mgl_datac_put_val_ (uintptr_t* dat, mdual* val, int* i, int* j, int* k);
    ///
	void	 mgl_datac_put_dat (HADT dat, HCDT val, c_long i, c_long j, c_long k);
    ///
	void	 mgl_datac_put_dat_ (uintptr_t* dat, uintptr_t* val, int* i, int* j, int* k);
    ///
	void	 mgl_datac_squeeze (HADT dat, c_long rx, c_long ry, c_long rz, c_long smooth);
    ///
	void	 mgl_datac_squeeze_ (uintptr_t* dat, int* rx, int* ry, int* rz, int* smooth);
    ///
	void	 mgl_datac_extend (HADT dat, c_long n1, c_long n2);
    ///
	void	 mgl_datac_extend_ (uintptr_t* dat, int* n1, int* n2);
    ///
	void	 mgl_datac_insert (HADT dat, char dir, c_long at, c_long num);
    ///
	void	 mgl_datac_insert_ (uintptr_t* dat, const(char)* dir, int* at, int* num, int);
    ///
	void	 mgl_datac_delete (HADT dat, char dir, c_long at, c_long num);
    ///
	void	 mgl_datac_delete_ (uintptr_t* dat, const(char)* dir, int* at, int* num, int);
    ///
	void	 mgl_datac_join (HADT dat, HCDT d);
    ///
	void	 mgl_datac_join_ (uintptr_t* dat, uintptr_t* d);
    ///
	void	 mgl_datac_smooth (HADT d, const(char)* dirs, mreal delta);
    ///
	void	 mgl_datac_smooth_ (uintptr_t* dat, const(char)* dirs, mreal* delta, int);
    ///
	void	 mgl_datac_cumsum (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_cumsum_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_integral (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_integral_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_diff (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_diff_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_diff2 (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_diff2_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_swap (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_swap_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_roll (HADT dat, char dir, c_long num);
    ///
	void	 mgl_datac_roll_ (uintptr_t* dat, const(char)* dir, int* num, int);
    ///
	void	 mgl_datac_mirror (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_mirror_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_crop (HADT dat, c_long n1, c_long n2, char dir);
    ///
	void	 mgl_datac_crop_ (uintptr_t* dat, int* n1, int* n2, const(char)* dir, int);
    ///
	void	 mgl_datac_hankel (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_hankel_ (uintptr_t* dat, const(char)* dir, int);
    ///
	void	 mgl_datac_fft (HADT dat, const(char)* dir);
    ///
	void	 mgl_datac_fft_ (uintptr_t* dat, const(char)* dir, int);
    ///
	HADT mgl_datac_correl (HCDT dat1, HCDT dat2, const(char)* dir);
    ///
	uintptr_t mgl_datac_correl_ (uintptr_t* dat1, uintptr_t* dat2, const(char)* dir, int);
    ///
	void	 mgl_datac_diffr (HADT dat, const(char)* how, mreal q);
    ///
	void	 mgl_datac_diffr_ (uintptr_t* d, const(char)* how, double q, int l);
    ///
	HMDT mgl_datac_real (HCDT dat);
    ///
	uintptr_t mgl_datac_real_ (uintptr_t* dat);
    ///
	HMDT mgl_datac_imag (HCDT dat);
    ///
	uintptr_t mgl_datac_imag_ (uintptr_t* dat);
    ///
	HMDT mgl_datac_abs (HCDT dat);
    ///
	uintptr_t mgl_datac_abs_ (uintptr_t* dat);
    ///
	HMDT mgl_datac_arg (HCDT dat);
    ///
	uintptr_t mgl_datac_arg_ (uintptr_t* dat);
    ///
	mdual mgl_datac_linear (HCDT d, mreal x, mreal y, mreal z);
    ///
	mdual mgl_datac_linear_ (uintptr_t* d, mreal* x, mreal* y, mreal* z);
    ///
	mdual mgl_datac_linear_ext (HCDT d, mreal x, mreal y, mreal z, mdual* dx, mdual* dy, mdual* dz);
    ///
	mdual mgl_datac_linear_ext_ (uintptr_t* d, mreal* x, mreal* y, mreal* z, mdual* dx, mdual* dy, mdual* dz);
    ///
	mdual mgl_datac_spline (HCDT dat, mreal x, mreal y, mreal z);
    ///
	mdual mgl_datac_spline_ (uintptr_t* dat, mreal* x, mreal* y, mreal* z);
    ///
	mdual mgl_datac_spline_ext (HCDT dat, mreal x, mreal y, mreal z, mdual* dx, mdual* dy, mdual* dz);
    ///
	mdual mgl_datac_spline_ext_ (uintptr_t* dat, mreal* x, mreal* y, mreal* z, mdual* dx, mdual* dy, mdual* dz);
    ///
	HADT mgl_gsplinec_init (HCDT x, HCDT v);
    ///
	uintptr_t mgl_gspline_init_ (uintptr_t* x, uintptr_t* v);
    ///
	mdual mgl_gsplinec (HCDT coef, mreal dx, mdual* d1, mdual* d2);
    ///
	mdual mgl_gsplinec_ (uintptr_t* c, mreal* dx, mdual* d1, mdual* d2);
    ///
	HAEX mgl_create_cexpr (const(char)* expr);
    ///
	uintptr_t mgl_create_cexpr_ (const(char)* expr, int);
    ///
	void	 mgl_delete_cexpr (HAEX ex);
    ///
	void	 mgl_delete_cexpr_ (uintptr_t* ex);
    ///
	mdual mgl_cexpr_eval (HAEX ex, mdual x, mdual y, mdual z);
    ///
	mdual mgl_cexpr_eval_ (uintptr_t* ex, mdual* x, mdual* y, mdual* z);
    ///
	mdual mgl_cexpr_eval_v (HAEX ex, mdual* vars);
    ///
	void mgl_text_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* text, const(char)* font, const(char)* opt);
    ///
	void	 mgl_text_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* text, const(char)* font, const(char)* opt, int, int l, int n);
    ///
	void	 mgl_textw_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, const(dchar)* text, const(char)* font, const(char)* opt);
    ///
	void	 mgl_text_xy (HMGL gr, HCDT x, HCDT y, const(char)* text, const(char)* font, const(char)* opt);
    ///
	void	 mgl_text_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, const(char)* text, const(char)* font, const(char)* opt, int, int l, int n);
    ///
	void	 mgl_textw_xy (HMGL gr, HCDT x, HCDT y, const(dchar)* text, const(char)* font, const(char)* opt);
    ///
	void	 mgl_text_y (HMGL gr, HCDT y, const(char)* text, const(char)* font, const(char)* opt);
    ///
	void	 mgl_text_y_ (uintptr_t* gr, uintptr_t* y, const(char)* text, const(char)* font, const(char)* opt, int, int l, int n);
    ///
	void	 mgl_textw_y (HMGL gr, HCDT y, const(dchar)* text, const(char)* font, const(char)* opt);
    ///
	void	 mgl_cont_gen (HMGL gr, double val, HCDT a, HCDT x, HCDT y, HCDT z, const(char)* stl);
    ///
	void	 mgl_contf_gen (HMGL gr, double v1, double v2, HCDT a, HCDT x, HCDT y, HCDT z, const(char)* stl);
    ///
	void	 mgl_cont_xy_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_cont_xy_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_cont_val (HMGL gr, HCDT v, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_cont_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_cont_xy (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_cont_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_cont (HMGL gr, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_cont_ (uintptr_t* gr, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contf_xy_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contf_xy_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contf_val (HMGL gr, HCDT v, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contf_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contf_xy (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contf_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contf (HMGL gr, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contf_ (uintptr_t* gr, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contd_xy_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contd_xy_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contd_val (HMGL gr, HCDT v, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contd_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contd_xy (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contd_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contd (HMGL gr, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contd_ (uintptr_t* gr, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contv_xy_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contv_xy_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contv_val (HMGL gr, HCDT v, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contv_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contv_xy (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contv_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_contv (HMGL gr, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_contv_ (uintptr_t* gr, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_axial_xy_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT a, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_axial_xy_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_axial_val (HMGL gr, HCDT v, HCDT a, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_axial_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_axial_xy (HMGL gr, HCDT x, HCDT y, HCDT a, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_axial_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_axial (HMGL gr, HCDT a, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_axial_ (uintptr_t* gr, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_torus (HMGL gr, HCDT r, HCDT z, const(char)* col, const(char)* opt);
    ///
	void	 mgl_torus_ (uintptr_t* gr, uintptr_t* r, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_grid3_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_grid3_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_grid3 (HMGL gr, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_grid3_ (uintptr_t* gr, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_dens3_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_dens3_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_dens3 (HMGL gr, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_dens3_ (uintptr_t* gr, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont3_xyz_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_cont3_xyz_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont3_val (HMGL gr, HCDT v, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_cont3_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont3_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_cont3_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont3 (HMGL gr, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_cont3_ (uintptr_t* gr, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf3_xyz_val (HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_contf3_xyz_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf3_val (HMGL gr, HCDT v, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_contf3_val_ (uintptr_t* gr, uintptr_t* v, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf3_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_contf3_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf3 (HMGL gr, HCDT a, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_contf3_ (uintptr_t* gr, uintptr_t* a, const(char)* sch, mreal* sVal, const(char)* opt, int, int);

    ///
	extern __gshared int mglFitPnts;
    ///
	extern __gshared char[1024] mglFitRes;
    ///
	HMDT mgl_fit_1 (HMGL gr, HCDT y, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_2 (HMGL gr, HCDT z, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_3 (HMGL gr, HCDT a, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_xy (HMGL gr, HCDT x, HCDT y, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_xyza (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_ys (HMGL gr, HCDT y, HCDT s, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_xys (HMGL gr, HCDT x, HCDT y, HCDT s, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_xyzs (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT s, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	HMDT mgl_fit_xyzas (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, HCDT s, const(char)* eq, const(char)* vars, HMDT ini, const(char)* opt);
    ///
	const(char)* mgl_get_fit (HMGL gr);
    ///
	int mgl_get_fit_ (uintptr_t* gr, char* out_, int len);
    ///
	HMDT mgl_hist_x (HMGL gr, HCDT x, HCDT a, const(char)* opt);
    ///
	HMDT mgl_hist_xy (HMGL gr, HCDT x, HCDT y, HCDT a, const(char)* opt);
    ///
	HMDT mgl_hist_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* opt);
    ///
	void	 mgl_puts_fit (HMGL gr, double x, double y, double z, const(char)* prefix, const(char)* font, double size);
    ///
	mreal mgl_get_fit_chi ();
    ///
	uintptr_t mgl_fit_1_ (uintptr_t* gr, uintptr_t* y, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_2_ (uintptr_t* gr, uintptr_t* z, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_3_ (uintptr_t* gr, uintptr_t* a, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_xyza_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_ys_ (uintptr_t* gr, uintptr_t* y, uintptr_t* ss, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_xys_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ss, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_xyzs_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ss, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_fit_xyzas_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, uintptr_t* ss, const(char)* eq, const(char)* vars, uintptr_t* ini, const(char)* opt, int, int l, int n);
    ///
	uintptr_t mgl_hist_x_ (uintptr_t* gr, uintptr_t* x, uintptr_t* a, const(char)* opt, int);
    ///
	uintptr_t mgl_hist_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* a, const(char)* opt, int);
    ///
	uintptr_t mgl_hist_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* opt, int);
    ///
	void	 mgl_puts_fit_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z, const(char)* prefix, const(char)* font, mreal* size, int l, int n);
    ///
	mreal mgl_get_fit_chi_ ();

	void mgl_fplot (HMGL gr, const(char)* eqY, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_fplot_ (uintptr_t* gr, const(char)* fy, const(char)* stl, const(char)* opt, int ly, int ls, int lo);
    ///
	void	 mgl_fplot_xyz (HMGL gr, const(char)* eqX, const(char)* eqY, const(char)* eqZ, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_fplot_xyz_ (uintptr_t* gr, const(char)* fx, const(char)* fy, const(char)* fz, const(char)* stl, const(char)* opt, int lx, int ly, int lz, int ls, int lo);
    ///
	void	 mgl_radar (HMGL graph, HCDT a, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_radar_ (uintptr_t* gr, uintptr_t* a, const(char)* pen, const(char)* opt, int l, int lo);
    ///
	void	 mgl_plot_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_plot_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_plot_xy (HMGL graph, HCDT x, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_plot_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_plot (HMGL graph, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_plot_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tens_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tens_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tens_xy (HMGL graph, HCDT x, HCDT y, HCDT c, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tens_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* c, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tens (HMGL graph, HCDT y, HCDT c, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tens_ (uintptr_t* graph, uintptr_t* y, uintptr_t* c, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tape_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tape_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tape_xy (HMGL graph, HCDT x, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tape_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tape (HMGL graph, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tape_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_boxplot_xy (HMGL graph, HCDT x, HCDT a, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_boxplot_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_boxplot (HMGL graph, HCDT a, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_boxplot_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_area_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_area_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_area_xy (HMGL graph, HCDT x, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_area_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_area (HMGL graph, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_area_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_region_3d (HMGL graph, HCDT x1, HCDT y1, HCDT z1, HCDT x2, HCDT y2, HCDT z2, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_region_3d_ (uintptr_t* graph, uintptr_t* x1, uintptr_t* y1, uintptr_t* z1, uintptr_t* x2, uintptr_t* y2, uintptr_t* z2, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_region_xy (HMGL graph, HCDT x, HCDT y1, HCDT y2, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_region_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y1, uintptr_t* y2, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_region (HMGL graph, HCDT y1, HCDT y2, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_region_ (uintptr_t* graph, uintptr_t* y1, uintptr_t* y2, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_stem_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_stem_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_stem_xy (HMGL graph, HCDT x, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_stem_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_stem (HMGL graph, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_stem_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_step_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_step_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_step_xy (HMGL graph, HCDT x, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_step_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_step (HMGL graph, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_step_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_bars_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_bars_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_bars_xy (HMGL graph, HCDT x, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_bars_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_bars (HMGL graph, HCDT y, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_bars_ (uintptr_t* graph, uintptr_t* y, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_barh_yx (HMGL graph, HCDT y, HCDT v, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_barh_yx_ (uintptr_t* graph, uintptr_t* y, uintptr_t* v, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_barh (HMGL graph, HCDT v, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_barh_ (uintptr_t* graph, uintptr_t* v, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_ohlc_x (HMGL graph, HCDT x, HCDT open, HCDT high, HCDT low, HCDT close, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_ohlc_x_ (uintptr_t* graph, uintptr_t* x, uintptr_t* open, uintptr_t* high, uintptr_t* low, uintptr_t* close, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_ohlc (HMGL graph, HCDT open, HCDT high, HCDT low, HCDT close, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_ohlc_ (uintptr_t* graph, uintptr_t* open, uintptr_t* high, uintptr_t* low, uintptr_t* close, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_chart (HMGL graph, HCDT a, const(char)* col, const(char)* opt);
    ///
	void	 mgl_chart_ (uintptr_t* graph, uintptr_t* a, const(char)* col, const(char)* opt, int, int);
    ///
	void	 mgl_error_exy (HMGL graph, HCDT x, HCDT y, HCDT ex, HCDT ey, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_error_exy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* ex, uintptr_t* ey, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_error_xy (HMGL graph, HCDT x, HCDT y, HCDT ey, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_error_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* ey, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_error (HMGL graph, HCDT y, HCDT ey, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_error_ (uintptr_t* graph, uintptr_t* y, uintptr_t* ey, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_mark_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_mark_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_mark_xy (HMGL graph, HCDT x, HCDT y, HCDT r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_mark_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_mark_y (HMGL graph, HCDT y, HCDT r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_mark_y_ (uintptr_t* graph, uintptr_t* y, uintptr_t* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tube_xyzr (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tube_xyzr_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tube_xyr (HMGL graph, HCDT x, HCDT y, HCDT r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tube_xyr_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tube_r (HMGL graph, HCDT y, HCDT r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tube_r_ (uintptr_t* graph, uintptr_t* y, uintptr_t* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tube_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, double r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tube_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, mreal* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tube_xy (HMGL graph, HCDT x, HCDT y, double r, const(char)* penl, const(char)* opt);
    ///
	void	 mgl_tube_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, mreal* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_tube (HMGL graph, HCDT y, double r, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_tube_ (uintptr_t* graph, uintptr_t* y, mreal* r, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_candle_xyv (HMGL gr, HCDT x, HCDT v1, HCDT v2, HCDT y1, HCDT y2, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_candle_xyv_ (uintptr_t* gr, uintptr_t* x, uintptr_t* v1, uintptr_t* v2, uintptr_t* y1, uintptr_t* y2, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_candle_yv (HMGL gr, HCDT v1, HCDT v2, HCDT y1, HCDT y2, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_candle_yv_ (uintptr_t* gr, uintptr_t* v1, uintptr_t* v2, uintptr_t* y1, uintptr_t* y2, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_candle (HMGL gr, HCDT v, HCDT y1, HCDT y2, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_candle_ (uintptr_t* gr, uintptr_t* y, uintptr_t* y1, uintptr_t* y2, const(char)* pen, const(char)* opt, int, int);

	void mgl_fsurf (HMGL graph, const(char)* fz, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_fsurf_ (uintptr_t* graph, const(char)* fz, const(char)* stl, const(char)* opt, int, int, int);
    ///
	void	 mgl_fsurf_xyz (HMGL graph, const(char)* fx, const(char)* fy, const(char)* fz, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_fsurf_xyz_ (uintptr_t* graph, const(char)* fx, const(char)* fy, const(char)* fz, const(char)* stl, const(char)* opt, int, int, int, int, int);
    ///
	void	 mgl_grid_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_grid_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_grid (HMGL graph, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_grid_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_mesh_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_mesh_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_mesh (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_mesh_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_fall_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_fall_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_fall (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_fall_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_belt_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_belt_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_belt (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_belt_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_surf_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_surf_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_surf (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_surf_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dens_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_dens_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dens (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_dens_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_boxs_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_boxs_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_boxs (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_boxs_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tile_xy (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tile_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tile (HMGL graph, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tile_ (uintptr_t* graph, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tiles_xy (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tiles_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tiles (HMGL graph, HCDT z, HCDT r, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tiles_ (uintptr_t* graph, uintptr_t* z, uintptr_t* r, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_surfc_xy (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_surfc_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_surfc (HMGL graph, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_surfc_ (uintptr_t* graph, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_surfa_xy (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_surfa_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_surfa (HMGL graph, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_surfa_ (uintptr_t* graph, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_stfa_xy (HMGL graph, HCDT x, HCDT y, HCDT re, HCDT im, int dn, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_stfa_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* re, uintptr_t* im, int* dn, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_stfa (HMGL graph, HCDT re, HCDT im, int dn, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_stfa_ (uintptr_t* graph, uintptr_t* re, uintptr_t* im, int* dn, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_map_xy (HMGL graph, HCDT x, HCDT y, HCDT a, HCDT b, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_map_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* a, uintptr_t* b, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_map (HMGL graph, HCDT a, HCDT b, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_map_ (uintptr_t* graph, uintptr_t* a, uintptr_t* b, const(char)* sch, const(char)* opt, int, int);

	void mgl_surf3_xyz_val (HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3_xyz_val_ (uintptr_t* graph, mreal* Val, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3_val (HMGL graph, double Val, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3_val_ (uintptr_t* graph, mreal* Val, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3 (HMGL graph, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3a_xyz_val (HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3a_xyz_val_ (uintptr_t* graph, mreal* Val, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3a_val (HMGL graph, double Val, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3a_val_ (uintptr_t* graph, mreal* Val, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3a_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3a_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3a (HMGL graph, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3a_ (uintptr_t* graph, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3c_xyz_val (HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3c_xyz_val_ (uintptr_t* graph, mreal* Val, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3c_val (HMGL graph, double Val, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3c_val_ (uintptr_t* graph, mreal* Val, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3c_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3c_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_surf3c (HMGL graph, HCDT a, HCDT b, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_surf3c_ (uintptr_t* graph, uintptr_t* a, uintptr_t* b, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_cloud_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_cloud_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_cloud (HMGL graph, HCDT a, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_cloud_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, const(char)* opt, int, int);
    ///
	void	 mgl_beam_val (HMGL graph, double Val, HCDT tr, HCDT g1, HCDT g2, HCDT a, double r, const(char)* stl, int norm);
    ///
	void	 mgl_beam_val_ (uintptr_t* gr, mreal* val, uintptr_t* tr, uintptr_t* g1, uintptr_t* g2, uintptr_t* a, mreal* r, const(char)* sch, int* norm, int l);
    ///
	void	 mgl_beam (HMGL graph, HCDT tr, HCDT g1, HCDT g2, HCDT a, double r, const(char)* stl, int norm, int num);
    ///
	void	 mgl_beam_ (uintptr_t* gr, uintptr_t* tr, uintptr_t* g1, uintptr_t* g2, uintptr_t* a, mreal* r, const(char)* sch, int* norm, int* num, int l);

	void mgl_traj_xy (HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_traj_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_traj_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_traj_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_vect_xy (HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_vect_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_vect_2d (HMGL gr, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_vect_2d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_vect_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_vect_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_vect_3d (HMGL gr, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_vect_3d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flow_xy (HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flow_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flow_2d (HMGL gr, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flow_2d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flow_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flow_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flow_3d (HMGL gr, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flow_3d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flowp_xy (HMGL gr, double x0, double y0, double z0, HCDT x, HCDT y, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flowp_xy_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, uintptr_t* x, uintptr_t* y, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flowp_2d (HMGL gr, double x0, double y0, double z0, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flowp_2d_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flowp_xyz (HMGL gr, double x0, double y0, double z0, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flowp_xyz_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_flowp_3d (HMGL gr, double x0, double y0, double z0, HCDT ax, HCDT ay, HCDT az, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_flowp_3d_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_pipe_xy (HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const(char)* sch, double r0, const(char)* opt);
    ///
	void	 mgl_pipe_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ax, uintptr_t* ay, const(char)* sch, mreal* r0, const(char)* opt, int, int);
    ///
	void	 mgl_pipe_2d (HMGL gr, HCDT ax, HCDT ay, const(char)* sch, double r0, const(char)* opt);
    ///
	void	 mgl_pipe_2d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, const(char)* sch, mreal* r0, const(char)* opt, int, int);
    ///
	void	 mgl_pipe_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const(char)* sch, double r0, const(char)* opt);
    ///
	void	 mgl_pipe_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, mreal* r0, const(char)* opt, int, int);
    ///
	void	 mgl_pipe_3d (HMGL gr, HCDT ax, HCDT ay, HCDT az, const(char)* sch, double r0, const(char)* opt);
    ///
	void	 mgl_pipe_3d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, mreal* r0, const(char)* opt, int, int);
    ///
	void	 mgl_grad_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ph, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_grad_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ph, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_grad_xy (HMGL gr, HCDT x, HCDT y, HCDT ph, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_grad_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ph, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_grad (HMGL gr, HCDT ph, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_grad_ (uintptr_t* gr, uintptr_t* ph, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_vect3_xyz (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_vect3_xyz_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_vect3 (HMGL gr, HCDT ax, HCDT ay, HCDT az, const(char)* sch, double sVal, const(char)* opt);
    ///
	void	 mgl_vect3_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, uintptr_t* az, const(char)* sch, mreal* sVal, const(char)* opt, int, int);

	void mgl_mark (HMGL gr, double x, double y, double z, const(char)* mark);
    ///
	void	 mgl_mark_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z, const(char)* mark, int);
    ///
	void	 mgl_ball (HMGL gr, double x, double y, double z);
    ///
	void	 mgl_ball_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z);
    ///
	void	 mgl_line (HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, const(char)* pen, int n);
    ///
	void	 mgl_line_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, const(char)* pen, int* n, int);
    ///
	void	 mgl_curve (HMGL gr, double x1, double y1, double z1, double dx1, double dy1, double dz1, double x2, double y2, double z2, double dx2, double dy2, double dz2, const(char)* pen, int n);
    ///
	void	 mgl_curve_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* dx1, mreal* dy1, mreal* dz1, mreal* x2, mreal* y2, mreal* z2, mreal* dx2, mreal* dy2, mreal* dz2, const(char)* pen, int* n, int l);
    ///
	void	 mgl_error_box (HMGL gr, double x, double y, double z, double ex, double ey, double ez, const(char)* pen);
    ///
	void	 mgl_error_box_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z, mreal* ex, mreal* ey, mreal* ez, const(char)* pen, int);
    ///
	void	 mgl_face (HMGL gr, double x0, double y0, double z0, double x1, double y1, double z1, double x2, double y2, double z2, double x3, double y3, double z3, const(char)* stl);
    ///
	void	 mgl_face_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, mreal* x3, mreal* y3, mreal* z3, const(char)* stl, int);
    ///
	void	 mgl_facex (HMGL gr, double x0, double y0, double z0, double wy, double wz, const(char)* stl, double dx, double dy);
    ///
	void	 mgl_facex_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, mreal* wy, mreal* wz, const(char)* stl, mreal* dx, mreal* dy, int l);
    ///
	void	 mgl_facey (HMGL gr, double x0, double y0, double z0, double wx, double wz, const(char)* stl, double dx, double dy);
    ///
	void	 mgl_facey_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, mreal* wx, mreal* wz, const(char)* stl, mreal* dx, mreal* dy, int l);
    ///
	void	 mgl_facez (HMGL gr, double x0, double y0, double z0, double wx, double wy, const(char)* stl, double dx, double dy);
    ///
	void	 mgl_facez_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, mreal* wx, mreal* wy, const(char)* stl, mreal* dx, mreal* dy, int l);
    ///
	void	 mgl_sphere (HMGL gr, double x, double y, double z, double r, const(char)* stl);
    ///
	void	 mgl_sphere_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z, mreal* r, const(char)* stl, int);
    ///
	void	 mgl_drop (HMGL gr, double x, double y, double z, double dx, double dy, double dz, double r, const(char)* stl, double shift, double ap);
    ///
	void	 mgl_drop_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, mreal* r, const(char)* stl, mreal* shift, mreal* ap, int);
    ///
	void	 mgl_cone (HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, double r1, double r2, const(char)* stl);
    ///
	void	 mgl_cone_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, mreal* r1, mreal* r2, const(char)* stl, int);
    ///
	void	 mgl_ellipse (HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, double r, const(char)* stl);
    ///
	void	 mgl_ellipse_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, mreal* r, const(char)* stl, int);
    ///
	void	 mgl_rhomb (HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, double r, const(char)* stl);
    ///
	void	 mgl_rhomb_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, mreal* r, const(char)* stl, int);
    ///
	void	 mgl_polygon (HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, int n, const(char)* stl);
    ///
	void	 mgl_polygon_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* z1, mreal* x2, mreal* y2, mreal* z2, int* n, const(char)* stl, int);
    ///
	void	 mgl_arc_ext (HMGL gr, double x0, double y0, double z0, double xr, double yr, double zr, double x1, double y1, double z1, double a, const(char)* stl);
    ///
	void	 mgl_arc_ext_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* z0, mreal* xr, mreal* yr, mreal* zr, mreal* x1, mreal* y1, mreal* z1, mreal* a, const(char)* stl, int);
    ///
	void	 mgl_arc (HMGL gr, double x0, double y0, double x1, double y1, double a, const(char)* stl);
    ///
	void	 mgl_arc_ (uintptr_t* gr, mreal* x0, mreal* y0, mreal* x1, mreal* y1, mreal* a, const(char)* stl, int l);
    ///
	void	 mgl_cones_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_cones_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_cones_xz (HMGL graph, HCDT x, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_cones_xz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_cones (HMGL graph, HCDT z, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_cones_ (uintptr_t* graph, uintptr_t* z, const(char)* pen, const(char)* opt, int, int);
    ///
	void	 mgl_dew_xy (HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_dew_xy_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dew_2d (HMGL gr, HCDT ax, HCDT ay, const(char)* sch, const(char)* optl);
    ///
	void	 mgl_dew_2d_ (uintptr_t* gr, uintptr_t* ax, uintptr_t* ay, const(char)* sch, const(char)* opt, int, int l);
    ///
	void	 mgl_puts (HMGL graph, double x, double y, double z, const(char)* text, const(char)* font, double size);
    ///
	void	 mgl_puts_ (uintptr_t* graph, mreal* x, mreal* y, mreal* z, const(char)* text, const(char)* font, mreal* size, int, int);
    ///
	void	 mgl_putsw (HMGL graph, double x, double y, double z, const(dchar)* text, const(char)* font, double size);
    ///
	void	 mgl_puts_dir (HMGL graph, double x, double y, double z, double dx, double dy, double dz, const(char)* text, const(char)* font, double size);
    ///
	void	 mgl_puts_dir_ (uintptr_t* graph, mreal* x, mreal* y, mreal* z, mreal* dx, mreal* dy, mreal* dz, const(char)* text, const(char)* font, mreal* size, int, int);
    ///
	void	 mgl_putsw_dir (HMGL graph, double x, double y, double z, double dx, double dy, double dz, const(dchar)* text, const(char)* font, double size);
    ///
	void	 mgl_textmark_xyzr (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark_xyzr_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* r, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_textmarkw_xyzr (HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark_xyr (HMGL graph, HCDT x, HCDT y, HCDT r, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark_xyr_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* r, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_textmarkw_xyr (HMGL graph, HCDT x, HCDT y, HCDT r, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark_yr (HMGL graph, HCDT y, HCDT r, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark_yr_ (uintptr_t* graph, uintptr_t* y, uintptr_t* r, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_textmarkw_yr (HMGL graph, HCDT y, HCDT r, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark (HMGL graph, HCDT y, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmarkw (HMGL graph, HCDT y, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_textmark_ (uintptr_t* graph, uintptr_t* y, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_label_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_label_xyz_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_labelw_xyz (HMGL graph, HCDT x, HCDT y, HCDT z, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_label_xy (HMGL graph, HCDT x, HCDT y, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_label_xy_ (uintptr_t* graph, uintptr_t* x, uintptr_t* y, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_labelw_xy (HMGL graph, HCDT x, HCDT y, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_label_y (HMGL graph, HCDT y, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_labelw_y (HMGL graph, HCDT y, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_label_y_ (uintptr_t* graph, uintptr_t* y, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_table (HMGL gr, double x, double y, HCDT val, const(char)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_table_ (uintptr_t* gr, mreal* x, mreal* y, uintptr_t* val, const(char)* text, const(char)* fnt, const(char)* opt, int, int, int);
    ///
	void	 mgl_tablew (HMGL gr, double x, double y, HCDT val, const(dchar)* text, const(char)* fnt, const(char)* opt);
    ///
	void	 mgl_logo (HMGL gr, c_long w, c_long h, const(ubyte)* rgba, int smooth, const(char)* opt);
    ///
	void	 mgl_logo_file (HMGL gr, const(char)* fname, int smooth, const(char)* opt);
    ///
	void	 mgl_logo_file_ (uintptr_t* gr, const(char)* fname, int* smooth, const(char)* opt, int l, int n);

	void mgl_triplot_xyzc (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_triplot_xyzc_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_triplot_xyz (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_triplot_xyz_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_triplot_xy (HMGL gr, HCDT nums, HCDT x, HCDT y, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_triplot_xy_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_quadplot_xyzc (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_quadplot_xyzc_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_quadplot_xyz (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_quadplot_xyz_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_quadplot_xy (HMGL gr, HCDT nums, HCDT x, HCDT y, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_quadplot_xy_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricont_xyzcv (HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricont_xyzcv_ (uintptr_t* gr, uintptr_t* v, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricont_xycv (HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricont_xycv_ (uintptr_t* gr, uintptr_t* v, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricont_xyzc (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricont_xyzc_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricont_xyc (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricont_xyc_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricontv_xyzcv (HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricontv_xyzcv_ (uintptr_t* gr, uintptr_t* v, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricontv_xycv (HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricontv_xycv_ (uintptr_t* gr, uintptr_t* v, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricontv_xyzc (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricontv_xyzc_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_tricontv_xyc (HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_tricontv_xyc_ (uintptr_t* gr, uintptr_t* nums, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dots (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_dots_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dots_a (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_dots_a_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dots_ca (HMGL gr, HCDT x, HCDT y, HCDT z, HCDT c, HCDT a, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_dots_ca_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, uintptr_t* c, uintptr_t* a, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_crust (HMGL gr, HCDT x, HCDT y, HCDT z, const(char)* sch, const(char)* opt);
    ///
	void	 mgl_crust_ (uintptr_t* gr, uintptr_t* x, uintptr_t* y, uintptr_t* z, const(char)* sch, const(char)* opt, int, int);
    ///
	void	 mgl_dens_x (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_dens_x_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_dens_y (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_dens_y_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_dens_z (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_dens_z_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont_x (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_cont_x_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont_y (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_cont_y_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont_z (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_cont_z_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont_x_val (HMGL graph, HCDT v, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_cont_x_val_ (uintptr_t* graph, uintptr_t* v, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont_y_val (HMGL graph, HCDT v, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_cont_y_val_ (uintptr_t* graph, uintptr_t* v, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_cont_z_val (HMGL graph, HCDT v, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_cont_z_val_ (uintptr_t* graph, uintptr_t* v, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf_x (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_contf_x_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf_y (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_contf_y_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf_z (HMGL graph, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_contf_z_ (uintptr_t* graph, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf_x_val (HMGL graph, HCDT v, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_contf_x_val_ (uintptr_t* graph, uintptr_t* v, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf_y_val (HMGL graph, HCDT v, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_contf_y_val_ (uintptr_t* graph, uintptr_t* v, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);
    ///
	void	 mgl_contf_z_val (HMGL graph, HCDT v, HCDT a, const(char)* stl, double sVal, const(char)* opt);
    ///
	void	 mgl_contf_z_val_ (uintptr_t* graph, uintptr_t* v, uintptr_t* a, const(char)* stl, mreal* sVal, const(char)* opt, int, int);

	HMGL mgl_create_graph (int width, int height);
	uintptr_t mgl_create_graph_ (int* width, int* height);
    ///
	void	 mgl_delete_graph (HMGL gr);
    ///
	void	 mgl_delete_graph_ (uintptr_t* gr);
    ///
	void	 mgl_set_size (HMGL gr, int width, int height);
    ///
	void	 mgl_set_size_ (uintptr_t* gr, int* width, int* height);
    ///
	void	 mgl_set_def_param (HMGL gr);
    ///
	void	 mgl_set_def_param_ (uintptr_t* gr);
    ///
	void	 mgl_combine_gr (HMGL gr, HMGL gr2);
    ///
	void	 mgl_combine_gr_ (uintptr_t* gr, uintptr_t* gr2);
    ///
	void	 mgl_finish (HMGL gr);
    ///
	void	 mgl_finish_ (uintptr_t* gr);
    ///
	void	 mgl_rasterize (HMGL gr);
    ///
	void	 mgl_rasterize_ (uintptr_t* gr);
    ///
	void	 mgl_set_tick_len (HMGL gr, double len, double stt);
    ///
	void	 mgl_set_tick_len_ (uintptr_t* gr, mreal* len, mreal* stt);
    ///
	void	 mgl_set_axis_stl (HMGL gr, const(char)* stl, const(char)* tck, const(char)* sub);
    ///
	void	 mgl_set_axis_stl_ (uintptr_t* gr, const(char)* stl, const(char)* tck, const(char)* sub, int, int, int);
    ///
	void	 mgl_adjust_ticks (HMGL gr, const(char)* dir);
    ///
	void	 mgl_adjust_ticks_ (uintptr_t* gr, const(char)* dir, int);
    ///
	void	 mgl_adjust_ticks_ext (HMGL gr, const(char)* dir, const(char)* stl);
    ///
	void	 mgl_adjust_ticks_ext_ (uintptr_t* gr, const(char)* dir, const(char)* stl, int, int);
    ///
	void	 mgl_set_ticks (HMGL gr, char dir, double d, int ns, double org);
    ///
	void	 mgl_set_ticks_ (uintptr_t* gr, char* dir, mreal* d, int* ns, mreal* org, int);
    ///
	void	 mgl_set_ticks_fact (HMGL gr, char dir, double d, int ns, double org, const(char)* fact);
    ///
	void	 mgl_set_ticks_factw (HMGL gr, char dir, double d, int ns, double org, const(dchar)* fact);
    ///
	void	 mgl_set_ticks_fact_ (uintptr_t* gr, char* dir, double* d, int* ns, double* org, const(char)* fact, int, int);
    ///
	void	 mgl_set_ticks_str (HMGL gr, char dir, const(char)* lbl, int add);
    ///
	void	 mgl_set_ticks_str_ (uintptr_t* gr, const(char)* dir, const(char)* lbl, int* add, int, int);
    ///
	void	 mgl_set_ticks_wcs (HMGL gr, char dir, const(dchar)* lbl, int add);
    ///
	void	 mgl_set_ticks_val (HMGL gr, char dir, HCDT val, const(char)* lbl, int add);
    ///
	void	 mgl_set_ticks_val_ (uintptr_t* gr, const(char)* dir, uintptr_t* val, const(char)* lbl, int* add, int, int);
    ///
	void	 mgl_set_ticks_valw (HMGL gr, char dir, HCDT val, const(dchar)* lbl, int add);
    ///
	void	 mgl_add_tick (HMGL gr, char dir, double val, const(char)* lbl);
    ///
	void	 mgl_add_tick_ (uintptr_t* gr, const(char)* dir, mreal* val, const(char)* lbl, int, int);
    ///
	void	 mgl_add_tickw (HMGL gr, char dir, double val, const(dchar)* lbl);
    ///
	void	 mgl_tune_ticks (HMGL gr, int tune, double fact_pos);
    ///
	void	 mgl_tune_ticks_ (uintptr_t* gr, int* tune, mreal* fact_pos);
    ///
	void	 mgl_set_tick_templ (HMGL gr, char dir, const(char)* templ);
    ///
	void	 mgl_set_tick_templ_ (uintptr_t* gr, const(char)* dir, const(char)* templ, int, int);
    ///
	void	 mgl_set_tick_templw (HMGL gr, char dir, const(dchar)* templ);
    ///
	void	 mgl_set_ticks_time (HMGL gr, char dir, double d, const(char)* t);
    ///
	void	 mgl_set_ticks_time_ (uintptr_t* gr, const(char)* dir, mreal* d, const(char)* t, int, int);
    ///
	void	 mgl_set_tick_shift (HMGL gr, double sx, double sy, double sz, double sc);
    ///
	void	 mgl_set_tick_shift_ (uintptr_t* gr, mreal* sx, mreal* sy, mreal* sz, mreal* sc);
    ///
	void	 mgl_box (HMGL gr);
    ///
	void	 mgl_box_ (uintptr_t* gr);
    ///
	void	 mgl_box_str (HMGL gr, const(char)* col, int ticks);
    ///
	void	 mgl_box_str_ (uintptr_t* gr, const(char)* col, int* ticks, int);
    ///
	void	 mgl_axis (HMGL gr, const(char)* dir, const(char)* stl, const(char)* opt);
    ///
	void	 mgl_axis_ (uintptr_t* gr, const(char)* dir, const(char)* stl, const(char)* opt, int, int, int);
    ///
	void	 mgl_axis_grid (HMGL gr, const(char)* dir, const(char)* pen, const(char)* opt);
    ///
	void	 mgl_axis_grid_ (uintptr_t* gr, const(char)* dir, const(char)* pen, const(char)* opt, int, int, int);
    ///
	void	 mgl_label (HMGL gr, char dir, const(char)* text, double pos, const(char)* opt);
    ///
	void	 mgl_label_ (uintptr_t* gr, const(char)* dir, const(char)* text, mreal* pos, const(char)* opt, int, int, int);
    ///
	void	 mgl_labelw (HMGL gr, char dir, const(dchar)* text, double pos, const(char)* opt);
    ///
	void	 mgl_colorbar (HMGL gr, const(char)* sch);
    ///
	void	 mgl_colorbar_ (uintptr_t* gr, const(char)* sch, int);
    ///
	void	 mgl_colorbar_ext (HMGL gr, const(char)* sch, double x, double y, double w, double h);
    ///
	void	 mgl_colorbar_ext_ (uintptr_t* gr, const(char)* sch, mreal* x, mreal* y, mreal* w, mreal* h, int);
    ///
	void	 mgl_colorbar_val (HMGL gr, HCDT dat, const(char)* sch);
    ///
	void	 mgl_colorbar_val_ (uintptr_t* gr, uintptr_t* dat, const(char)* sch, int);
    ///
	void	 mgl_colorbar_val_ext (HMGL gr, HCDT dat, const(char)* sch, double x, double y, double w, double h);
    ///
	void	 mgl_colorbar_val_ext_ (uintptr_t* gr, uintptr_t* dat, const(char)* sch, mreal* x, mreal* y, mreal* w, mreal* h, int);
    ///
	void	 mgl_add_legend (HMGL gr, const(char)* text, const(char)* style);
    ///
	void	 mgl_add_legend_ (uintptr_t* gr, const(char)* text, const(char)* style, int, int);
    ///
	void	 mgl_add_legendw (HMGL gr, const(dchar)* text, const(char)* style);
    ///
	void	 mgl_clear_legend (HMGL gr);
    ///
	void	 mgl_clear_legend_ (uintptr_t* gr);
    ///
	void	 mgl_legend_pos (HMGL gr, double x, double y, const(char)* font, const(char)* opt);
    ///
	void	 mgl_legend_pos_ (uintptr_t* gr, mreal* x, mreal* y, const(char)* font, const(char)* opt, int, int);
    ///
	void	 mgl_legend (HMGL gr, int where, const(char)* font, const(char)* opt);
    ///
	void	 mgl_legend_ (uintptr_t* gr, int* where, const(char)* font, const(char)* opt, int, int);
    ///
	void	 mgl_set_legend_marks (HMGL gr, int num);
    ///
	void	 mgl_set_legend_marks_ (uintptr_t* gr, int* num);
    ///
	void	 mgl_show_image (HMGL gr, const(char)* viewer, int keep);
    ///
	void	 mgl_show_image_ (uintptr_t* gr, const(char)* viewer, int* keep, int);
    ///
	void	 mgl_write_frame (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_frame_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_tga (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_tga_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_bmp (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_bmp_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_jpg (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_jpg_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_png (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_png_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_png_solid (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_png_solid_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_bps (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_bps_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_eps (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_eps_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_svg (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_svg_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_tex (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_tex_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_obj (HMGL gr, const(char)* fname, const(char)* descr, int use_png);
    ///
	void	 mgl_write_obj_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int* use_png, int, int);
    ///
	void	 mgl_write_obj_old (HMGL gr, const(char)* fname, const(char)* descr, int use_png);
    ///
	void	 mgl_write_obj_old_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int* use_png, int, int);
    ///
	void	 mgl_write_stl (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_stl_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_off (HMGL gr, const(char)* fname, const(char)* descr, int colored);
    ///
	void	 mgl_write_off_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int* colored, int, int);
    ///
	void	 mgl_write_xyz (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_xyz_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_prc (HMGL gr, const(char)* fname, const(char)* descr, int make_pdf);
    ///
	void	 mgl_write_prc_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int* make_pdf, int, int);
    ///
	void	 mgl_write_gif (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_gif_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_start_gif (HMGL gr, const(char)* fname, int ms);
    ///
	void	 mgl_start_gif_ (uintptr_t* gr, const(char)* fname, int* ms, int);
    ///
	void	 mgl_close_gif (HMGL gr);
    ///
	void	 mgl_close_gif_ (uintptr_t* gr);
    ///
	void	 mgl_export_mgld (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_export_mgld_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_import_mgld (HMGL gr, const(char)* fname, int add);
    ///
	void	 mgl_import_mgld_ (uintptr_t* gr, const(char)* fname, int* add, int);
    ///
	void	 mgl_write_json (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_json_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
    ///
	void	 mgl_write_json_z (HMGL gr, const(char)* fname, const(char)* descr);
    ///
	void	 mgl_write_json_z_ (uintptr_t* gr, const(char)* fname, const(char)* descr, int, int);
	const(char)* mgl_get_json (HMGL gr);
	const(ubyte)* mgl_get_rgb (HMGL gr);
	const(ubyte)* mgl_get_rgb_ (uintptr_t* gr);
	const(ubyte)* mgl_get_rgba (HMGL gr);
	const(ubyte)* mgl_get_rgba_ (uintptr_t* gr);
	const(ubyte)* mgl_get_background (HMGL gr);
	const(ubyte)* mgl_get_background_ (uintptr_t* gr);
    ///
	void	 mgl_set_obj_id (HMGL gr, int id);
    ///
	void	 mgl_set_obj_id_ (uintptr_t* gr, int* id);
	int mgl_get_obj_id (HMGL gr, int x, int y);
	int mgl_get_obj_id_ (uintptr_t* gr, int* x, int* y);
	int mgl_get_spl_id (HMGL gr, int x, int y);
	int mgl_get_spl_id_ (uintptr_t* gr, int* x, int* y);
	int mgl_get_width (HMGL gr);
	int mgl_get_width_ (uintptr_t* gr);
	int mgl_get_height (HMGL gr);
	int mgl_get_height_ (uintptr_t* gr);
    ///
	void	 mgl_calc_xyz (HMGL gr, int xs, int ys, mreal* x, mreal* y, mreal* z);
    ///
	void	 mgl_calc_xyz_ (uintptr_t* gr, int* xs, int* ys, mreal* x, mreal* y, mreal* z);
    ///
	void	 mgl_calc_scr (HMGL gr, double x, double y, double z, int* xs, int* ys);
    ///
	void	 mgl_calc_scr_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z, int* xs, int* ys);
	c_long mgl_is_active (HMGL gr, int xs, int ys, int d);
	c_long mgl_is_active_ (uintptr_t* gr, int* xs, int* ys, int* d);
	int mgl_new_frame (HMGL gr);
	int mgl_new_frame_ (uintptr_t* gr);
    ///
	void	 mgl_end_frame (HMGL gr);
    ///
	void	 mgl_end_frame_ (uintptr_t* gr);
	int mgl_get_num_frame (HMGL gr);
	int mgl_get_num_frame_ (uintptr_t* gr);
    ///
	void	 mgl_reset_frames (HMGL gr);
    ///
	void	 mgl_reset_frames_ (uintptr_t* gr);
    ///
	void	 mgl_get_frame (HMGL gr, int i);
    ///
	void	 mgl_get_frame_ (uintptr_t* gr, int* i);
    ///
	void	 mgl_set_frame (HMGL gr, int i);
    ///
	void	 mgl_set_frame_ (uintptr_t* gr, int* i);
    ///
	void	 mgl_show_frame (HMGL gr, int i);
    ///
	void	 mgl_show_frame_ (uintptr_t* gr, int* i);
    ///
	void	 mgl_del_frame (HMGL gr, int i);
    ///
	void	 mgl_del_frame_ (uintptr_t* gr, int* i);
    ///
	void	 mgl_clear_frame (HMGL gr);
    ///
	void	 mgl_clear_frame_ (uintptr_t* gr);
    ///
	void	 mgl_set_transp_type (HMGL gr, int kind);
    ///
	void	 mgl_set_transp_type_ (uintptr_t* gr, int* kind);
    ///
	void	 mgl_set_alpha (HMGL gr, int enable);
    ///
	void	 mgl_set_alpha_ (uintptr_t* gr, int* enable);
    ///
	void	 mgl_set_fog (HMGL gr, double d, double dz);
    ///
	void	 mgl_set_fog_ (uintptr_t* gr, mreal* dist, mreal* dz);
    ///
	void	 mgl_set_light (HMGL gr, int enable);
    ///
	void	 mgl_set_light_ (uintptr_t* gr, int* enable);
    ///
	void	 mgl_set_light_n (HMGL gr, int n, int enable);
    ///
	void	 mgl_set_light_n_ (uintptr_t* gr, int* n, int* enable);
    ///
	void	 mgl_add_light (HMGL gr, int n, double x, double y, double z);
    ///
	void	 mgl_add_light_ (uintptr_t* gr, int* n, mreal* x, mreal* y, mreal* z);
    ///
	void	 mgl_add_light_ext (HMGL gr, int n, double x, double y, double z, char c, double br, double ap);
    ///
	void	 mgl_add_light_ext_ (uintptr_t* gr, int* n, mreal* x, mreal* y, mreal* z, char* c, mreal* br, mreal* ap, int);
    ///
	void	 mgl_add_light_loc (HMGL gr, int n, double x, double y, double z, double dx, double dy, double dz, char c, double br, double ap);
    ///
	void	 mgl_add_light_loc_ (uintptr_t* gr, int* n, mreal* x, mreal* y, mreal* z, mreal* dx, mreal* dy, mreal* dz, char* c, mreal* br, mreal* ap, int);
    ///
	void	 mgl_mat_pop (HMGL gr);
    ///
	void	 mgl_mat_pop_ (uintptr_t* gr);
    ///
	void	 mgl_mat_push (HMGL gr);
    ///
	void	 mgl_mat_push_ (uintptr_t* gr);
    ///
	void	 mgl_clf (HMGL gr);
    ///
	void	 mgl_clf_ (uintptr_t* gr);
    ///
	void	 mgl_clf_nfog (HMGL gr);
    ///
	void	 mgl_clf_nfog_ (uintptr_t* gr);
    ///
	void	 mgl_clf_rgb (HMGL gr, double r, double g, double b);
    ///
	void	 mgl_clf_rgb_ (uintptr_t* gr, mreal* r, mreal* g, mreal* b);
    ///
	void	 mgl_clf_chr (HMGL gr, char col);
    ///
	void	 mgl_clf_chr_ (uintptr_t* gr, const(char)* col, int);
    ///
	void	 mgl_clf_str (HMGL gr, const(char)* col);
    ///
	void	 mgl_clf_str_ (uintptr_t* gr, const(char)* col, int);
    ///
	void	 mgl_load_background (HMGL gr, const(char)* fname, double alpha);
    ///
	void	 mgl_load_background_ (uintptr_t* gr, const(char)* fname, mreal* alpha, int);
    ///
	void	 mgl_subplot (HMGL gr, int nx, int ny, int m, const(char)* style);
    ///
	void	 mgl_subplot_ (uintptr_t* gr, int* nx, int* ny, int* m, const(char)* s, int);
    ///
	void	 mgl_subplot_d (HMGL gr, int nx, int ny, int m, const(char)* style, double dx, double dy);
    ///
	void	 mgl_subplot_d_ (uintptr_t* gr, int* nx, int* ny, int* m, mreal* dx, mreal* dy);
    ///
	void	 mgl_multiplot (HMGL gr, int nx, int ny, int m, int dx, int dy, const(char)* style);
    ///
	void	 mgl_multiplot_ (uintptr_t* gr, int* nx, int* ny, int* m, int* dx, int* dy, const(char)* s, int);
    ///
	void	 mgl_inplot (HMGL gr, double x1, double x2, double y1, double y2);
    ///
	void	 mgl_inplot_ (uintptr_t* gr, mreal* x1, mreal* x2, mreal* y1, mreal* y2);
    ///
	void	 mgl_relplot (HMGL gr, double x1, double x2, double y1, double y2);
    ///
	void	 mgl_relplot_ (uintptr_t* gr, mreal* x1, mreal* x2, mreal* y1, mreal* y2);
    ///
	void	 mgl_columnplot (HMGL gr, int num, int ind, double d);
    ///
	void	 mgl_columnplot_ (uintptr_t* gr, int* num, int* i, mreal* d);
    ///
	void	 mgl_gridplot (HMGL gr, int nx, int ny, int m, double d);
    ///
	void	 mgl_gridplot_ (uintptr_t* gr, int* nx, int* ny, int* m, mreal* d);
    ///
	void	 mgl_stickplot (HMGL gr, int num, int ind, double tet, double phi);
    ///
	void	 mgl_stickplot_ (uintptr_t* gr, int* num, int* i, mreal* tet, mreal* phi);
    ///
	void	 mgl_title (HMGL gr, const(char)* title, const(char)* stl, double size);
    ///
	void	 mgl_title_ (uintptr_t* gr, const(char)* title, const(char)* stl, mreal* size, int, int);
    ///
	void	 mgl_titlew (HMGL gr, const(dchar)* title, const(char)* stl, double size);
    ///
	void	 mgl_set_plotfactor (HMGL gr, double val);
    ///
	void	 mgl_set_plotfactor_ (uintptr_t* gr, mreal* val);
    ///
	void	 mgl_aspect (HMGL gr, double Ax, double Ay, double Az);
    ///
	void	 mgl_aspect_ (uintptr_t* gr, mreal* Ax, mreal* Ay, mreal* Az);
    ///
	void	 mgl_rotate (HMGL gr, double TetX, double TetZ, double TetY);
    ///
	void	 mgl_rotate_ (uintptr_t* gr, mreal* TetX, mreal* TetZ, mreal* TetY);
    ///
	void	 mgl_rotate_vector (HMGL gr, double Tet, double x, double y, double z);
    ///
	void	 mgl_rotate_vector_ (uintptr_t* gr, mreal* Tet, mreal* x, mreal* y, mreal* z);
    ///
	void	 mgl_perspective (HMGL gr, double val);
    ///
	void	 mgl_perspective_ (uintptr_t* gr, mreal* val);
    ///
	void	 mgl_ask_perspective (HMGL gr, double val);
    ///
	void	 mgl_ask_perspective_ (uintptr_t* gr, mreal* val);
    ///
	void	 mgl_view (HMGL gr, double TetX, double TetZ, double TetY);
    ///
	void	 mgl_view_ (uintptr_t* gr, mreal* TetX, mreal* TetZ, mreal* TetY);
    ///
	void	 mgl_zoom (HMGL gr, double x1, double y1, double x2, double y2);
	///
	void mgl_zoom_ (uintptr_t* gr, mreal* x1, mreal* y1, mreal* x2, mreal* y2);
	///
	void mgl_set_click_func (HMGL gr, void function (void*) func);
	///
	void mgl_wnd_set_func (HMGL gr, int function (HMGL, void*) draw, void* par, void function (void*) reload);
	///
	void mgl_wnd_set_delay (HMGL gr, double dt);
	///
	void mgl_wnd_set_delay_ (uintptr_t* gr, mreal* dt);
	///
	double mgl_wnd_get_delay (HMGL gr);
	///
	double mgl_wnd_get_delay_ (uintptr_t* gr);
	///
	void mgl_setup_window (HMGL gr, int clf_upd, int showpos);
	///
	void mgl_setup_window_ (uintptr_t* gr, int* clf_upd, int* showpos);
	///
	void mgl_wnd_toggle_alpha (HMGL gr);
	///
	void mgl_wnd_toggle_alpha_ (uintptr_t* gr);
	///
	void mgl_wnd_toggle_light (HMGL gr);
	///
	void mgl_wnd_toggle_light_ (uintptr_t* gr);
	///
	void mgl_wnd_toggle_zoom (HMGL gr);
	///
	void mgl_wnd_toggle_zoom_ (uintptr_t* gr);
	///
	void mgl_wnd_toggle_rotate (HMGL gr);
	///
	void mgl_wnd_toggle_rotate_ (uintptr_t* gr);
	///
	void mgl_wnd_toggle_no (HMGL gr);
	///
	void mgl_wnd_toggle_no_ (uintptr_t* gr);
	///
	void mgl_wnd_update (HMGL gr);
	///
	void mgl_wnd_update_ (uintptr_t* gr);
	///
	void mgl_wnd_reload (HMGL gr);
	///
	void mgl_wnd_reload_ (uintptr_t* gr);
	///
	void mgl_wnd_adjust (HMGL gr);
	///
	void mgl_wnd_adjust_ (uintptr_t* gr);
	///
	void mgl_wnd_next_frame (HMGL gr);
	///
	void mgl_wnd_next_frame_ (uintptr_t* gr);
	///
	void mgl_wnd_prev_frame (HMGL gr);
	///
	void mgl_wnd_prev_frame_ (uintptr_t* gr);
	///
	void mgl_wnd_animation (HMGL gr);
	///
	void mgl_wnd_animation_ (uintptr_t* gr);
	///
	void mgl_get_last_mouse_pos (HMGL gr, mreal* x, mreal* y, mreal* z);
	///
	void mgl_get_last_mouse_pos_ (uintptr_t* gr, mreal* x, mreal* y, mreal* z);
	///
	HMPR mgl_create_parser ();
	///
	uintptr_t mgl_create_parser_ ();
	///
	c_long mgl_use_parser (HMPR p, int inc);
	///
	c_long mgl_use_parser_ (uintptr_t*, int* inc);
	///
	void mgl_delete_parser (HMPR p);
	///
	void mgl_delete_parser_ (uintptr_t* p);
	///
	void mgl_parser_add_param (HMPR p, int id, const(char)* str);
	///
	void mgl_parser_add_param_ (uintptr_t* p, int* id, const(char)* str, int);
	///
	void mgl_parser_add_paramw (HMPR p, int id, const(dchar)* str);
	///
	HMDT mgl_parser_add_var (HMPR p, const(char)* name);
	///
	uintptr_t mgl_parser_add_var_ (uintptr_t* p, const(char)* name, int);
	///
	HMDT mgl_parser_add_varw (HMPR p, const(dchar)* name);
	///
	void* mgl_parser_find_var (HMPR p, const(char)* name);
	///
	uintptr_t mgl_parser_find_var_ (uintptr_t* p, const(char)* name, int);
	///
	void* mgl_parser_find_varw (HMPR p, const(dchar)* name);
	///
	void* mgl_parser_get_var (HMPR p, c_ulong id);
	///
	uintptr_t mgl_parser_get_var_ (uintptr_t* p, c_ulong* id);
	///
	c_long mgl_parser_num_var (HMPR p);
	///
	c_long mgl_parser_num_var_ (uintptr_t* p);
	///
	void mgl_parser_del_var (HMPR p, const(char)* name);
	///
	void mgl_parser_del_var_ (uintptr_t* p, const(char)* name, int);
	///
	void mgl_parser_del_varw (HMPR p, const(dchar)* name);
	///
	void mgl_parser_del_all (HMPR p);
	///
	void mgl_parser_del_all_ (uintptr_t* p);
	///
	void mgl_parser_load (HMPR pr, const(char)* dll_name);
	///
	void mgl_parser_load_ (uintptr_t* pr, const(char)* dll_name, int);
	///
	int mgl_parse_line (HMGL gr, HMPR p, const(char)* str, int pos);
	///
	int mgl_parse_line_ (uintptr_t* gr, uintptr_t* p, const(char)* str, int* pos, int);
	///
	int mgl_parse_linew (HMGL gr, HMPR p, const(dchar)* str, int pos);
	///
	void mgl_parse_file (HMGL gr, HMPR p, FILE* fp, int print);
	///
	void mgl_parse_text (HMGL gr, HMPR p, const(char)* str);
	///
	void mgl_parse_text_ (uintptr_t* gr, uintptr_t* p, const(char)* str, int);
	///
	void mgl_parse_textw (HMGL gr, HMPR p, const(dchar)* str);
	///
	void mgl_parser_restore_once (HMPR p);
	///
	void mgl_parser_restore_once_ (uintptr_t* p);
	///
	void mgl_parser_allow_setsize (HMPR p, int a);
	///
	void mgl_parser_allow_setsize_ (uintptr_t* p, int* a);
	///
	void mgl_parser_allow_file_io (HMPR p, int a);
	///
	void mgl_parser_allow_file_io_ (uintptr_t* p, int* a);
	///
	void mgl_parser_allow_dll_call (HMPR p, int a);
	///
	void mgl_parser_allow_dll_call_ (uintptr_t* p, int* a);
	///
	void mgl_parser_stop (HMPR p);
	///
	void mgl_parser_stop_ (uintptr_t* p);
	///
	int mgl_parser_cmd_type (HMPR pr, const(char)* name);
	///
	int mgl_parser_cmd_type_ (uintptr_t* p, const(char)* name, int);
	///
	const(char)* mgl_parser_cmd_desc (HMPR pr, const(char)* name);
	///
	const(char)* mgl_parser_cmd_frmt (HMPR pr, const(char)* name);
	///
	const(char)* mgl_parser_cmd_name (HMPR pr, c_long id);
	///
	c_long mgl_parser_cmd_num (HMPR pr);
	///
	HMDT mgl_parser_calc (HMPR pr, const(char)* formula);
	///
	uintptr_t mgl_parser_calc_ (uintptr_t* pr, const(char)* formula, int);
	///
	HMDT mgl_parser_calcw (HMPR pr, const(dchar)* formula);

	///
	double mgl_gauss_rnd ();
	///
	void mgl_fft_freq (double* freq, c_long nn);
	///
	void mgl_strcls (char* str);
	///
	c_long mgl_strpos (const(char)* str, char* fnd);
	///
	c_long mgl_chrpos (const(char)* str, char fnd);
	///
	char* mgl_fgetstr (FILE* fp);
	///
	void mgl_fgetpar (FILE* fp, const(char)* str, ...);
	///
	int mgl_istrue (char ch);
	///
	void mgl_test (const(char)* str, ...);
	///
	void mgl_info (const(char)* str, ...);
	///
	FILE* mgl_next_data (const(char)* fname, int p);
}