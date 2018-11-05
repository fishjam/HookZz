rem set ANDROID_NDK point to /path/to/ndk-bundle, so can found android.toolchain.cmake

mkdir build
cd build

cmake .. ^
-G "Unix Makefiles" ^
-DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK%\build\cmake\android.toolchain.cmake ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK%\prebuilt\windows-x86_64\bin\make.exe" ^
-DANDROID_NDK=%ANDROID_NDK% ^
-DCMAKE_BUILD_TYPE=Release ^
-DANDROID_ABI=armeabi-v7a ^
-DSHARED=ON ^
-DANDROID_NATIVE_API_LEVEL=14 ^
-DPLATFORM=Android ^
-DARCH=armv7 ^
-DCMAKE_VERBOSE_MAKEFILE=ON

If not %ERRORLEVEL% EQU 0 goto ERROR

cmake --build .

rem cmake --build . --target install

cd ..

goto DONE

:ERROR
echo "error" 

:DONE
