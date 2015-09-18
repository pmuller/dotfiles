REM Download the cygwin installer from https://cygwin.com/setup-x86_64.exe

set PLATFORM=x86_64
set MIRROR=http://mirror.switch.ch/ftp/mirror/cygwin/
set ROOT=c:\cygwin
set EXE=setup-%PLATFORM%.exe
set COMMAND=%EXE% ^
    --quiet-mode ^
    --site %MIRROR% ^
    --no-shortcuts ^
    --root %ROOT% ^
    --local-package-dir %ROOT%\packages
set PACKAGES=autobuild,autoconf,autoconf2.1,autoconf2.5,autogen,automake,^
automake1.10,automake1.11,automake1.12,automake1.13,automake1.14,^
automake1.15,automake1.4,automake1.5,automake1.6,automake1.7,automake1.8,^
automake1.9,base-cygwin,base-files,bash,bash-completion,binutils,bzip2,^
ca-certificates,cfv,coreutils,crypt,csih,curl,cygrunsrv,cygutils,cygwin,^
cygwin-devel,dash,dbus,dbus-x11,ddd,desktop-file-utils,diffutils,dos2unix,^
doxygen,dri-drivers,editrights,file,findutils,font-adobe-dpi100,^
font-adobe-dpi75,font-alias,font-bh-lucidatypewriter-dpi75,font-misc-misc,^
gamin,gawk,gdb,gdk-pixbuf2.0-svg,getent,git,git-completion,git-gui,gitk,^
gnupg,grep,groff,gvim,gzip,hicolor-icon-theme,hostname,indent,inetutils,^
inetutils-server,info,ipc-utils,ipcalc,irssi,less,lftp,links,login,lrzip,^
m4,make,man-db,mcpp,mintty,nc,net-snmp,^
net-snmp-gui,net-snmp-libs,net-snmp-python,net-snmp-utils,openssh,openssl,^
patch,pax,perl,ping,popt,procps,psmisc,pwgen,python,python-chardet,^
python-setuptools,python-simplejson,python-six,python-urllib3,python3,^
python3-setuptools,rebase,rgb,rsync,run,screen,sed,setxkbmap,shutdown,^
socat,stow,stunnel,tar,tcl,tcl-tk,tcsh,terminfo,texinfo,tftp,tftp-server,^
time,tmux,tree,ttcp,tzcode,unace,unzip,util-linux,vim,vim-common,^
vim-minimal,wget,which,whois,xauth,xhost,xinit,xkbcomp,xkbutils,^
xkeyboard-config,xmodmap,xorg-scripts,xorg-server,xorg-server-common,^
xorg-x11-fonts-dpi100,xorg-x11-fonts-dpi75,xorg-x11-fonts-ethiopic,^
xorg-x11-fonts-misc,xorg-x11-fonts-Type1,xrdb,xset,xterm,xxd,xz,zip,zsh,^
mingw64-x86_64-binutils,mingw64-x86_64-bzip2,mingw64-x86_64-gcc,^
mingw64-x86_64-headers,mingw64-x86_64-hidapi,mingw64-x86_64-libgcrypt,^
mingw64-x86_64-libgpg,mingw64-x86_64-minizip,mingw64-x86_64-pkg,^
mingw64-x86_64-pthreads,mingw64-x86_64-runtime,mingw64-x86_64-windows,^
mingw64-x86_64-winpthreads,mingw64-x86_64-xz,mingw64-x86_64-zlib,^
mingw64-x86_64-gcc-core,mingw64-x86_64-gcc-g++

%COMMAND% --packages %PACKAGES%
copy %EXE% %ROOT%\bin\cygsetup.exe /y
