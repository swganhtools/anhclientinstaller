;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"
  !include "LogicLib.nsh"

;--------------------------------
;General

  ;Name and file
  Name "SWG:ANH Client"
  OutFile "ANHClientInstaller.exe"
  ShowInstDetails show

  ;Default installation folder
  InstallDir "$PROGRAMFILES\StarWarsGalaxies"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\SWGANH Client" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
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

  ;ADD YOUR OWN FILES HERE...
  Call DownloadTresIfMissing
  
  File /r /x *.chm Files\*.*
  
  ;Store installation folder
  WriteRegStr HKCU "Software\SWGANH Client" "" $INSTDIR

  ;Create uninstaller
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "DisplayName" "SWGANH Client"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "UninstallString" '"$INSTDIR\swganh\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client" "NoRepair" 1
  WriteUninstaller "$INSTDIR\swganh\uninstall.exe"

SectionEnd

Section "QA Guide" SecGuide

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  
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

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\SWGANH Client"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client"

SectionEnd

;--------------------------------
;Download File If Missing 
Function DownloadFileIfMissing
	Exch $R0
	Exch $R1
	
	IfFileExists $INSTDIR\$R0 _found _missing
	_missing:
		NSISdl::download http://patch.starwarsgalaxies.com:7040/patch/swg/$R0/$R1 "$INSTDIR\$R1"
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