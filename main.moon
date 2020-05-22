seconds_in_day = 24 * 60 * 60
-- pulses_per_beat = 1000
-- padding = 3
padding = 3
pulses_per_beat = 100
seconds_per_beat = seconds_in_day / pulses_per_beat
pulses_per_beat = 1000

time = os.date "*t", os.time!
raw = time.hour * 60 * 60 + time.min * 60 + time.sec

padleft = (str, n) ->
  str = tostring str
  return string.rep("0", n - #str) .. str

love.graphics.setFont love.graphics.newFont 100

love.update = (dt) ->
  raw += dt
  if raw >= seconds_in_day
    raw -= seconds_in_day

love.draw = ->
  beat, pulse = math.modf raw / seconds_per_beat
  pulse = math.floor pulse * pulses_per_beat

  -- pulse = math.floor (raw / 86.4 - beat) / 0.0864
  love.graphics.print "#{padleft beat, padding}:#{padleft pulse, padding}"
