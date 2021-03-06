require 'benchmark'
require 'benchmark/ips'  #Gem benchmark_suite

# Benchmarking test for looping over an array of Hashes and Structs
#   summing a :value key
hashes = []
structs = []

puts "\n#{'#' * 40}\nTesting array looping methods for summing"
puts

#create arrays with identical data
1000000.times {|i| hashes << {id: i, value: rand(100) - 50} }
Struct.new('Value',:id, :value)
hashes.each {|a| structs << Struct::Value.new(a[:id], a[:value])}

puts "Created 2 arrays:"
puts "  -> Hash: #{hashes.length}"
puts "  -> Struct: #{structs.length}"

Benchmark.ips do |x|

  x.report('Hash with Each') {sum = 0; hashes.each {|a| sum += a[:value] }}
  x.report('Struct with Each') {sum = 0; structs.each {|a| sum += a.value }}
  x.report('Hash with Map+Inject') { hashes.map {|a|  a[:value]}.inject(0) {|sum,i| sum+i} }
  x.report('Struct with Map+Inject') {structs.map {|a| a.value }.inject(0) {|sum,i| sum+i} }
  x.report('Struct with Reduce') {structs.reduce(0) {|memo,a| memo + a.value }}
  x.report('Hash with Reduce') {hashes.reduce(0) {|memo,a| memo + a[:value]}}

  x.compare!
end

