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
  
  def formatted_video_duration total_seconds
    mm, ss = total_seconds.to_i.divmod(60)  
    hh, mm = mm.divmod(60)
    if hh > 0
      return "%d時間:%d分:%d秒" % [hh, mm, ss]
    elsif mm > 0
      return "%d分:%d秒" % [mm, ss]
    else
      return "%d秒" % [ss]
    end
  end
  
  def icon_post_type id
    case id # id is the variable we want to compare
    when 1    #compare to 1
      return raw("<img src='/assets/mypage/diary.png' />")
    when 2    #compare to 2
      return raw("<img src='/assets/mypage/food.png' />")
    when 3    #compare to 2
      return raw("<img src='/assets/mypage/sleep.png' />")
    when 4    #compare to 2
      return raw("<img src='/assets/mypage/drug.png' />")
    when 5    #compare to 2
      return raw("<img src='/assets/mypage/health.png' />")
    else
      return raw("<img src='/assets/mypage/diary.png' />")
    end 
  end
end
