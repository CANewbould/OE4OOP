-- shapes.ex

include oe4oop.e
oop:init()

include circle.e
circle c = Circle(13)
puts(1, "A circle of radius 13 ")
printf(1, "has an area of %g ", Area(c))
printf(1, "and a perimeter of %g\n", Perimeter(c))

include rectangle.e
rectangle r = Rectangle({20, 30})
puts(1, "A rectangle 20x30 ")
printf(1, "has an area of %g ", Area(r))
printf(1, "and a perimeter of %g\n", Perimeter(r))

include triangle.e
triangle t = Triangle({3, 4, 5})
puts(1, "A triangle 3x4x5 ")
printf(1, "has an area of %g ", Area(t))
printf(1, "and a perimeter of %g\n", Perimeter(t))
