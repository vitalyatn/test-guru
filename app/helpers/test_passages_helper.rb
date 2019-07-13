module TestPassagesHelper
  def timer(test_passage)
    if test_passage.has_time_limit?
      time_left = test_passage.time_left
      #console
      content_tag :span, "-:-", class: 'time-left', data: { time_left: time_left }
    end
  end
end
