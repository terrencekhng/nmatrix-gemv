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
// == nmatrix.cpp
//
// Main C++ source file for NMatrix. Contains Init_nmatrix and most Ruby
// instance and class methods for NMatrix. Also responsible for calling Init
// methods on related modules.

/*
 * Standard Includes
 */

extern "C" {
#if defined HAVE_CBLAS_H
#include <cblas.h>
#elif defined HAVE_ATLAS_CBLAS_H
#include <atlas/cblas.h>
#endif

#if defined HAVE_CLAPACK_H
#include <clapack.h>
#elif defined HAVE_ATLAS_CLAPACK_H
#include <atlas/clapack.h>
#endif
}

#include <ruby.h>
#include <algorithm> // std::min
#include <fstream>

/*
 * Project Includes
 */
#include "nmatrix_gemv_config.h"

#include "types.h"
#include "data/data.h"
#include "math/math.h"
//#include "util/io.h"
//#include "storage/storage.h"
//#include "storage/list/list.h"
//#include "storage/yale/yale.h"

#include "nmatrix_gemv.h"

#include "ruby_constants.h"

/*
 * Ruby internals
 */


/*
 * Macros
 */


/*
 * Global Variables
 */

namespace nm {


} // end of namespace nm

extern "C" {
#include "ruby_nmatrix.c"
} // end of extern "C"
