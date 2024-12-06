
#set page(width: auto, height: auto, margin: 2mm, fill: luma(96%))

#let page-count = 2
#grid( columns: page-count, gutter: 2mm, ..for i in range(page-count) {
    (image("theme-cnltx-pages/" + str(i + 1) + ".png", width: 2cm),)
  } )
