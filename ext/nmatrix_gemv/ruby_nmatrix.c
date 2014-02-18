/////////////////////////////////////////////////////////////////////
// = NMatrix
//
// A linear algebra library for scientific computation in Ruby.
// NMatrix is part of SciRuby.
//
// NMatrix was originally inspired by and derived from NArray, by
// Masahiro Tanaka: http://narray.rubyforge.org
//
// == Copyright Information
//
// SciRuby is Copyright (c) 2010 - 2014, Ruby Science Foundation
// NMatrix is Copyright (c) 2012 - 2014, John Woods and the Ruby Science Foundation
//
// Please see LICENSE.txt for additional copyright notices.
//
// == Contributing
//
// By contributing source code to SciRuby, you agree to be bound by
// our Contributor Agreement:
//
// * https://github.com/SciRuby/sciruby/wiki/Contributor-Agreement
//
// == ruby_nmatrix.c
//
// Ruby-facing NMatrix C functions. Not compiled directly -- included
// into nmatrix.cpp.
//

/*
#ifdef BENCHMARK
static double get_time(void);
#endif
*/

///////////////////
// Ruby Bindings //
///////////////////

void Init_nmatrix_gemv() {


	///////////////////////
	// Class Definitions //
	///////////////////////

	cNMatrix = rb_define_class("NMatrix", rb_cObject);

	// Special exceptions

	/*
	 * Exception raised when there's a problem with data.
	 */
	nm_eDataTypeError    = rb_define_class("DataTypeError", rb_eStandardError);

	/*
	 * Exception raised when something goes wrong with the storage of a matrix.
	 */
	nm_eStorageTypeError = rb_define_class("StorageTypeError", rb_eStandardError);

  /*
   * Class that holds values in use by the C code.
   */
  cNMatrix_GC_holder = rb_define_class("NMGCHolder", rb_cObject);

	///////////////////////
	// Symbol Generation //
	///////////////////////

	nm_init_ruby_constants();

	/////////////////
	// BLAS module //
	/////////////////

	nm_math_init_blas();

	/////////////////////////////////////////////////
	// Force compilation of necessary constructors //
	/////////////////////////////////////////////////
	nm_init_data();
}


