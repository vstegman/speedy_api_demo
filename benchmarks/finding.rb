require 'benchmark'
require 'benchmark/ips'  #Gem benchmark_suite

# Benchmarking test for looping over an array of Hashes and Structs
#   summing a :value key
hashes = []
structs = []

puts "\n#{'#' * 40}\nTesting Hash and Struct value retrieval speed with array#find_all"
puts

#create arrays with identical data
1000000.times {|i| hashes << {id: i, value: rand(100) - 50} }
Struct.new('Value',:id, :value)
hashes.each {|a| structs << Struct::Value.new(a[:id], a[:value])}

puts "Created 2 arrays:"
puts "  -> Hash: #{hashes.length}"
puts "  -> Struct: #{structs.length}"

Benchmark.ips do |x|

  x.report('Hash find_all') { hashes.find_all {|a| a[:value] > 0 }}
  x.report('Struct find_all') { structs.find_all {|a| a.value > 0 }}

  x.compare!
end

