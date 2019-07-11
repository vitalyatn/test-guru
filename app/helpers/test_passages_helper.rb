module TestPassagesHelper
  def timer(test_passage)
    if test_passage.has_time_limit?
      #console
      # сколько времени осталось
      time_left = (test_passage.test.time_limit - (Time.now - test_passage.created_at)).to_i
      content_tag :span, "-:-", class: 'time-left', data: { time_left: time_left }
    end
  end
end
