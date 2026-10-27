



echo off
echo uer: %username%
whoami
pause


cd c:\cron

SET python_exe=C:\Users\Administrator\AppData\Local\Programs\Python\Python312\python.exe
SET client_id="xvwzfue1htttbgs"
SET client_secret="fgzwrh3bofpvuih"
SET refresh_token="okuXVFmVVvIAAAAAAAAAAaop-DKbqjm09g9X3WNXl9lAS17ARs7jtA2l-G9DQ9JZ"
SET dropbox_path="/Parser/CSV_FilesToProcess"
SET local_path="C:/ziel_files/csv_files"
REM SET csv_folder
REM SET output_folder_temppdf
REM SET host
REM SET user
REM SET database 
REM SET excel_template
REM SET output_folder_tempchart

cd c:\py

%python_exe% 10_ExitCmd.py
  %python_exe% 1_copy_from_dropbox.py ^
  	--client_id %client_id% ^
  	--client_secret %client_secret% ^
  	--refresh_token %refresh_token% ^
  	--dropbox_path %dropbox_path% ^
  	--local_path %local_path%

%python_exe% 10_ExitCmd.py

cd c:\cron

pause