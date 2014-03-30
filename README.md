# Animated Logo

This is an animated logo for VPAC Innovations.

To render it, open `LogoSnake.blend` in Blender and press Animate. The
animation will be written to `render/logosnake.avi`.


## Acceptable Content

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
