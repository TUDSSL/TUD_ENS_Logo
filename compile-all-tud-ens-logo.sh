#!/bin/bash

# TU Delft Embedded Networked Systems Group Logo: stand-alone latex source (part a: .tex file).

# MIT License
#
# Copyright (c) 2019 TU Delft Embedded and Networked Systems Group and Casper van Wezel.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# This scrip generates versions of TU Delft Embedded Networked and Systems Group Logo
# Created by Casper Dennis van Wezel and revised by Przemyslaw Pawelczak

# Order of exporting different logo versions:
# Color version (complete logo in color and "Embedded Networked Systems" text) - tud-ens-logo-color
# Black version (complete logo in black and white and "Embedded Networked Systems" text) - tud-ens-logo-black
# Color no text version (logo only in color without "Embedded Networked Systems") - tud-ens-logo-color-notext
# Black no text version (logo only in black and white without "Embedded Networked Systems") - tud-ens-logo-black-notext
# Resized PDF logo versions in PNG format (16:9 ratio) for three pixel heights: `2160p` and `1080` and `720p` 
# Animated GIF version of `tud-ens-logo-color` and `tud-ens-logo-color-notext` 

# Create all versions of ENS logo in PDF format
pdflatex -jobname=tud-ens-logo-color "\input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=tud-ens-logo-black "\def\logowificolor{0} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=tud-ens-logo-color-notext "\def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=tud-ens-logo-black-notext "\def\logowificolor{0} \def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"

# Create all versions of ENS logo in PS format
latex -jobname=tud-ens-logo-color "\input{tud-ens-logo-tikz/tud-ens-logo.tex}" && dvips -E tud-ens-logo-color &
latex -jobname=tud-ens-logo-black "\def\logowificolor{0} \input{tud-ens-logo-tikz/tud-ens-logo.tex}" && dvips -E tud-ens-logo-black &
latex -jobname=tud-ens-logo-color-notext "\def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}" && dvips -E tud-ens-logo-color-notext &
latex -jobname=tud-ens-logo-black-notext "\def\logowificolor{0} \def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}" && dvips -E tud-ens-logo-black-notext &

# Created resized PNG formats of all logo versions (converted from PDF)
declare -a files=("tud-ens-logo-color" "tud-ens-logo-black" "tud-ens-logo-color-notext" "tud-ens-logo-black-notext")
declare -a widths=("3840" "1920" "1280")
declare -a heigths=("2160p" "1080p" "720p")

arraylength=${#widths[@]}

for (( i=0; i<${arraylength}; i++ ));
do
    echo $i " / " ${arraylength} " : " ${heigths[$i]}" =" ${widths[$i]}
    for f in "${files[@]}"
    do
        echo "$f"
        convert -density 300 $f.pdf -quality 90 -resize ${widths[$i]} ${f}-${heigths[$i]}.png &
    done
done

# Create animated version of ENS logo (animation of a wave in a chip logo) in GIF format and move it to respective folder
pdflatex -jobname=logo-tmp-0 "\def\logowificolor{0} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=logo-tmp-1 "\def\logowificolor{1} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=logo-tmp-2 "\def\logowificolor{2} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=logo-tmp-3 "\def\logowificolor{3} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
convert -verbose -delay 50 -loop 0 -density 300 -alpha remove logo-tmp-*.pdf tud-ens-logo-color-animated.gif &

# Create animated version of ENS logo without text (animation of a wave in a chip logo) in GIF format and move it to respective folder
pdflatex -jobname=logo-tmp-nt-0 "\def\logowificolor{0} \def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=logo-tmp-nt-1 "\def\logowificolor{1} \def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=logo-tmp-nt-2 "\def\logowificolor{2} \def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
pdflatex -jobname=logo-tmp-nt-3 "\def\logowificolor{3} \def\notextlogo{} \input{tud-ens-logo-tikz/tud-ens-logo.tex}"
convert -verbose -delay 50 -loop 0 -density 300 -alpha remove logo-tmp-nt-*.pdf tud-ens-logo-color-notext-animated.gif &

# Wait to finish the conversion process and clean up all unusable outputs
echo "Waiting to finish TU Delft ENS logo conversions"
wait
rm -f *.aux
rm -f *.log
rm -f *.dvi
rm -f logo-tmp-*
echo "Clean up of all unused outputs finished"

# Move all files to respective folders
mv tud-ens-logo-color-notext.* tud-ens-logo-color-notext-* tud-ens-logo-color-notext
mv tud-ens-logo-black-notext.* tud-ens-logo-black-notext-* tud-ens-logo-black-notext
mv tud-ens-logo-color.* tud-ens-logo-color-[0-9]* tud-ens-logo-color
mv tud-ens-logo-black.* tud-ens-logo-black-[0-9]* tud-ens-logo-black
mv tud-ens-logo-color-animated.gif tud-ens-logo-color
mv tud-ens-logo-color-notext-animated.gif tud-ens-logo-color-notext
