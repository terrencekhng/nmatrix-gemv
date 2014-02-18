# nmatrix-gemv #

## How to install ##
`bundle install`

`bundle exec rake compile`

`gem build nmatrix-gemv.gemspec`

`gem install ./nmatrix-gemv-0.0.2.gem`

## How to use ##
```
irb
>require 'nmatrix-gemv'
=> true
```
### In file: ###
Suppose you have [NMatrix](https://github.com/SciRuby/nmatrix) installed.

```{.ruby}
require 'nmatrix'
require 'nmatrix-gemv'

a = NMatrix.new([2,3], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0], dtype: :float64)
x = NMatrix.new([1,4], [2.0, 3.0, 4.0, 5.0], dtype: :float64)

NMatrix::BLAS.gemv(a, x)
```
