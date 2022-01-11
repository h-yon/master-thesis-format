#!/usr/bin/env perl
$pdf_mode = 3;
$latex = 'uplatex -synctex=1 -interaction=nonstopmode %O %S';
$dvipdf = 'dvipdfmx -V 7 %O -o %D %S';
$bibtex = 'upbibtex %O %B';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';
$makeindex = 'upmendex %O -o %D %S';
$max_repeat = 5;

$out_dir = 'build';

$pdf_update_method = 4;
$pvc_view_file_via_temporary = 0;

# mac
$pdf_previewer = 'open -ga Preview';
$pdf_update_command = 'open -a Preview';# プレビューで他のファイル開いてると変なことになるので注意
# skimのほうが便利だけどcatalinaだとこれで更新できなくなった気がする→$pdf_update_command = 'open -ga Skim';

# windows
# Use SumatraPDF and atom inverse search
# 下のatomのパスなどは絶対パスに書き換えないとinverse searchが動かないかも
# $pdf_previewer = '"C:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance -inverse-search "\"%USERPROFILE%/AppData/Local/atom/bin/atom.cmd\" \"%f:%l\"" %O %S';

# if you do not need to preview in -pvc option (preview document and countinuously update mode)
# $pdf_previewer = 'exit';

# $success_cmd = 'qpdf --linearize ./build/main.pdf "$HOME/Desktop/`whoami`_`date \"+%F\"`.pdf"';# qpdfはパスワード保護解除とかもできて便利なので紹介がてら
