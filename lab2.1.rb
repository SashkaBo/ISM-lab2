require 'pry'
require_relative 'HyperGeomSV.rb'
require_relative 'BinomialSV.rb'

@m = 6
@p = 0.333

@m_hg = 6
@n_hg = 30
@a_hg = 6

def mathematical_expectation(arr)
  me = 0.0
  (@m+1).times { |i| me += i * arr.count(i) / arr.count.to_f }
  me.round(3)
end

def dispersion(arr, me)
  disp = 0.0
  (@m+1).times { |i| disp += (i - me)**2 * arr.count(i) / arr.count.to_f }
  disp.round(3)
end

bsv = BinomialSV.new(@m, @p)
@me = mathematical_expectation(bsv.sv)
@disp = dispersion(bsv.sv, @me)

puts "Binomial SV"
puts "binom me: #{bsv.me}"
puts "binom disp: #{bsv.disp}"
puts "me #{@me}"
puts "disp #{@disp}"

hgsv = HyperGeomSV.new(@m_hg, @n_hg, @a_hg)
@me = mathematical_expectation(hgsv.sv)
@disp = dispersion(hgsv.sv, @me)

puts "HyperGeomSV"
puts "hg me: #{hgsv.me}"
puts "hg disp: #{hgsv.disp}"
puts "me #{@me}"
puts "disp #{@disp}"
