lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |gem|
  gem.name = "nmatrix-gemv"
  gem.version = '0.0.1'
  gem.summary = "blas gemv function interface for NMatrix" 
  gem.description = "" 
  gem.homepage = 'http://sciruby.com'
  gem.authors = ['Terence Ng']
  gem.email =  ['pheotiman@gmail.com']
  gem.license = 'BSD 2-clause'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.extensions = ['ext/nmatrix/extconf.rb']
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>= 1.9'

  gem.add_dependency 'rdoc', '>=4.0.1'
  #gem.add_dependency 'yard'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-longrun'
  #gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake-compiler', '~>0.8.1'
end

