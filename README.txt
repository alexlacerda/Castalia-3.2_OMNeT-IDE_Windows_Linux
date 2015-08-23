*****************************************************************
*  CASTALIA-3.2 PORT TO OMNeT++ v.4 IDE ON WINDOWS AND LINUX    *
*  Installation Instructions                                    * 
*  Author(s): Alex Lacerda, Marcella Pinheiro                   *
*  Contact: help.lares@gmail.com                                *
*                                                               * 
*****************************************************************

===============================================================================
This package adapts Castalia-3.2 to the OMNeT++ 4.x IDE on both Windows and
Linux. It also allows running Castalia simulations from the command prompt on
Windows.
===============================================================================

INSTALLATION Instructions
-------------------------

Detailed instructions are provided in the INSTALLATION GUIDE, InstallGuide.pdf.

If you are an expert user and want to start quickly without reading the Install 
Guide, follow the steps below: 

1. Install OMNeT++ according to OMNeT's installation guide.
 
2. Download Castalia-3.2.tar.gz at https://forge.nicta.com.au/frs/?group_id=301

3. Extract Castalia-3.2 folder.

4. Add Castalia-3.2/bin directory to the path environment variable.

5. Execute updateCastalia.sh script from the command line as follows:
   - on Linux, change to CastaliaPortToOmnetppWindowsLinux directory and type:
      $ ./updateCastalia.sh
   - on Windows:
      - start mingwenv.cmd in your omnetpp-4.x directory.
      - change to CastaliaPortToOmnetppWindowsLinux directory and type:
         $ ./updateCastalia.sh

Installation successfully completed! Now you should be able to import Castalia
to OMNeT++ IDE or execute it from the command line (if you want to use 
Castalia, CastaliaResults and CastaliaPlot scripts).
					
To import Castalia-3.2 to OMNeT++ IDE:
   - Open OMNeT++ IDE.
   - Click on File > Import > General > Existing Projects into Workspace.
   - Click the Browse button and select the Castalia-3.2 folder. Click Finish. 
   - Now you can build and run Castalia simulations from the IDE.
   - Be aware that the IDE does not generates results files (the files in
     the form YYMMDD-HHMMSS.txt). The IDE only generates the simulation trace,
	 which is redirected to the console of the IDE.
   - If you want to use the functionalities of CastaliaResults and CastaliaPlot
     scripts, you will have to use the command prompt.
   - We recommend you use the IDE to implement and test your simulations and,
     whenever you need to handle the results, you can use the command prompt.
		
To build Castalia-3.2 from the command line: 
   - Open a terminal (or mingwenv.cmd, if you are on Windows)
   - Change to Castalia-3.2 directory and type: 
      $ ./makemake
      $ make
   - Now you can run simulations as described in the Castalia User's Manual
