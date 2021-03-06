# Usage example:
#  eta = SimpleETA::ETA.new(100)
#  100.times { |i| sleep 1; eta.next! }
#
# => [59/100] 59.00% ETA 00m 41s
#
class SimpleETA
  DEFAULT_FMT = "\r[%{current}/%{total}] %{percent}%% ETA %{eta} (%{duration})"
  KEYWORDS = {
    "%{total}" => "%1$d",
    "%{current}" => "%2$d",
    "%{percent}" => "%3$.2f",
    "%{duration}" => "%4$s",
    "%{eta}" => "%5$s",
  }

  def initialize(total, opts = {})
    reset!(opts)
    @total = total.to_i
    @format = opts[:format] || DEFAULT_FMT
    KEYWORDS.each do |keyword, val|
      @format.gsub!(keyword, val)
    end
  end

  def reset!(opts = {})
    @start_time = opts[:start_time] || Time.now
    @current = 0
  end

  def next!
    @current += 1
    show
  end

  def show
    current = @current
    print(@format % [@total, current, percent(current), duration, eta(current)])
    print("\n") if current == @total
  end

  private
  def percent(current)
    return 100.0 if @total.to_i <= 0
    current * 100 / @total.to_f
  end

  def duration
    dur = (Time.now - @start_time).to_i
    "%02dm %02ds" % [(dur/60), (dur%60)]
  end

  def eta(current)
    if current > 0 && current <= @total
      dur = (Time.now - @start_time).to_i
      remaining = dur * (@total - current) / current
      "%02dm %02ds" % [(remaining/60), (remaining%60)]
    else
      "--m --s"
    end
  end
end
