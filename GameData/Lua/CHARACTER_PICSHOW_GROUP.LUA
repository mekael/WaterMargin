---林沖連擊頭像
function character_picshow01()
	character_picshow( 3002 )
end	

--雷橫連擊頭像
function character_picshow02()
	character_picshow( 3003 )
end	

--孫二娘連擊頭像
function character_picshow03()
	character_picshow( 3004 )
end	

--戴宗連擊頭像
function character_picshow04()
	character_picshow( 3005 )
end	

---史進連擊頭像
function character_picshow05()
	character_picshow( 3048 )
end	

---李逵嫂連擊頭像
function character_picshow06()
	character_picshow( 3051 )
end	

---顧大嫂連擊頭像
function character_picshow07()
	character_picshow( 3049 )
end	

---花榮嫂連擊頭像
function character_picshow08()
	character_picshow( 3050 )
end	


function character_picshow( ImageListId )
	local height,width,Rate;
	Rate = 0.75;
	height = 360 *  Rate / 600
	width = 325 * Rate / 800
	local picD01 = C_ShowAutoScalePicAnmByUV ( ImageListId , width  , height ,
                                0 , 100 , 1 , 1 , 
                                0 , width, height ,
                                0.15 , 0.6 ,true);
	Sleep(8)								
	C_ClosePic(picD01)
end	
