# Tiny Marketing

This is a place to store data for short-lived and small marketing projects.
We're talking 10 files and 10MB of data, or something in that range. Maybe a
little more, maybe a lot less. See [Acceptable Content](#acceptable-content),
below.

This is not the place to store long-running or complex projects. If you have
such a project, please create a new repository.


## Checking Out and Branching

Clone the repository the usual way, and then switch to the branch you want to
use.

```bash
git clone git@github.com:vpac-innovations/tiny-marketing.git
git checkout grandprix2014
```

If you are starting a new short project, consider creating a new branch to
store your content. In general, the `master` branch should not be touched. For
example, branches might be related like so:

```
── master
   ├── showcase2011
   ├── grandprix2013
   └── grandprix2014
       └── manufacturing2014
```

```bash
git checkout grandprix2014
git checkout -b manufacturing2014
```

In the above example, `manufacturing2014` is a new branch that builds on the
work done for the Grand Prix in the same year. The branches would then look like
this:

```
── master
   ├── showcase2011
   ├── grandprix2013
   └── grandprix2014
       └── manufacturing2014
```

You could even merge two older branches into a new one if that makes sense.


## Acceptable Content

The golden rule here is to keep everything small. In general, that means you
should store exactly what is needed to generate the final product.

- Store *source* files such as `.blend`, `.svg` and `.ai`.
- Generated data such as images and movies should be stored elsewhere - unless
  they are small and form part of the source.
- Use *uncompressed* files. This may seem counter-intuitive - but git works much
  better with uncompressed data. Similar data will be compressed across the
  repository automatically by git, thus minimising the download size.
