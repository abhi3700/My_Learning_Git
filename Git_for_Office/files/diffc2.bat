@echo off
echo Only valid for EXCEL, WORD files
echo,
rem ___________________________________________________
rem The program is for Compare Excel file on a 2 commits
rem ___________________________________________________
set /p commit1= Enter commit 1 (e.g. ee3442f): 
set /p commit2= Enter commit 2 (e.g. de5b688): 
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

	rem Git Command for saving the excel file as temmporary excel file
	git show %commit2%:%file% > temp_%commit2%_%file%

	rem give the paths of - "temp_commit_Book1.xlsx" & "Book1.xlsx" into "tmp.txt"
	dir temp_%commit1%_%file% temp_%commit2%_%file% /b /s > tmp.txt

	rem Open tempfile - "tmp.txt" using Spreadsheetcompare
	spreadsheetcompare tmp.txt

	rem Delete tempfiles after closing Excel Application
	del temp_%commit1%_%file%
	del temp_%commit2%_%file%
	del tmp.txt

) else (
	msg * "Sorry! The File does not exist!"
)
exit

rem -------------------------WORD-----------------------------------------------
:word
if exist %file% (
	rem Git Command for saving the excel file as temmporary excel file
	git show %commit1%:%file% > temp_%commit1%_%file%

	rem Git Command for saving the excel file as temmporary excel file
	git show %commit2%:%file% > temp_%commit2%_%file%

	rem Open "tempfile" & "original file" using MS Word
	winword temp_%commit1%_%file% temp_%commit2%_%file%

	rem Delete tempfile after closing Excel Application
	del temp_%commit1%_%file%
	del temp_%commit2%_%file%

) else (
	msg * "Sorry! The File does not exist!"
)
exit