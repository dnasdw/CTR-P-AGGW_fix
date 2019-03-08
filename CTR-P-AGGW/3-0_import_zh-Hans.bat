PUSHD "%~dp0"
RD /S /Q build
MD build\cxi0\exefs
XCOPY cci\cxi0\exefs build\cxi0\exefs /S /Y
MD build\cxi0\romfs
XCOPY cci\cxi0\romfs build\cxi0\romfs /S /Y
tools\3dstool --lock -vf build\cxi0\exefs\code.bin --region CHN --language CN || PAUSE
COPY build\cxi0\exefs\banner\banner14\NEWLOGO_CNversion_darkmoon.png build\cxi0\exefs\banner\banner0\NEWLOGO_CNversion_darkmoon.png
COPY build\cxi0\exefs\banner\banner14\NEWLOGO_CNversion_darkmoon.png build\cxi0\exefs\banner\banner16\NEWLOGO_CNversion_darkmoon.png
FOR /R build\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -ivfd "%%~I" "%%~dpnI" || PAUSE)
POPD
