# Differential Animation

This is an animation of a mechanical differential for display at the 2014 Grand
Prix in Melbourne.

`differential-base.blend` is where the main model is stored. The other files
reference that one, and add various animations that demonstrate our engineering
capability. To view the files, use [Blender](http://blender.org). These models
were developed using a beta release of Blender version 2.70; for maximum
compatibility, try to use a similar version.

Some files need to generate content before the animation can play:

- `diff-mould.blend` uses a fluid simulation. Open the file, select the
  fluid domain, and bake it.
- `diff-aero.blend` uses a softbody. Open it, select the streamlines,
  and bake the simulation.
- `diff-paint.blend` uses a particle simulation. Open it, select the
  emitter mesh, and bake it.


## Rendering

Open up one of the `diff-*.blend` files in Blender and render it. It's rendered
using Cycles, so you can get a bit of a speed-up if you use the GPU.

To render from the command line, do something like this:

```bash
blender -b -t 8 diff_design.blend -s 220 -e 250 -a
```

That will render frames 220-250 (inclusive) and write each frame to
`render/design%04d.png`, using 8 threads. Note that the order of arguments is
important. The files should already be configured to render at full HD
resolution. If not, or if you need another resolution, you'll have to open the
file and save it again with different settings.


## Committing to This Repository

The golden rule here is to keep everything small. In general, that means you
should store exactly what is needed to generate the final product.

- Store *source* files such as `.blend`, `.svg` and `.ai`.
- If you are using things like images for your source, keep them very small. If
  you have large movie files or photos as your source, then this repository is
  not the right place to store your data.
- Generated data (outputs) such as images and movies should be stored elsewhere.
- Reference files should be stored elsewhere. For example, if you find an image
  on the Internet that you want to use, just store a link (URL) to it in this
  repository.
- Use *uncompressed* files. This may seem counter-intuitive, but git works much
  better with uncompressed data. Similar data will be compressed across the
  repository automatically by git, thus minimising the download size.

It's important to follow these rules to keep the repository small and managable
for future tiny projects. Remember: when you clone a git repository, you
download *everything* that has been committed to it - not just the branch you
are interested in.


## Copyright

All content was created in-house, and is therefore copyright VPAC Innovations.
