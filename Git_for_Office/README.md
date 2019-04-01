# Git for Excel
> NOTE: Only applicable for file type - `*.xls*`(any file extension starting with **xls**) 

## Installation
System - Windows 10

### Tools
#### Spreadsheetcompare - available in MS Office 2013 Professional Plus
#### [Git Xltrail](https://www.xltrail.com/client)
#### PATHS
	- spreadsheetcompare
	- excel
	- git-xltrail
	- developer folder

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
>	NOTE: It is recommended to save the xldiff.bat file into a Developer folder in a chosen Drive.


## Demo
* Create a git repo.
* copy the 2 files - `.gitignore`, `.gitattributes` inside your repo.
* Ensure `xldiff.bat` file inside your chosen **Developer** folder. E.g. "F:/Developer/"
* Create an Excel file and `stage -> commit -> push`.
* Now modify the Excel file.
* Check status - `git status`. It will show that the Excel file has been modified.
* Check the difference - `git diff <excel-file-name.ext>`
	> NOTE: the modified file should not be pushed by now.

## Commands
* ### Diff
	- Difference b/w a commit and latest - Run `xldiffc1.bat` file  
		+ `$ git diff f59835d:Book1.xlsx Book1.xlsx` - shows the difference b/w `Book1.xlsx @ f59835d` and `Book1.xlsx @ latest`
	- Difference b/w 2 commits - Run `xldiffc2.bat` file #todo 
		+ save a 2 copies using `git show <commit>:<file-name> > <local-file-copy>`
		+ write the directories of the 2 files in `tmp.txt`
		+ and then execute `spreadsheetcompare tmp.txt`
	- Difference By date #todo - On same date, there could be multiple changes on a file, so going by date is little skeptical.
* ### Show
	- View a file by Commit - Run `xlshowc.bat` file 
		+ Non-binary files: `git show 1f6098c:README.md > temp_1f6098c_README.md` To view, use Git Clients - __FORK__, __Sublime Merge__.
		+ Binary files: `git show 1f6098c:Book1.xlsx > temp_1f6098c_Book1.xlsx` >> `excel temp_1f6098c_Book1.xlsx`. It is recommended to create a batch/bash script (#todo) file in order to implement this 2 successive commands. To view, use System Application Viewer - MS Excel, MS Word. 
	- View a file by Date - Run `xlshowc.bat` file #todo
	> NOTE: If a file is modified multiple times on a single date, then the last modified content will be shown.
		+ save a copy using `git show <commit>:<file-name> > <local-file-copy>`
		+ `excel <local-file-copy-file>`
