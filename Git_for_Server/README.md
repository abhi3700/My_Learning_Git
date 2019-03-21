# Bonobo Git Server
## Installation
System - Windows 10

[Prerequisites](https://bonobogitserver.com/prerequisites/)
* Go to Control Panel - "Turn Windows Features On/Off"
* tick the "Internet Information Services" and Apply.
* Then, to install .NET Framework and ASP.NET support, follow this:
	- under "IIS -> World Wide Web Services -> Application Development Features"
	- Tick the followings and Apply.
		+ .NET Extensibility 4.7
		+ ASP.NET 4.7
		+ ISAPI Extensions
		+ ISAPI Filters
* Now, the prerequisites are installed.

[Bonobo Installation](https://bonobogitserver.com/install/)

**Follow the steps:**
* Extract the Zip folder to "C:\inetpub\wwwroot" directory.
* Set the permission (Modify, Write) for the App_Data folder inside Bonobo.Git.Server.
* Open IIS Manager. Goto "Right Click" on Bonobo.Git.Server and Convert to Application.
* Click on Authentication of Bonobo.Git.Server and enable Anonymous Authentication.

Images folder - 'Bonobo Installation images'