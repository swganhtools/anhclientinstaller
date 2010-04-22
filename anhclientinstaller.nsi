;SWG:ANH Client Installer 
;Copyright(c) 2010 The SWG:ANH Team

;--------------------------------
;Variables

Var StartMenuFolder
Var SWG_PATH
  
;--------------------------------
;Includes

!include "MUI2.nsh"
!include "LogicLib.nsh"
!include "includes\StrRep.nsh"
!include "includes\ReplaceInFile.nsh"
!include "includes\CheckSWG.nsh"
!include "includes\CheckTreFiles.nsh"
  
;--------------------------------
;General

;Name and file
Name "SWGANH Client"
OutFile "anhclient_setup.exe"
ShowInstDetails show
BrandingText " "
  
VIAddVersionKey "ProductName" "SWGANH Client"
VIAddVersionKey "CompanyName" "SWG:ANH"
VIAddVersionKey "LegalCopyright" "Copyright (c) 2010 SWG:ANH"
VIAddVersionKey "FileDescription" "Game client for SWG:ANH based servers."
VIAddVersionKey "FileVersion" "1.2.0.0"
VIProductVersion "1.2.0.0"

;Get installation folder from registry if available
InstallDir "$PROGRAMFILES\SWGANH Client"
InstallDirRegKey HKCU "Software\SWGANH Client" ""

;Request application privileges for Windows Vista/7
RequestExecutionLevel admin

;--------------------------------
;Functions
Function .onInit
  call CheckSWG
FunctionEnd

Function LaunchConfig
  SetOutPath "$INSTDIR"
  Exec "$INSTDIR\swganh_config.exe"
FunctionEnd

;--------------------------------
;Interface Settings

!define MUI_ABORTWARNING
  
!define MUI_ICON "misc\swganh.ico"
  
!define MUI_FINISHPAGE
!define MUI_FINISHPAGE_RUN
  !define MUI_FINISHPAGE_RUN_NOTCHECKED
  !define MUI_FINISHPAGE_RUN_TEXT "Start the SWG:ANH Client Configuration"
  !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchConfig"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\readme.txt"
  !define MUI_FINISHPAGE_SHOWREADME_TEXT "View Readme Document"
!define MUI_FINISHPAGE_LINK "SWG:ANH Community Website"
  !define MUI_FINISHPAGE_LINK_LOCATION "http://www.swganh.com/"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT

;--------------------------------
;Pages

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "misc\license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
  
;Start Menu Folder Page Configuration
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\SWGANH Client" 
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
  
!insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
  
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

!insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "SWGANH Game Client" SecClient
  SetOverwrite ifdiff
  SetOutPath $INSTDIR
  
  ;Download missing tre files
  Call CheckTreFiles
  
  ;Install the client files
  File /r client_files\*.*
  
  ${If} ${FileExists} "$INSTDIR\datatables\*.*"
	RMDir /r "$INSTDIR\datatables"  
  ${EndIf}
  
  ;Update the path to the SWG data directory
  !insertmacro ReplaceInFile "swg2uu_live.cfg" "!!SWG_PATH!!" "$SWG_PATH"
  Delete "swg2uu_live.cfg.old"
  
  ;Store installation folder
  WriteRegStr HKCU "Software\SWGANH Client" "" $INSTDIR

  ;Create uninstaller
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "DisplayName" "SWGANH Client"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "UninstallString" '"$INSTDIR\swganh\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "NoRepair" 1
  WriteUninstaller "$INSTDIR\uninstall.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
    CreateShortCut "$DESKTOP\SWGANH Client.lnk" "$INSTDIR\swganh.exe" "-- -s Station  subscriptionFeatures=1 gameFeatures=255"
  
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\SWGANH Client.lnk" "$INSTDIR\swganh.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Client.lnk" "$INSTDIR\swganh_config.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\README.lnk" "$INSTDIR\readme.txt"
    
  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

Section "Documentation" SecGuide

  SetOutPath "$INSTDIR"  
  
  ;Install the documentation
  File /r docs\*.*
  
  ;create shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    CreateShortCut "$DESKTOP\SWGANH - QA Guide.lnk" "$INSTDIR\SWGANH - QA Guide.chm" ""
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\docs\QA Guide.lnk" "$INSTDIR\SWGANH - QA Guide.chm"
  !insertmacro MUI_STARTMENU_WRITE_END
  
SectionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;Delete any desktop shortcuts that may still exist
  Delete "$DESKTOP\SWGANH Client.lnk"
  Delete "$DESKTOP\SWGANH - QA Guide.lnk"
 
  ;Delete the start menu items and the application installation directory
  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
 
  RMDir /r "$SMPROGRAMS\$StartMenuFolder"  
  RMDir /r "$INSTDIR"
  
  ;Clean up the registry
  DeleteRegKey /ifempty HKCU "Software\SWGANH Client"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client"

SectionEnd

;--------------------------------
;Page Descriptions

;Language strings
LangString DESC_SecClient ${LANG_ENGLISH} "The SWG:ANH Game Client is used to connect to SWG:ANH based servers."
LangString DESC_SecGuide ${LANG_ENGLISH} "The SWG:ANH Documentation feature provides useful information, tutorials and guides for testers."

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecClient} $(DESC_SecClient)
  !insertmacro MUI_DESCRIPTION_TEXT ${SecGuide} $(DESC_SecGuide)
!insertmacro MUI_FUNCTION_DESCRIPTION_END