program char_order
implicit none

  character :: c1, c2, c3
  c1 = "A"
  c2 = "a"
  c3 = "B"

  print *, "You can check char precedence with `lle, lge, lgt, llt`."

  print *, "Characters being compared: ", c1, c2, c3

  print *, " --- lle(x, y) # lexically less than or equal "
  print *, c1, " vs ", c1, " -> ", lle(c1, c1)
  print *, c1, " vs ", c2, " -> ", lle(c1, c2)
  print *, c1, " vs ", c3, " -> ", lle(c1, c3)
  print *, c2, " vs ", c3, " -> ", lle(c2, c3)
  print *, c3, " vs ", c2, " -> ", lle(c3, c2)

  print *, " --- lge(x, y) # lexically greater than or equal "
  print *, c1, " vs ", c1, " -> ", lge(c1, c1)
  print *, c1, " vs ", c2, " -> ", lge(c1, c2)
  print *, c1, " vs ", c3, " -> ", lge(c1, c3)
  print *, c2, " vs ", c3, " -> ", lge(c2, c3)
  print *, c3, " vs ", c2, " -> ", lge(c3, c2)

  print *, " --- lgt(x, y) # lexically greater than "
  print *, c1, " vs ", c1, " -> ", lgt(c1, c1)
  print *, c1, " vs ", c2, " -> ", lgt(c1, c2)
  print *, c1, " vs ", c3, " -> ", lgt(c1, c3)
  print *, c2, " vs ", c3, " -> ", lgt(c2, c3)
  print *, c3, " vs ", c2, " -> ", lgt(c3, c2)

  print *, " --- llt(x, y) # lexically less than "
  print *, c1, " vs ", c1, " -> ", llt(c1, c1)
  print *, c1, " vs ", c2, " -> ", llt(c1, c2)
  print *, c1, " vs ", c3, " -> ", llt(c1, c3)
  print *, c2, " vs ", c3, " -> ", llt(c2, c3)
  print *, c3, " vs ", c2, " -> ", llt(c3, c2)


end program char_order

