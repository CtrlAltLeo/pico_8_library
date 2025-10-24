-- ### constructors ### --

-- creates a vector2 from x and y components
function vector2(x, y)
  return {x=x, y=y}
end

-- creates a polar2 from radius and angle
function polar2(rad, ang)
  return {r = rad, a = ang}
end

-- ### Conversions ## --

--[[
  Input: Vector2
  Output: Polar2
--]]
function to_polar(vector2)
  rad = sqrt((vector2.x * vector2.x) + (vector2.y * vector2.y))
  ang = atan2(vector2.x, vector2.y)

  return polar2(rad, ang)
end

--[[
  Input: polar1
  Output: vector2
--]]
function to_cart(polar2)
  x = polar2.r * cos(polar2.a)
  y = polar2.r * sin(polar2.a)
  return vector2(x,y)
end

-- ### Operations ### --

function vec_add(v1, v2)
  v = vector2( v1.x + v2.x, v1.y + v2.y)
  return v
end

function scale(v1, scalar)
  v = vector2(v1.x * scalar, v1.y * scalar)
  return v
end

function norm(v1)
  _mag = mag(v1)
  return vector2( v1.x / _mag, v1.y / _mag )
end

function mag(v1)
  return sqrt(v1.x * v1.x + v1.y * v1.y)
end

function printv(v)
  print("x: "..tostring(v.x)..", y: "..tostring(v.y))
end

function printp(p)
  print("r: "..tostring(p.r)..", @: "..tostring(p.a))
end
