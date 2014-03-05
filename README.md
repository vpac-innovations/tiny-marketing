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


## Transcoding into Video

Once the `.png` files have been rendered, you'll want to combine them into a
video for playback. Because the background has a subtle gradient, the frames
[must be combined with a noise texture][grad-band] to prevent banding.

For playback on TVs, it's best to use a bitrate of around 30Mbps, with h264
for video and AAC for audio. Don't leave the audio track off completely, or the
TV may complain; therefore if you don't have any music, use `/dev/zero` as the
input. For the Web, use VP8 (which is unfortunately not supported by mant TVs at
the moment).

[grad-band]: http://www.vueplus.com/blog/2012/09/how-to-avoid-gradient-banding/


### Individual Videos

Each section can be rendered separately:

```bash
for anim in aero design mould paint stress system xsection; do
    avconv \
        -ar 48000 -ac 2 -f s16le -i /dev/zero \
        -i render/$anim%04d.png \
        -shortest \
        -vf "movie=textures/noise3.png [watermark];[in][watermark] overlay=0:0 [out]" \
        -b:v 30000k -qmin 2 -qmax 30 -c:v libx264 \
        -c:a aac -strict experimental \
        video/$anim-h264.mp4
done
```


### Full Video

Combining all frames without loss of quality is tricky to do with arguments to
`avconv`. The easiest way to do it is to make symlinks to the individual frames
first in the order that you want.

```bash
i=0
for f in render/*; do
    ln -s `pwd`/$f /tmp/combined/img-$i.png
    i=$(( i + 1 ))
done

avconv \
    -ar 48000 -ac 2 -f s16le -i /dev/zero \
    -i /tmp/combined/img-%d.png \
    -shortest \
    -vf "movie=textures/noise3.png [watermark];[in][watermark] overlay=0:0 [out]" \
    -b:v 30000k -qmin 2 -qmax 30 -c:v libx264 \
    -c:a aac -strict experimental \
    video/all-x264.mp4
```


### Noise Texture

The noise texture is not included in this repository, due to its large size. You
can create one easily in The GIMP: use the *HSV Noise* filter on a middle grey
images with values like these:

- Holdness: 3
- Hue: 180
- Saturation: 79
- Value: 109

Then split it into two layers - one for lightening, and one for darkening, using
masks. The white mask should have opacity of 3.5%; the black should be 7%.
Export the two layers together to `textures/noise3.png`.


### Scaling Down

To scale it down to half HD, add `-s 960x540`, set `-b:v 5000k` and use a noise
texture with the same resolution.


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

