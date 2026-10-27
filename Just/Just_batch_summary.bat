cd c:\cron

SET python_exe=python
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
%python_exe% 4_BuildBatchSummary.py ^
	--host 127.0.0.1 ^
	--user ziel_user ^
	--password Wilk9xrm# ^
	--database ziel ^
	--folder_path "C:/ziel_files/csv_files/Parser/CSV_FilesToProcess"

%python_exe% 10_ExitCmd.py

cd c:\cron

PAUSE