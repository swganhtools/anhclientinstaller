
Function CheckSWG
  ##
  ## Check the version of SWG that's installed on the box
  Call CheckInstallCD
  StrLen $0 $SWG_PATH
  ${If} $0 != 0
    Return
  ${EndIf}

  Call CheckInstallStarterKit
  StrLen $0 $SWG_PATH
  ${If} $0 != 0
    Return
  ${EndIf}

  Call CheckInstallCDTTE
  StrLen $0 $SWG_PATH
  ${If} $0 != 0
    Return
  ${EndIf}

  Call CheckInstallCDCOA
  StrLen $0 $SWG_PATH
  ${If} $0 != 0
    Return
  ${EndIf}

  Call CheckInstallOnlineTrial
  StrLen $0 $SWG_PATH
  ${If} $0 != 0
    Return
  ${EndIf}
FunctionEnd

Function CheckInstallCD 
  ReadRegStr $SWG_PATH HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{88038160-9BcB-47BE-A5C3-5CE2DC115509}" 'InstallLocation'
FunctionEnd

Function CheckInstallStarterKit
  ReadRegStr $SWG_PATH HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{3E23D0ED-D985-472C-9140-A1C079865BA6}" 'InstallLocation'
FunctionEnd

Function CheckInstallOnlineTrial
  ReadRegStr $SWG_PATH HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Station Launcher" 'InstallLocation'
  
  StrLen $0 $SWG_PATH
  ${If} $0 == 0
    ReadRegStr $SWG_PATH HKCU "Software\Sony Online Entertainment\Installer\SWG" ""
  ${EndIf}
FunctionEnd

Function CheckInstallCDTTE
  ReadRegStr $SWG_PATH HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5B257C09-6A05-4308-9A6D-E8A2CAE21EA9}" 'InstallLocation'
FunctionEnd

Function CheckInstallCDCOA
  ReadRegStr $SWG_PATH HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{19F59AB5-B1F6-4276-A40B-09472318BCFF}" 'InstallLocation'
FunctionEnd

Function SWGInstallationDirectory
  StrLen $0 $SWG_PATH
  ${If} $0 != 0
	Return
  ${EndIf}

  !insertmacro MUI_HEADER_TEXT "Official SWG Directory Selection" "Choose the location of the official Star Wars Galaxies directory."

  nsDialogs::Create 1018
  
  ${NSD_CreateLabel} 0 0 100% 30u "An official Star Wars Galaxies installation is required to install SWGANH Client. To locate and select the StarWarsGalaxies directory, click Browse and navigate to the StarWarsGalaxies directory. Click Next to continue."
  	
  ${NSD_CreateGroupBox} 0 40u 100% 35u "Select Star Wars Galaxies Directory"
	
  ${NSD_CreateDirRequest} 15 55u 68% 12u ""
  Pop $SWG_PATH_STATE
    
		
  ${NSD_CreateBrowseButton} 75% 53u 20% 15u "Browse ..."
  Pop $Browse
  ${NSD_OnClick} $Browse OnDirBrowseButton
  
  nsDialogs::Show
FunctionEnd


Function SWGInstallationDirectoryValidate
  ${NSD_GetText} $SWG_PATH_STATE $SWG_PATH
  
  StrCmp "$SWG_PATH" "" 0 +3
  MessageBox MB_ICONINFORMATION|MB_OK "No Star Wars Galaxies path provided"
  Abort
  
  IfFileExists "$SWG_PATH\*.tre" +3 0
  MessageBox MB_ICONINFORMATION|MB_OK "The selected directory is not a valid Star Wars Galaxies directory. ($SWG_PATH)"
  Abort
FunctionEnd


Function OnDirBrowseButton
    Pop $R0

    ${If} $R0 == $Browse

        ${NSD_GetText} $SWG_PATH_STATE $R0

        nsDialogs::SelectFolderDialog /NOUNLOAD "" $R0
        Pop $R0

        ${If} $R0 != error
            ${NSD_SetText} $SWG_PATH_STATE "$R0"
        ${EndIf}
    ${EndIf}
FunctionEnd