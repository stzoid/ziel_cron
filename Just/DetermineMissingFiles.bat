setlocal enabledelayedexpansion

:: Set your two folders here
set "folder1=C:\A5Webroot\ziel\csv_processed_files\csv_files"
set "folder2=C:\A5Webroot\ziel\csv_processed_files\temp_chart_pdf"

:: Temporary files
set "temp1=%temp%\folder1_files.txt"
set "temp2=%temp%\folder2_files.txt"
set "diff_file=%temp%\diff_files.txt"

:: Ensure temp files are empty
if exist "%temp1%" del "%temp1%"
if exist "%temp2%" del "%temp2%"
if exist "%diff_file%" del "%diff_file%"

:: Gather file base names from folder1
for /r "%folder1%" %%F in (*) do (
    set "name=%%~nF"
    echo !name! >> "%temp1%"
)

:: Gather file base names from folder2
for /r "%folder2%" %%F in (*) do (
    set "name=%%~nF"
    echo !name! >> "%temp2%"
)

:: Sort and remove duplicates
sort "%temp1%" /o "%temp1%"
sort "%temp2%" /o "%temp2%"

:: Compare and find missing files
findstr /v /i /g:"%temp2%" "%temp1%" > "%diff_file%"

:: Display results
echo Files in %folder1% not found in %folder2%:
type "%diff_file%"

:: Cleanup
del "%temp1%"
del "%temp2%"

endlocal
pause

