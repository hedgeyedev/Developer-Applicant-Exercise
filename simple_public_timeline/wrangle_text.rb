# wrangle/mangle text

def time_phrase(timestamp)

  posted = DateTime.parse(timestamp)
  now = DateTime.now
  elapsed_seconds = now - posted

  range = {
    just_now: 0..30,
    minutes: 31..450,
    quarter_hrs: 451..3600,
    hours: 3600..21600,
    quarter_days: 3600..21600,
    days: 0..30
  }

  case elapsed_seconds
  when range[:just_now]
    "just now"
  when range[:minutes]
    "about #{(elapsed_seconds + 30) / 60 }min ago"
  when range[:quarters]
    "about #{((elapsed_seconds + 450) / 900) * 15 }min ago"
  when range[:hours]
    "about #{(elapsed_seconds + 1800) / 3600}hr ago"
  else
    "recently"
  end

end

def source_phrase(source_link)
  "via " + source_link.to_s
end
