setlocal enabledelayedexpansion

:: Set your two folders here
set "folder1=C:\A5Webroot\ziel\csv_processed_files\csv_files"
set "folder2=C:\A5Webroot\ziel\csv_processed_files\temp_chart_pdf"
set "folder3=C:\A5Webroot\ziel\csv_processed_files\extended_chart_pdf"

:: Temporary files
set "temp1=%temp%\folder1_files.txt"
set "temp2=%temp%\folder2_files.txt"
set "temp3=%temp%\folder3_files.txt"
set "diff_file2=%temp%\diff_files2.txt"
set "diff_file3=%temp%\diff_files3.txt"

:: Ensure temp files are empty
if exist "%temp1%" del "%temp1%"
if exist "%temp2%" del "%temp2%"
if exist "%temp3%" del "%temp3%"

if exist "%diff_file2%" del "%diff_file2%"
if exist "%diff_file3%" del "%diff_file3%"

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

:: Gather file base names from folder3
for /r "%folder3%" %%F in (*) do (
    set "name=%%~nF"
    echo !name! >> "%temp3%"
)

:: Sort and remove duplicates
sort "%temp1%" /o "%temp1%"
sort "%temp2%" /o "%temp2%"
sort "%temp3%" /o "%temp3%"

:: Compare and find missing files
findstr /v /i /g:"%temp2%" "%temp1%" > "%diff_file2%"
findstr /v /i /g:"%temp3%" "%temp1%" > "%diff_file3%"

:: Display results
echo Files in %folder1% not found in %folder2%:
copy "%diff_file2%" c:\a5\missing_from_temp_chart.txt

echo Files in %folder1% not found in %folder3%:
copy "%diff_file3%" c:\a5\missing_from_extended_temp_chart.txt

:: Cleanup
del "%temp1%"
del "%temp2%"
del "%temp3%"

endlocal
pause