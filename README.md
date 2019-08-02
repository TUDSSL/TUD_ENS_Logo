# TU Delft ENS Group MSc Thesis Template

This is a official repository for [TU Delft Embedded Networked Systems Group](http://www.ens.ewi.tudelft.nl) MSc Thesis Template.

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

- `compile-all-tud-ens-logo.sh `: scrip to generate all logos automatically from a TikZ definition of a logo

### History

This template is an adapted LaTeX thesis template of the old TU Delft Embedded Systems Group (see example [here](https://repository.tudelft.nl/islandora/object/uuid%3A6d5a3afd-1966-4357-b063-7a82c0fdb0ab)). That template was again adapted from the MSc thesi template of the [Parallel (and then Distributed) Systems group](https://www.tudelft.nl/ewi/over-de-faculteit/afdelingen/software-technology/distributed-systems/) at TU Delft.

### Copyright

Copyright (C) 2019 TU Delft Embedded and Networked Systems Group.

MIT Licence. See [License](https://github.com/TUDSSL/TUD_ENS_MSc_Thesis_Template/blob/master/LICENSE) file for details.
