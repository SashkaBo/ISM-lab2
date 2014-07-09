class BinomialSV

  attr_accessor :me, :disp, :sv, :m, :p

  def initialize(m, p)
    @sv = []
    @m = m
    @p = p
    generation_sv
    @me = me
    @disp = disp
  end

  def generation_sv
    file = File.new("our_binom_sv.txt", "w")

    1000.times do |line_number|
      bsv = []
      @m.times { bsv << rand.round(3) }
      x = 0
      @m.times { |i| x += one_function(bsv[i]) }
      @sv << x
      file << "#{line_number}: #{x}\n"
    end

    file.close
  end

  def one_function(a)
    ((@p - a) > 0) ? 1 : 0
  end

  def me
    (@m * @p).round(3)
  end

  def disp
    (@m * @p * (1 - @p)).round(3)
  end

end