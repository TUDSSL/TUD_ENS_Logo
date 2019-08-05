# TU Delft ENS Group Logo Template

This is a official repository for [TU Delft Embedded Networked Systems Group](http://www.ens.ewi.tudelft.nl) logo, which you can see below.

![TU Delft ENS Logo](tud-ens-logo-color/tud-ens-logo-color-720p.png)

### How to use this template

Assuming you have LaTeX and [ImageMagick](https://imagemagick.org/) installed and any Unix-compatible system, simply type

```
./compile-all-tud-ens-logo.sh 
```

This will compile the whole set of logos hosted in the respective repositories.

### Structure of this repository

_Folders_:

- `tud-ens-logo-black`: Black and white version of the logo (in PDF, PS and PNG {in three sizes of 16:9 ratio})
- `tud-ens-logo-black-notext`: Black and white version of the logo, without "Embedded Networked Systems" text (in PDF, PS and PNG {in three sizes of 16:9 ratio})
- `tud-ens-logo-color`: Color version of the logo (in PDF, PS, PNG {in three sizes of 16:9 ratio} and animated GIF)
- `tud-ens-logo-color-notext`: Color version of the logo, without "Embedded Networked Systems" text (in PDF, PS, PNG {in three sizes of 16:9 ratio} and animated GIF)
- `tud-ens-logo-tikz`: source files of TU Delft ENS logo defined in TikZ

_Files_:

- `compile-all-tud-ens-logo.sh`: scrip to generate all logos automatically from a TikZ definition of a logo
- `README.md`: this file
- `LICENCE`: license file

### History

The logo was created by [Casper Dennis van Wezel](https://github.com/12casper3/). This repository is its cleaned and revised copy of its original repository.

### Copyright

Copyright (C) 2019 TU Delft Embedded and Networked Systems Group and Casper van Wezel.

MIT Licence. See [License](https://github.com/TUDSSL/TUD_ENS_MSc_Thesis_Template/blob/master/LICENSE) file for details.
