--速度線效果
function Picshow_01()
	local height,width,Rate;
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024
	local picd01 = C_ShowAutoScalePicAnmByUV  ( 4012 , width  , height ,
                                0 , 100 , 0 , 3 , 
                                0 , width, height ,
                                0.5 , 0.5 ,true);
	--Sleep(8);
	C_WaitForAnimation(TargetID(), 0 );
	
	C_ClosePic(picd01)
	--Sleep(10);
end	
--衝刺速度線
function Picshow_02()
	local height,width,Rate;
	Rate = 1;
	height = 600 *  Rate / 600
	width = 800 * Rate / 800
	local picd02 = C_ShowAutoScalePicAnmByUV  ( 4013 , width  , height ,
                                0 , 100 , 0 , 3 , 
                                0 , width, height ,
                                0.5 , 0.5 ,true);
	--Sleep(8);
	C_WaitForAnimation( TargetID(), 0 );
	C_ClosePic(picd02)
	--Sleep(10);
end	
function Picshow_03()--擊殺數達100會秀的圖
	C_RunScript ( -1 , -1, "Picshow_03_1" )
end
function Picshow_03_1()
	local PicId2 = C_ShowPicAnm( 4050 , 440 , 138 , 
									0 , 400 , 0 , 1 , 
									0 , 500 , 380 , 
									2 , 2 , 
									1 , 1,true);
	Sleep(30)
	C_ClosePic( PicId2 );
end
	-- 黑畫面
function Picshow_BlackScreen()
	local height,width,Rate;
	Rate = 1;
	height = 1024 *  Rate / 1024
	width = 768 * Rate / 768
	local picd02 = C_ShowAutoScalePicAnmByUV  ( 4020 , width  , height ,
                                0 , 100 , 0 , 1 , 
                                0 , width, height ,
                                0.5 , 0.5 ,true);
	Sleep(10);
	--C_WaitForAnimation( OwnerID(), 0 );
	C_ClosePic(picd02)
	--Sleep(10);
end	
