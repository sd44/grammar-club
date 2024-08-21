# vim: set ft=perl:

## Latexmk configuration file.

# Use LuaLaTeX to compile.
$pdf_mode = 5; # 5为xelatex
$xelatex = "xelatex -file-line-error -halt-on-error -shell-escape -no-pdf -synctex=1 %O %S"; 
$postscript_mode = $dvi_mode = 0;

$clean_ext = 'thm glo gls bbl hd loe synctex.gz xdv run.xml inx idx ilg tdo aux bbl bbl-SAVE-ERROR bcf bcf-SAVE-ERROR blg log fdb_latexmk fls toc rel lof lot bak';


# $makeindex = 'zhmakeindex -s %S.ist %O -o %D %S'; # 注意：Hardcode，每个[name].idx文件匹配一个[name].idx.ist的style文件。

$pdf_previewer = 'okular %O %S';
#$preview_continuous_mode = 1; # equivalent to -pvc 

$preview_mode = 1; # equivalent to -pv 

