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
  Name "SWGANH Client"
  OutFile "anhclient_setup.exe"
  ShowInstDetails show
  BrandingText " "
  
  VIAddVersionKey "ProductName" "SWGANH Client"
  VIAddVersionKey "CompanyName" "SWG:ANH"
  VIAddVersionKey "LegalCopyright" "Copyright (c) 2010 SWG:ANH"
  VIAddVersionKey "FileDescription" "Game client for SWG:ANH based servers."
  VIAddVersionKey "FileVersion" "1.1.0.0"
  VIProductVersion "1.1.0.0"


  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\SWGANH Client" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

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
    !define MUI_FINISHPAGE_RUN_TEXT "Start the SWG:ANH Client Configuration"
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

Section "SWGANH Game Client" SecClient
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
    
    CreateShortCut "$DESKTOP\SWGANH Client.lnk" "$INSTDIR\swganh\swganh.exe" "-- -s Station  subscriptionFeatures=1 gameFeatures=255"
  
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\SWGANH Client.lnk" "$INSTDIR\swganh\swganh.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Client.lnk" "$INSTDIR\swganh\swganh_config.exe"
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\README.lnk" "$INSTDIR\swganh\readme.txt"
  
  
  !insertmacro MUI_STARTMENU_WRITE_END

SectionEnd

Section "Documentation" SecGuide

  SetOutPath "$INSTDIR\swganh"  
  File /r /x .svn docs\*.*
  
  ;create desktop shortcut  
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    CreateShortCut "$DESKTOP\SWGANH - QA Guide.lnk" "$INSTDIR\swganh\SWGANH - QA Guide.chm" ""
    CreateShortCut "$SMPROGRAMS\$StartMenuFolder\docs\QA Guide.lnk" "$INSTDIR\swganh\SWGANH - QA Guide.chm"
  !insertmacro MUI_STARTMENU_WRITE_END
  
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecClient ${LANG_ENGLISH} "The SWG:ANH Game Client is used to connect to SWG:ANH based servers."
  LangString DESC_SecGuide ${LANG_ENGLISH} "The SWG:ANH Documentation feature provides useful information, tutorials and guides for testers."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecClient} $(DESC_SecClient)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecGuide} $(DESC_SecGuide)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  Delete "$DESKTOP\SWGANH Client.lnk"
  Delete "$DESKTOP\SWGANH - QA Guide.lnk"
  
  !insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
      
  RMDir /r "$SMPROGRAMS\$StartMenuFolder"  
  RMDir /r "$INSTDIR"
  
  DeleteRegKey /ifempty HKCU "Software\SWGANH Client"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\SWGANH Client"

SectionEnd

;--------------------------------
;Download File If Missing 
Function DownloadFileIfMissing
  Pop $R0
  Pop $R1
  Pop $R2
  
  DetailPrint "Validating tre file $R0"
  
	IfFileExists $INSTDIR\$R0 _found _download
  _found:
    md5dll::GetMD5File "$INSTDIR\$R0"
    Pop $0
    StrCmp $0 $R2 _finish _download
	_download:
		inetc::get /TIMEOUT 30000 /QUESTION "" /CAPTION "Star Wars Galaxies Tre File - $R0" /RESUME "Network error. Retry?" http://patch.starwarsgalaxies.com:7040/patch/swg/$R1/$R0 $INSTDIR\$R0 /END
		Pop $0 ;Get the return value
		StrCmp $0 "OK" _finish
      MessageBox MB_OK "Download Status: $0 - $R0"
      Quit
	_finish:
    DetailPrint '"$R0" OK'
  
	Pop $R0
	Pop $R1
  Pop $R2
FunctionEnd


Function DownloadTresIfMissing
  DetailPrint "Checking for missing or invalid tre files"
         
  Push "63C2D21719ED56D96B70373D99CC94D6"
	Push "main"
	Push "bottom.tre"
	Call DownloadFileIfMissing
  
  Push "907194CD54EFD6820C84DB37C47DFE2D"
	Push "main" 
	Push "default_patch.tre"
	Call DownloadFileIfMissing
  
  Push "88EE64F7E334616FBF688B09022E81DF"
	Push "main" 
	Push "data_music_00.tre"
	Call DownloadFileIfMissing
  
  Push "59CB600A9AF908B98D8D1C8934EC932B"
	Push "main" 
	Push "data_other_00.tre"
	Call DownloadFileIfMissing
  
  Push "1AE26649AF2C30EFE317850C4CB1A4BD"
	Push "main" 
	Push "data_animation_00.tre"
	Call DownloadFileIfMissing
  
  Push "C96A2EB77F27B6453053F0820B38AB7C"
	Push "main" 
	Push "data_sample_00.tre"
	Call DownloadFileIfMissing
  
  Push "9C0C272400DD2780ADDD9A8E25334FBF"
	Push "main" 
	Push "data_sample_01.tre"
	Call DownloadFileIfMissing
  
  Push "52A3CC6829DF957C9D72ECCC1B23CAD2"
	Push "main" 
	Push "data_sample_02.tre"
	Call DownloadFileIfMissing
  
  Push "2947689850819A256171547AF1A300D1"
	Push "main" 
	Push "data_sample_03.tre"
	Call DownloadFileIfMissing
  
  Push "A22F0C8C8F4B6104647AF628579CC0E3"
	Push "main" 
	Push "data_sample_04.tre"
	Call DownloadFileIfMissing
  
  Push "ECDAEFC123971D167159698F0F47ACA4"
	Push "main" 
	Push "data_skeletal_mesh_00.tre"
	Call DownloadFileIfMissing
  
  Push "F39551AE0BDA6B2EE0BC4C954FCD3699"
	Push "main" 
	Push "data_skeletal_mesh_01.tre"
	Call DownloadFileIfMissing
  
  Push "218BB19915380A12B74238A1D74AB27E"
	Push "space" 
	Push "data_sku1_00.tre"
	Call DownloadFileIfMissing
  
  Push "EBA6980265B5D742A3FF8897C6CB2AB5"
	Push "space" 
	Push "data_sku1_01.tre"
	Call DownloadFileIfMissing
  
  Push "15787E9235DF1BD8031B5076558E68E0"
	Push "space" 
	Push "data_sku1_02.tre"
	Call DownloadFileIfMissing
  
  Push "CAF586E0B039C79FF2197CEAF2A747B1"
	Push "space" 
	Push "data_sku1_03.tre"
	Call DownloadFileIfMissing
  
  Push "4D2734716AFCB4F8607BB47243ACB15F"
	Push "space" 
	Push "data_sku1_04.tre"
	Call DownloadFileIfMissing
  
  Push "9101B7BF19BD225854E84E42565F8BD6"
	Push "space" 
	Push "data_sku1_05.tre"
	Call DownloadFileIfMissing
  
  Push "88F986A7DE3BD5617A7E16042BD368CE"
	Push "space" 
	Push "data_sku1_06.tre"
	Call DownloadFileIfMissing
  
  Push "7511E70CFD04FA20E796FC826FBE0FCF"
	Push "space" 
	Push "data_sku1_07.tre"
	Call DownloadFileIfMissing
  
  Push "EC1FA71AF211FCF1CD86F5AA8752283A"
	Push "main" 
	Push "data_static_mesh_00.tre"
	Call DownloadFileIfMissing
	
  Push "D453B7F6F562368A4D06A3F9FD4E8339"
	Push "main" 
	Push "data_static_mesh_01.tre"
	Call DownloadFileIfMissing
	
  Push "6C8C538D209F5BD428BC9DA194EBD30D"
	Push "main" 
	Push "data_texture_00.tre"
	Call DownloadFileIfMissing
  
  Push "740124B213B92A16907A0FBAAD0FA130"
	Push "main" 
	Push "data_texture_01.tre"
	Call DownloadFileIfMissing
  
  Push "9D5DDA098C258BB5CAA84A610715D834"
	Push "main" 
	Push "data_texture_02.tre"
	Call DownloadFileIfMissing
  
  Push "636C5D29046F354C8A118B3C96285084"
	Push "main" 
	Push "data_texture_03.tre"
	Call DownloadFileIfMissing
  
  Push "80057E761DC219250B9319E61F10BA91"
	Push "main" 
	Push "data_texture_04.tre"
	Call DownloadFileIfMissing
  
  Push "FE62A811E86F38A21080B02782C9E662"
	Push "main" 
	Push "data_texture_05.tre"
	Call DownloadFileIfMissing
  
  Push "968D2CAFBA5A4C5FCEDBEEBA7A8C4D20"
	Push "main" 
	Push "data_texture_06.tre"
	Call DownloadFileIfMissing
  
  Push "C77F34FFA2C15663679F1AA86C43A3D5"
	Push "main" 
	Push "data_texture_07.tre"
	Call DownloadFileIfMissing  

  Push "1517A0A0E7E11C5D1AFC43C1B404A045"
	Push "main" 
	Push "patch_00.tre"
	Call DownloadFileIfMissing
  
  Push "36FD18E8342B23AE2DF51B916324F348"
	Push "main" 
	Push "patch_01.tre"
	Call DownloadFileIfMissing
  
  Push "2324ADAD81158DE1E938DB603287AC50"
	Push "main" 
	Push "patch_02.tre"
	Call DownloadFileIfMissing
  
  Push "BFDCA07C64D3D8F706889EAFA5E8B666"
	Push "main" 
	Push "patch_03.tre"
	Call DownloadFileIfMissing
  
  Push "4A3604D48F2301341326E0B101280968"
	Push "main" 
	Push "patch_04.tre"
	Call DownloadFileIfMissing
  
  Push "207B70E873A73361EFDFC9D1703FC16D"
	Push "main" 
	Push "patch_05.tre"
	Call DownloadFileIfMissing
  
  Push "1102BBDF4628D9EE09FBE87D323017F9"
	Push "main" 
	Push "patch_06.tre"
	Call DownloadFileIfMissing
  
  Push "17509E1D6F4FC09AB780DFEB7398CF9C"
	Push "main" 
	Push "patch_07.tre"
	Call DownloadFileIfMissing
  
  Push "775454FC68755AD45C1E1D09FF06D645"
	Push "main" 
	Push "patch_08.tre"
	Call DownloadFileIfMissing
  
  Push "021A722867D01FB7BC6B134A26B2DF38"
	Push "main" 
	Push "patch_09.tre"
	Call DownloadFileIfMissing
  
  Push "A9B46686BE046E866344E79D5515F236"
	Push "main" 
	Push "patch_10.tre"
	Call DownloadFileIfMissing
  
  Push "EB6289B9162851F2EE1ADF00A9394DF5"
	Push "main" 
	Push "patch_11_00.tre"
	Call DownloadFileIfMissing
  
  Push "B7E13F12D157187212ED0CC7D5A71F87"
	Push "main" 
	Push "patch_11_01.tre"
	Call DownloadFileIfMissing
  
  Push "2B63328B66DB99F2D7D8858242A8BC4B"
	Push "main" 
	Push "patch_11_02.tre"
	Call DownloadFileIfMissing
  
  Push "DEB4626249C2B9C42DBA8E4226DBD030"
	Push "main" 
	Push "patch_11_03.tre"
	Call DownloadFileIfMissing
  
  Push "39AC219E16AD81C78075CF326886365D"
	Push "main" 
	Push "patch_12_00.tre"
	Call DownloadFileIfMissing
  
  Push "69650433D897167D74C0E352C4BE9D8E"
	Push "main" 
	Push "patch_13_00.tre"
	Call DownloadFileIfMissing
  
  Push "0649BD5305DD18CD5378CF542647E543"
	Push "main" 
	Push "patch_14_00.tre"
	Call DownloadFileIfMissing
  
  Push "74B60AF869237A07FA18DC65F80E7ED2"
	Push "space" 
	Push "patch_sku1_12_00.tre"
	Call DownloadFileIfMissing
  
  Push "0792DAC181188AFED8776A742B64BCDE"
	Push "space" 
	Push "patch_sku1_13_00.tre"
	Call DownloadFileIfMissing
   
  Push "3170521A8E7E0547E9117BC092CBD021"
	Push "space" 
	Push "patch_sku1_14_00.tre"
	Call DownloadFileIfMissing
 
FunctionEnd

Var SWG_PATH
;--------------------------------
;Installer Functions
##
## Functions

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

Function .onInit
  call CheckSWG
  StrCpy $INSTDIR "$SWG_PATH"
FunctionEnd

Function LaunchClient
  SetOutPath "$INSTDIR\swganh"
  Exec "$INSTDIR\swganh\swganh_config.exe"
FunctionEnd

