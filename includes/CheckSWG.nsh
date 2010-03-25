
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

  MessageBox MB_OK "No valid Star Wars Galaxies installation found, please install a purchased copy of the game before running this installer again."
  Quit
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