class HyperGeomSV

  attr_accessor :me, :disp, :sv, :m, :n, :a

  def initialize(m, n, a)
    @sv = []
    @m = m
    @n = n
    @a = a
    generation_sv
    @me = me
    @disp = disp
  end

  def generation_sv
    file = File.new("our_hg_sv.txt", "w")

    1000.times do |line_number|
      x = 0.0
      n = @n
      m = @m
      @a.times do
        p = m / n.to_f
        r = rand
        if r < p
          x += 1
          m -= 1
        end
        n -= 1
      end

      @sv << x
      file << "#{line_number}: #{x}\n"
    end

    file.close
  end

  def me
    (@m * @a / @n.to_f).round(3)
  end

  def disp
    (@a * @m / @n.to_f * (1 - @m / @n.to_f) * (@n - @a) / (@n - 1).to_f).round(3)
  end
end