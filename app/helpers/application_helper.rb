module ApplicationHelper
  def nl2br(str)
    return sanitize(str).gsub("\n", '<br>').html_safe unless sanitize(str).nil?
  end
  
  def options_for_time_select
      hour = Array.new
      for $h in 8..21 do
          for $m in ['00', '30'] do
              hour.push [$h.to_s + "時" + $m.to_s+ "分", "%02d" % $h + ":" + $m + ":00"]
          end
      end
      hour
  end
end
