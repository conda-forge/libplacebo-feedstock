@echo on

set "PKG_CONFIG_PATH=%LIBRARY_PREFIX%\lib\pkgconfig;%PKG_CONFIG_PATH%"
set "PKG_CONFIG=%BUILD_PREFIX%\Library\bin\pkg-config.exe"
if not exist "%PKG_CONFIG%" set "PKG_CONFIG=%BUILD_PREFIX%\bin\pkg-config.exe"

meson setup build ^
    -Dopengl=disabled ^
    -Ddemos=false ^
    -Dbench=false ^
    -Dtests=false ^
    -Dvulkan=enabled ^
    -Dshaderc=enabled ^
    -Dlcms=enabled ^
    -Ddovi=enabled ^
    -Dxxhash=enabled ^
    -Dvk-proc-addr=enabled ^
    %MESON_ARGS%
if errorlevel 1 exit /b 1

meson compile -C build --verbose
if errorlevel 1 exit /b 1

meson install -C build
if errorlevel 1 exit /b 1
