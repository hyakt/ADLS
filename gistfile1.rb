
# coding: utf-8

Point = Struct.new(:x, :y)

def koch(i, p1, p2)

  if i == $n
    return
  end
  
  s = u = t = Point.new(0, 0)

  s.x = (2.0 * p1.x + 1.0 * p2.x) / 3.0
  s.y = (2.0 * p1.y + 1.0 * p2.y) / 3.0
  t.x = (1.0 * p1.x + 2.0 * p2.x) / 3.0
  t.y = (1.0 * p1.y + 2.0 * p2.y) / 3.0
  u.x = (t.x - s.x) * Math.cos(60) - (t.y - s.y) * Math.sin(60) + s.x
  u.y = (t.x - s.x) * Math.sin(60) + (t.y - s.y) * Math.cos(60) + s.y
 

  p s
  
  koch(i+1, p1, s)
  p s
  koch(i+1, s, u)
  p u
  koch(i+1, u, t)
  p t
  koch(i+1, t, p2) 

end

$n = 1

p koch(0, Point.new(0, 0), Point.new(100, 0))
