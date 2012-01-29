# PdfLaTeX Inline Image
Usually images are included by using `\includegraphics{...}`. To ease the sharing of LaTeX documents, inline embedding of images has been developed.
You no longer have to make an archive (e.g. ZIP or TAR) of all your files. You just integrate all your images in your .tex file.

## Usage
### LaTeX
The following statement shows the usage of this program:
    
    \usepackage{pdfinlimg}
    % ...
    \begin{document}
    % ...
    \pdfinlimg{5}{8}{200}{320}{EEAA13FA5EF2DF1F...3A516A97A}
    % ...
    \end{document}

#### Arguments ####

1. image width (cm)
2. image height (cm)
3. image width (px)
4. image height (px)
5. data (hex, RGB, 1 byte per component, DEFLATE)

### Image Converter

    ./pdfinlimg.pl hello.jpg

The image converter does read JPG and PNG files and produces a LaTeX statement which can be embedded in your document.

## Issues
Any help to solve the following issues would be appreciated.

* The image sometimes does not absolutely cover the underlaying framebox.
* A scaling value (currently 0.885) has been calculated using trial-and-error. Where does this value come from?

## References
* [Adobe PDF Reference](http://partners.adobe.com/public/developer/en/pdf/PDFReference.pdf)

