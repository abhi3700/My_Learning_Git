# Git for Excel
## Installation
System - Windows 10

**Follow the Steps:**
* Create `xldiff.bat`

	`git diff` passes seven arguments: `path`, `old-file`, `old-hex`, `old-mode`, `new-file`, `new-hex`, `new-mode`
	```console
	@ECHO OFF

	ECHO %2 > tmp.txt
	dir %5 /B /S >> tmp.txt

	"C:\Program Files (x86)\Microsoft Office\Office15\DCF\SPREADSHEETCOMPARE" tmp.txt
	```
* Edit `.gitattributes` - to tell Git when to use our new custom Excel differ “excel”. 
	```console
	*.xls* diff=excel
	```
	Here, we instruct Git to use the “excel” differ for any file names matching the *.xls* pattern (feel free to refine the wildcard pattern).
* Edit `.gitignore` - to ignore the opened Excel files (starting with `~`)
	```console
	~$*
	```
* Lastly, the config file of the repo (./.git/config)
	
	Edit this to:
	```console
	[diff "excel"]
    command = F:/Developer/xldiff.bat
	```
	NOTE: It is recommended to save the xldiff.bat file into a Developer folder in a chosen Drive.

## Demo
* Create a git repo.
* copy the 2 files - `.gitignore`, `.gitattributes` inside your repo.
* Ensure `xldiff.bat` file inside your chosen **Developer** folder. E.g. "F:/Developer/"
* Create an Excel file and `stage -> commit -> push`.
* Now modify the Excel file.
* Check status - `git status`. It will show that the Excel file has been modified.
* Check the difference - `git diff <excel-file-name.ext>`
	> NOTE: the modified file should not be pushed by now.

