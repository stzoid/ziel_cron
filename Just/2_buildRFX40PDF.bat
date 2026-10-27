cd c:\cron

SET batch_id = 5

SET python_exe=python
SET client_id="xvwzfue1htttbgs"
SET client_secret="fgzwrh3bofpvuih"
SET refresh_token="okuXVFmVVvIAAAAAAAAAAaop-DKbqjm09g9X3WNXl9lAS17ARs7jtA2l-G9DQ9JZ"
SET dropbox_path="/Parser/CSV_FilesToProcess"
SET local_path="C:/ziel_files/csv_files"
SET batch_id=123
REM SET csv_folder
REM SET output_folder_temppdf
REM SET host
REM SET user
REM SET database 
REM SET excel_template
REM SET output_folder_tempchart

cd c:\py

REM C:/ziel_files/csv_files/Parser/CSV_FilesToProcess
REM C:/A5Webroot/ziel/csv_processed_files/csv

%python_exe% 10_ExitCmd.py
%python_exe% 2_buildRFX40PDF.py ^
	--csv_folder "C:/ziel_files/csv_files/Parser/CSV_FilesToProcess" ^
	--output_folder "C:/A5Webroot/ziel/csv_processed_files/chart_rfx40" ^
	--host 127.0.0.1 ^
	--user ziel_user ^
	--password Wilk9xrm# ^
	--database ziel ^
	--batch_id %batch_id%

cd c:\cron

pause