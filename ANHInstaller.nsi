;NSIS Modern User Interface

!define MUI_PRODUCT "StarWarsGalaxies"
!define MUI_VERSION "1.0.0"

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !include "LogicLib.nsh"

;--------------------------------
;General

  ;Name and file
  Name "SWG:ANH Client"
  OutFile "anhclient_setup.exe"
  ShowInstDetails show
  BrandingText " "

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\SWGANH Client" ""

  ;Request application privileges for Windows Vista
  ;RequestExecutionLevel admin

;--------------------------------
;Variables

  Var StartMenuFolder
  
;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
  
  !define MUI_ICON "misc\swganh.ico"
  
  !define MUI_FINISHPAGE
  !define MUI_FINISHPAGE_RUN
    !define MUI_FINISHPAGE_RUN_NOTCHECKED
    !define MUI_FINISHPAGE_RUN_TEXT "Start the SWG:ANH Client"
    !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchClient"
  !define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\swganh\readme.txt"
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

Section "Game Client" SecClient
  SetOverwrite ifdiff
  SetOutPath $INSTDIR
  
  ;Download missing tre files
  Call DownloadTresIfMissing

  ;ADD YOUR OWN FILES HERE...
  SetOutPath $INSTDIR\swganh
  File /r /x .svn client_files\*.*

  ;Store installation folder
  WriteRegStr HKCU "Software\SWGANH Client" "" $INSTDIR

  ;Create uninstaller
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "DisplayName" "SWGANH Client"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "UninstallString" '"$INSTDIR\swganh\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "NoRepair" 1
  WriteUninstaller "$INSTDIR\swganh\uninstall.exe"
  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\uninstall.lnk" "$INSTDIR\swganh\uninstall.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\swganh.lnk" "$INSTDIR\swganh\swganh.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\docs\QA Guide.lnk" "$INSTDIR\swganh\SWGANH - QA Guide.chm"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\docs\readme.lnk" "$INSTDIR\swganh\readme.txt"
  
  
  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

Section "QA Guide" SecGuide

  SetOutPath "$INSTDIR\swganh"  
  File /r /x .svn docs\*.*
  
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecClient ${LANG_ENGLISH} "The SWG:ANH Game Client is used to connect to SWG:ANH servers."
  LangString DESC_SecGuide ${LANG_ENGLISH} "The SWG:ANH QA Guide provides useful information and tutorials for testers."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecClient} $(DESC_SecClient)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecGuide} $(DESC_SecGuide)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\swganh\uninstall.exe"

  RMDir "$INSTDIR"

  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
    
  Delete "$SMPROGRAMS\$StartMenuFolder\uninstall.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\swganh.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\docs\QA Guide.lnk"
  Delete "$SMPROGRAMS\$StartMenuFolder\docs\readme.lnk"
  RMDir "$SMPROGRAMS\$StartMenuFolder"
  
  DeleteRegKey /ifempty HKCU "Software\SWGANH Client"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client"

SectionEnd

;--------------------------------
;Download File If Missing 
Function DownloadFileIfMissing
	Exch $R0
	Exch
	Exch $R1
		
	IfFileExists $INSTDIR\$R0 _found _missing
	_missing:
		NSISdl::download http://patch.starwarsgalaxies.com:7040/patch/swg/$R1/$R0 $INSTDIR\$R0
		Pop $0 ;Get the return value
		StrCmp $0 "success" +3
			MessageBox MB_OK "Download $0"
			Quit	
	_found:
	Pop $R0
	Pop $R1
FunctionEnd

Function DownloadTresIfMissing
	Push "main" 
	Push "bottom.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "default_patch.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_music_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_other_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_animation_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_sample_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_sample_01.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_sample_02.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_sample_03.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_sample_04.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_skeletal_mesh_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_skeletal_mesh_01.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_00.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_01.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_02.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_03.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_04.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_05.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_06.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "data_sku1_07.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_static_mesh_00.tre"
	Call DownloadFileIfMissing
	
	Push "main" 
	Push "data_static_mesh_01.tre"
	Call DownloadFileIfMissing
	
	Push "main" 
	Push "data_texture_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_01.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_02.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_03.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_04.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_05.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_06.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "data_texture_07.tre"
	Call DownloadFileIfMissing  

	Push "main" 
	Push "patch_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_01.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_02.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_03.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_04.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_05.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_06.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_07.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_08.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_09.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_10.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_11_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_11_01.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_11_02.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_11_03.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_12_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_13_00.tre"
	Call DownloadFileIfMissing
  
	Push "main" 
	Push "patch_14_00.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "patch_sku1_12_00.tre"
	Call DownloadFileIfMissing
  
	Push "space" 
	Push "patch_sku1_13_00.tre"
	Call DownloadFileIfMissing
   
	Push "space" 
	Push "patch_sku1_14_00.tre"
	Call DownloadFileIfMissing
FunctionEnd

Var SWGDIR
;--------------------------------
;Installer Functions
Function .onInit
; Must set $INSTDIR here to avoid adding ${MUI_PRODUCT} to the end of the
; path when user selects a new directory using the 'Browse' button.
;
; First try and see if there is a valid installation of Star Wars Galaxies 
; set the default directory to that. If not fall back to Program Files\StarWarsGalaxies.
  ReadRegStr $SWGDIR HKCU "Software\Sony Online Entertainment\Installer\SWG" ""
  StrCmp $SWGDIR "" not_installed installed
  installed:
    StrCpy $INSTDIR "$SWGDIR"
    Goto +2
  not_installed:
    StrCpy $INSTDIR "$PROGRAMFILES\${MUI_PRODUCT}"
FunctionEnd

Function LaunchClient
  SetOutPath "$INSTDIR\swganh"
  Exec "$INSTDIR\swganh\swganh.exe"
FunctionEnd