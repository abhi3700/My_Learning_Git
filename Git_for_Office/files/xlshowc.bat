@echo off
echo NOTE: This program is valid only for EXCEL, WORD files
echo,
rem ___________________________________________________
rem The program is for showing Excel file on a particular commit
rem ___________________________________________________
set /p commit1= Enter commit (e.g. ee3442f): 
set /p file= Enter Filename (e.g. Book1.xlsx, Book1.docx): 

rem extract the extension from file param above
for %%i in ("%file%") do (
	set fileextension=%%~xi
)

if "%fileextension%"==".xls" goto :excel
if "%fileextension%"==".xlm" goto :excel
if "%fileextension%"==".xlsx" goto :excel
if "%fileextension%"==".xlsm" goto :excel
if "%fileextension%"==".doc" goto :word
if "%fileextension%"==".docx" goto :word
if "%fileextension%"==".docm" goto :word


rem ------------------------EXCEL----------------------------------------------
:excel
if exist %file% (
	rem Git Command for saving the excel file as temmporary excel file
	git show %commit1%:%file% > temp_%commit1%_%file%

	rem Open tempfile using MS Excel
	excel temp_%commit1%_%file%

	rem Delete tempfile after closing Excel Application
	del temp_%commit1%_%file%

) else (
	msg * "Sorry! The File does not exist!"
)
exit

rem -------------------------WORD-----------------------------------------------
:word
if exist %file% (
	rem Git Command for saving the excel file as temmporary excel file
	git show %commit1%:%file% > temp_%commit1%_%file%

	rem Open tempfile using MS Excel
	winword temp_%commit1%_%file%

	rem Delete tempfile after closing Excel Application
	del temp_%commit1%_%file%

) else (
	msg * "Sorry! The File does not exist!"
)
exit


