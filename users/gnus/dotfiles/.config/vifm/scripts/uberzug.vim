fileviewer *.pdf
        \ vifmimg pdfpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.epub
        \ vifmimg epubpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
        \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
        \ vifmimg videopreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.bmp,*.jpg,*.jpeg,*.png,*.xpm
        \ vifmimg draw %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.gif
        \ vifmimg gifpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.ico
        \ vifmimg magickpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear
