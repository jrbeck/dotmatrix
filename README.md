# Dot Matrix

Makes it easy to do important things like producing this:

```
 ..  ..
 .......
 .......
 .. . ..
 ..   ..



  ....
 ..  ..
 ......
 ..
  ....

 ...
  ..
  .. ..
  ... ..
  ..  ..
  ..  ..
 ...  ..
```

Using a simple command line:

```bash
ruby dot_matrix.rb meh
```

You can also specify the positive and negative space:

```bash
ruby dot_matrix.rb meh (down) (up)
```

Produces:

```
(up)(up)(up)(up)(up)(up)(up)(up)(up)
(up)(up)(up)(up)(up)(up)(up)(up)(up)
(up)(down)(down)(up)(up)(down)(down)(up)(up)
(up)(down)(down)(down)(down)(down)(down)(down)(up)
(up)(down)(down)(down)(down)(down)(down)(down)(up)
(up)(down)(down)(up)(down)(up)(down)(down)(up)
(up)(down)(down)(up)(up)(up)(down)(down)(up)
(up)(up)(up)(up)(up)(up)(up)(up)(up)
(up)(up)(up)(up)(up)(up)(up)(up)(up)
(up)(up)(up)(up)(up)(up)(up)(up)(up)
(up)(up)(down)(down)(down)(down)(up)(up)(up)
(up)(down)(down)(up)(up)(down)(down)(up)(up)
(up)(down)(down)(down)(down)(down)(down)(up)(up)
(up)(down)(down)(up)(up)(up)(up)(up)(up)
(up)(up)(down)(down)(down)(down)(up)(up)(up)
(up)(up)(up)(up)(up)(up)(up)(up)(up)
(up)(down)(down)(down)(up)(up)(up)(up)(up)
(up)(up)(down)(down)(up)(up)(up)(up)(up)
(up)(up)(down)(down)(up)(down)(down)(up)(up)
(up)(up)(down)(down)(down)(up)(down)(down)(up)
(up)(up)(down)(down)(up)(up)(down)(down)(up)
(up)(up)(down)(down)(up)(up)(down)(down)(up)
(up)(down)(down)(down)(up)(up)(down)(down)(up)
(up)(up)(up)(up)(up)(up)(up)(up)(up)
```

Which is obviously something we need for our chat programs.

## Custom fonts

You can use custom fonts as well. You can program them in directly or load them from a black and white PNG (see included examples.)

Now get back to spamming your company chat!

## Dependencies

chunky_png
