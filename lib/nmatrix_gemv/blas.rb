#--
# = NMatrix
#
# A linear algebra library for scientific computation in Ruby.
# NMatrix is part of SciRuby.
#
# NMatrix was originally inspired by and derived from NArray, by
# Masahiro Tanaka: http://narray.rubyforge.org
#
# == Copyright Information
#
# SciRuby is Copyright (c) 2010 - 2014, Ruby Science Foundation
# NMatrix is Copyright (c) 2012 - 2014, John Woods and the Ruby Science Foundation
#
# Please see LICENSE.txt for additional copyright notices.
#
# == Contributing
#
# By contributing source code to SciRuby, you agree to be bound by
# our Contributor Agreement:
#
# * https://github.com/SciRuby/sciruby/wiki/Contributor-Agreement
#
# == blas.rb
#
# This file contains the safer accessors for the BLAS functions
# supported by NMatrix.
#++

#module NMatrix::BLAS
class NMatrix
  module BLAS
    class << self

      #
      # call-seq:
      #     gemv(a, x) -> NMatrix
      #     gemv(a, x, y) -> NMatrix
      #     gemv(a, x, y, alpha, beta) -> NMatrix
      #
      # Implements matrix-vector product via
      #   y = (alpha * A * x) + (beta * y)
      # where +alpha+ and +beta+ are scalar values.
      #
      # * *Arguments* :
      #   - +a+ -> Matrix A.
      #   - +x+ -> Vector x.
      #   - +y+ -> Vector y.
      #   - +alpha+ -> A scalar value that multiplies A * x.
      #   - +beta+ -> A scalar value that multiplies y.
      #   - +transpose_a+ ->
      #   - +m+ ->
      #   - +n+ ->
      #   - +lda+ ->
      #   - +incx+ ->
      #   - +incy+ ->
      # * *Returns* :
      #   -
      # * *Raises* :
      #   - ++ ->
      #
      def gemv(a, x, y = nil, alpha = 1.0, beta = 0.0, transpose_a = false, m = nil, n = nil, lda = nil, incx = nil, incy = nil)
        raise(ArgumentError, 'Expected dense NMatrices as first two arguments.') unless a.is_a?(NMatrix) and x.is_a?(NMatrix) and a.stype == :dense and x.stype == :dense
        raise(ArgumentError, 'Expected nil or dense NMatrix as third argument.') unless y.nil? or (y.is_a?(NMatrix) and y.stype == :dense)
        raise(ArgumentError, 'NMatrix dtype mismatch.')													 unless a.dtype == x.dtype and (y ? a.dtype == y.dtype : true)

        m ||= transpose_a ? a.shape[1] : a.shape[0]
        n ||= transpose_a ? a.shape[0] : a.shape[1]

        lda		||= a.shape[1]
        incx	||= 1
        incy	||= 1

        # NM_COMPLEX64 and NM_COMPLEX128 both require complex alpha and beta.
        if a.dtype == :complex64 or a.dtype == :complex128
          alpha = Complex(1.0, 0.0) if alpha == 1.0
          beta  = Complex(0.0, 0.0) if beta  == 0.0
        end

        y ||= NMatrix.new([m, n], dtype: a.dtype)

        ::NMatrix::BLAS.cblas_gemv(transpose_a, m, n, alpha, a, lda, x, incx, beta, y, incy)

        return y
      end
    end
  end
end
