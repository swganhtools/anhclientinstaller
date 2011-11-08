
;--------------------------------
;Download File If Missing 
Function DownloadFileIfMissing
  Pop $R0
  Pop $R1
  Pop $R2
  
  DetailPrint "Validating tre file $R0"
  
	IfFileExists $SWG_PATH\$R0 _found _download
  _found:
    md5dll::GetMD5File "$SWG_PATH\$R0"
    Pop $0
    StrCmp $0 $R2 _finish _download
	_download:
		inetc::get /TIMEOUT 30000 /QUESTION "" /CAPTION "Star Wars Galaxies Tre File - $R0" /RESUME "Network error. Retry?" http://swganh.com/patch/swg/$R1/$R0 $SWG_PATH\$R0 /END
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


Function CheckTreFiles
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