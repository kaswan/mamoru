module ApplicationHelper
  def nl2br(str)
    return sanitize(str).gsub("\n", '<br>').html_safe unless sanitize(str).nil?
  end
end
