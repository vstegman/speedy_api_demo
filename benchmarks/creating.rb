require 'benchmark'
require 'benchmark/ips'  #Gem benchmark_suite
require 'date'

# Benchmarking test for creating / instantiating objects in Hash vs Struct

puts "\n#{'#' * 40}\nTesting object instantiation speed"
puts
Benchmark.ips do |x|
  x.report('Create with Hash') {
    {value: rand(100) - 50, id: rand(100), date: Date.new(2014,12,31)}
  }
  Struct.new('Test',:value, :id, :date)
  x.report('Create with Struct') {
    Struct::Test.new(rand(100) - 50, rand(100),Date.new(2014,12,31))
  }

  x.compare!
end

