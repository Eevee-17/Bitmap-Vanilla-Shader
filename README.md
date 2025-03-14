This shader is a post-processing shader.
**It only works when graphics is set to _Bitmap_** _(fabulous!)_

This vanilla shader is a resource pack and works with vanilla Minecraft; _no mods needed_!

The whole world of Minecraft is shown in a bitmap style (only black and white pixels). Different shades are interpreted by you with dithering. This vanilla shader adds an interesting and artistic style to the game. You can even use this shader to add a little bit of difficulty and fun to building because it removes the big need for color and instead pushes more for shapes and shading!

My video on this shader: [https://www.youtube.com/watch?v=5AhbD0TNWCQ](https://www.youtube.com/watch?v=5AhbD0TNWCQ)

### Shader Breakdown:
This gets a _little_ technical, but I tried to simplify it a bit.

All the following happens in the transparency post-processing effect after the default processes happen:
- The shader program `invert` with a value of `0.4` is applied to `main`.
- The shader program `notch` _(removed from defaults in 24w11a, so I included working versions of the files in the program folder)_ with a width and height of `8` and bilinear being `true` is applied to the output from the previous program and then put in `main`.
- The shader program `color_convolve` is applied to `main` with `RedMatrix`, `GreenMatrix`, `BlueMatrix`, and `Saturation` being set to `[2.0, 0.0, 0.0]`, `[0.0, 2.0, 0.0]`, `[0.0, 2.0, 0.0]`, and `0.0` respectively.
- The shader program `bits` is applied to the output from the previous program with a resolution and mosaic size of `1.0` and then put in `main`.
