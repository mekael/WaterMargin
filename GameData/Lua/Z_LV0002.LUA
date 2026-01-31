-------------------------------------------------------------------------------
-- Client Script
-------------------------------------------------------------------------------
function LV2_TeacherTalk_Start()
	C_PortraitDialog(7 , -64 ,false,false,
					--"<font size=18><font color=yellow>歡迎你，新來的菜鳥~~</font></font>",
					C_GetStringFromPreset( 8250201),
					100);
	C_PortraitDialog(7 , -64 ,false,false,
					--"<font size=18><font color=yellow>你有成為英雄潛質才會遇到我喔，就讓我來傳授你冒險必備的能力吧。</font></font>",
					C_GetStringFromPreset( 8250202),
					100);
	local PicId = C_ShowPicAnm( 4022 , 310 , 165 , 0 , 800 , 0 , 3 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(7 , -64 ,false,false,
					--"<font size=18><font color=yellow>在遊戲中，你可以用鍵盤、滑鼠或是搖桿來進行操作喔。</font></font>",
					C_GetStringFromPreset( 8250203),
					100);
	C_ClosePic( PicId );
end

function LV2_TeacherTalk_Move()
	local PicId = C_ShowPicAnm( 4023 , 166 , 150 , 0 , 400 , 0 , 4 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(7 , -64 ,false,false,
					--"<font size=18><font color=yellow>首先，你可以使用『W.S.A.D』鍵來進行『上.下.左.右』的移動。</font></font>",
					C_GetStringFromPreset( 8250204),
					100);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>接著就請你試試看移動吧。</font></font>", 
					C_GetStringFromPreset( 8250205),
					100);
	C_ClosePic( PicId );
end

function LV2_TeacherTalk_Jump()
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow> Very good！</font></font>", 
					C_GetStringFromPreset( 8250206),
					100);

	local PicId = C_ShowPicAnm( 4024 , 200 , 150 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>再來，按下『空白鍵』則會讓你跳躍喔。</font></font>", 
					C_GetStringFromPreset( 8250207),
					100);
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>請試試跳躍吧。</font></font>", 
					C_GetStringFromPreset( 8250208),
					100);
	C_ClosePic( PicId );	
end

function LV2_TeacherTalk_Rush()
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>很好~就是這麼簡單。</font></font>", 
					C_GetStringFromPreset( 8250209),
					100);

	local PicId = C_ShowPicAnm( 4025 , 200 , 150 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>如果遇到緊急狀況時，你可以按下『L』鍵進行衝刺脫逃。</font></font>", 
					C_GetStringFromPreset( 8250210),
					100);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>現在就請你試試看衝刺吧。</font></font>", 
					C_GetStringFromPreset( 8250211),
					100);
	C_ClosePic( PicId );	
end

function LV2_TeacherTalk_RushCoolDown()
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>很好~就是這麼簡單。</font></font>",
					C_GetStringFromPreset( 8250212),
					100);
	
	local PicId = C_ShowPicAnm( 4026 , 282 , 81 , 0 , 450 , 0 , 4 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true)
	C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>衝刺後會有一段冷卻時間，必須等這段時間結束後才能再次使用。</font></font>",
					C_GetStringFromPreset( 8250213),
					100)
	C_ClosePic( PicId )
end	
	
function LV2_TeacherTalk_Combo()	
	local PicId = C_ShowPicAnm( 4027 , 200 , 150 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true)
	C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>當遭遇怪物時，你可以按下『J』鍵進行攻擊。</font></font>", 
					C_GetStringFromPreset( 8250214),
					100)
	C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>現在試試看攻擊吧。</font></font>", 
					C_GetStringFromPreset( 8250215),
					100)
	C_ClosePic( PicId )
end

function LV2_TeacherTalk_Combo1()	
    C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>嗯~你很有慧根，果然是個人才。</font></font>", 
					C_GetStringFromPreset( 8250216),
					100);	
end


function LV2_TeacherTalk_ShortCut()
	local PicId = C_ShowPicAnm( 4028 , 439 , 44 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>接著是在下方有排快捷列，你可將常用技能及道具在格中。</font></font>", 
					C_GetStringFromPreset( 8250217),
					100);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>現在我們來看看怎樣使用快捷鍵。</font></font>", 
					C_GetStringFromPreset( 8250218),
					100);
	C_ClosePic( PicId )				
end	
	
function LV2_Hotkey_Select()	
	local PicId = C_ShowPicAnm( 4029 , 304 , 57 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>步驟1：按下鍵盤上的『U』跟『O』進行快捷鍵的選擇</font></font>", 
					C_GetStringFromPreset( 8250219),
					100);
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>請試試看吧。</font></font>", 
					C_GetStringFromPreset( 8250220),
					100);
	C_ClosePic( PicId );	
end

function LV2_Hotkey_Use1()	
    C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow> Very good！</font></font>", 
					C_GetStringFromPreset( 8250221),
					100);
	local PicId = C_ShowPicAnm( 4032 , 114 , 57 , 5 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>步驟2：然後按下『K』鍵便可直接使用。</font></font>", 
					C_GetStringFromPreset( 8250222),
					100);
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>請試試看吧。</font></font>", 
					C_GetStringFromPreset( 8250223),
					100);
	C_ClosePic( PicId );	
end	
	
function LV2_Hotkey_Use2()
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>很好~就是這麼簡單。</font></font>", 
					C_GetStringFromPreset( 8250224),
					100);
	local PicId = C_ShowPicAnm( 4033 , 304 , 57 , 0 , 450 , 0 , 3 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>步驟3：還可按下鍵盤數字鍵所對應快捷鍵來使用喔。</font></font>", 
					C_GetStringFromPreset( 8250249),
					100);	
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>現在就請你按下1或2鍵來試試看吧。</font></font>", 
					C_GetStringFromPreset( 8250250),
					100);
	C_ClosePic( PicId );	
end	
	
function LV2_Hotkey_Cooldown()	
    C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow> Very good！</font></font>", 
					C_GetStringFromPreset( 8250251),
					100);
	local PicId = C_ShowPicAnm( 4035 , 114 , 57 , 0 , 500 , 0 , 6 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>技能類的物品使用後會有一段冷卻時間，必須等這段時間結束後才能再次使用。</font></font>",
					C_GetStringFromPreset( 8250252),
					100);
	C_PortraitDialog(6 , 50 ,true,false,
	                --"<font size=18><font color=yellow>請再用一次『K』鍵後注意看icon圖顯示。</font></font>", 
					C_GetStringFromPreset( 8250223),
					100);
	C_ClosePic( PicId );	
end		
	
	--PicId = C_ShowPicAnm( 4031 , 272 , 190 , 0 , 450 , 0 , 4 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>步驟1：將技能欄上的技能圖示按滑鼠右鍵，選擇放置到快捷列。</font></font>",
                    --C_GetStringFromPreset( 8250219),
					--100);
	--C_ClosePic( PicId );
	--PicId = C_ShowPicAnm( 4032 , 114 , 57 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>步驟2：這時，技能會被放置在快捷列上。</font></font>", 
					--C_GetStringFromPreset( 8250220),
					--100);
	--C_ClosePic( PicId );
	--PicId = C_ShowPicAnm( 4032 , 114 , 57 , 5 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>步驟3：然後按下『K』鍵便可直接使用。</font></font>", 
					--C_GetStringFromPreset( 8250221),
					---100);
	--C_ClosePic( PicId );
    --PicId = C_ShowPicAnm( 4032 , 400 , 52 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(6 , 30 ,true,false,"<font size=18><font color=yellow>這時，技能會被放置在快捷列上，可用滑鼠直接點擊使用。</font></font>", 100);
	--C_ClosePic( PicId );
	--PicId = C_ShowPicAnm( 4033 , 304 , 57 , 0 , 450 , 0 , 3 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>或是按下鍵盤『1~0』的按鍵所對應快捷列上的技能來使用。</font></font>", 
					--C_GetStringFromPreset( 8250222),
					--100);	
	--C_ClosePic( PicId );	
	--PicId = C_ShowPicAnm( 4035 , 114 , 57 , 0 , 500 , 0 , 6 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>技能使用後將有一段冷卻時間，必須等這段時間結束後才能再次使用。</font></font>",
					--C_GetStringFromPreset( 8250223),
					--100);

	--C_ClosePic( PicId );
	--C_PortraitDialog(7 , -64 ,false,false,
	                --"<font size=18><font color=yellow>現在就請你試試看技能的使用吧。</font></font>", 
					--C_GetStringFromPreset( 8250224),
					--100);

function LV2_TeacherTalk_GotoWuyong()
    C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>太好啦~看來你已參透這些本領了。</font></font>",
					C_GetStringFromPreset( 8250225),
					100)
	C_PortraitDialog(6 , 30 ,true,false,
	                --"<font size=18><font color=yellow>請往下個階段移動吧，智多星吳用在等你了，快去吧~</font></font>",
					C_GetStringFromPreset( 8250226),
					100)
end

function PD_LV2_TeacherTalk()
	local PicId
	--Sleep(20)
	L_DoActionOnScreen( LV2_TeacherTalk_Start ,true)
	L_DoActionOnScreen( LV2_TeacherTalk_Move ,true)
	PicId = C_ShowPicAnm( 4051 , 166 , 300 , 0 , 400 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	--C_HUDMessage ("Please to push down the W button")
	L_WaitingForKeyState("Up")
	Sleep(10)
	C_ClosePic( PicId );
	Sleep(10)
	
	PicId = C_ShowPicAnm( 4052 , 166 , 300 , 0 , 400 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	--C_HUDMessage ("Please to push down the S button")
	L_WaitingForKeyState("Down")
	Sleep(10)
	C_ClosePic( PicId );
	Sleep(10)
	
	PicId = C_ShowPicAnm( 4053 , 166 , 300 , 0 , 400 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	--C_HUDMessage ("Please to push down the A button" )
	L_WaitingForKeyState("Left")
	Sleep(10)
	C_ClosePic( PicId );
	Sleep(10)
	
	PicId = C_ShowPicAnm( 4054 , 166 , 300 , 0 , 400 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	--C_HUDMessage ("Please to push down the D button")
	L_WaitingForKeyState("Right")
	Sleep(10)
	C_ClosePic( PicId );
	Sleep(10)
	
	L_DoActionOnScreen( LV2_TeacherTalk_Jump ,true)
	PicId = C_ShowPicAnm( 4056 , 200 , 300 , 0 , 450 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	L_WaitingForKeyState("Jump")
	Sleep(5)
	C_ClosePic( PicId );	
	
	L_DoActionOnScreen( LV2_TeacherTalk_Rush ,true)
	PicId = C_ShowPicAnm( 4057 , 200 , 300 , 0 , 450 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	L_WaitingForKeyState("Rush")
	Sleep(15)
	C_ClosePic( PicId )

    L_DoActionOnScreen( LV2_TeacherTalk_RushCoolDown ,true)	
    Sleep(5)
	C_ClosePic( PicId )
	
	L_DoActionOnScreen( LV2_TeacherTalk_Combo ,true)
	PicId = C_ShowPicAnm( 4058 , 200 , 300 , 0 , 450 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	L_WaitingForKeyState("Combo")
	Sleep(15)
	C_ClosePic( PicId )

    L_DoActionOnScreen( LV2_TeacherTalk_Combo1 ,true)
	Sleep(5)
	C_ClosePic( PicId )

	
	L_DoActionOnScreen( LV2_TeacherTalk_ShortCut ,true)
	Sleep(5)
	C_ClosePic( PicId )
	
	L_DoActionOnScreen( LV2_Hotkey_Select ,true) --操作u.o鍵	
	PicId = C_ShowPicAnm( 4059 , 200 , 155 , 0 , 450 , 0 , 2 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	L_WaitingForKeyState("ShortCutPrev")
	L_WaitingForKeyState("ShortCutNext")
	Sleep(20)
	C_ClosePic( PicId )
	
	L_DoActionOnScreen( LV2_Hotkey_Use1 ,true) --操作k鍵
	PicId = C_ShowPicAnm( 4060 , 114 , 237 , 4 , 450 , 0 , 4 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 3,true);
	L_WaitingForKeyState("ShortCut")
	Sleep(10)
	C_ClosePic( PicId )
	
	L_DoActionOnScreen( LV2_Hotkey_Use2 ,true) --操作1.2鍵
	PicId = C_ShowPicAnm( 4061 , 200 , 155 , 0 , 450 , 0 , 3 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 1,true);
	L_WaitingForKeyState("ShortCut1")
	L_WaitingForKeyState("ShortCut2")	
	Sleep(20)
	C_ClosePic( PicId )
	
	--[[L_DoActionOnScreen( LV2_Hotkey_Cooldown ,true) --操作技能冷卻
	PicId = C_ShowPicAnm( 4062 , 114 , 237 , 0 , 500 , 0 , 6 , 141 , 480/2 , 550/2 , 3 , 1 , 3 , 1,true);
	L_WaitingForKeyState("ShortCut")
	Sleep(20)
	C_ClosePic( PicId )]]
		
	L_DoActionOnScreen( LV2_TeacherTalk_GotoWuyong , true )
	local finishtime = Default_Screen_Fade_Out( 1 , true )
	Sleep(finishtime-2)
	C_AnswerDialog( -1 )
end

function PD_LV2_WuyongTalk_Start()
	C_PortraitDialog(9 , -64 ,false,false,
	                -- [[<font size=18><font color=yellow>我是「智多星-吳用」，歡迎你加入梁山英雄的陣容，相信你已學會基本功夫，現在就由我來告訴你「英雄任務」是什麼吧。</font></font>]],
					C_GetStringFromPreset( 8250227),
					100);
	C_PortraitDialog(9 , -64 ,false,false,
	                --"<font size=18><font color=yellow>所謂「英雄任務」就是要打抱不平跟幫助受欺侮的人，更重要的是讓「人類跟動物成為和平相處的好朋友」。</font></font>", 
					C_GetStringFromPreset( 8250228),
					100);
	C_PortraitDialog(9 , -64 ,false,false,
	                --"<font size=18><font color=yellow>完成這些任務是你邁向英雄的必經之路，更可以幫助你獲得相當的財富喔。</font></font>", 
					C_GetStringFromPreset( 8250229),
					100);
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>現在就讓我們開始進行任務的訓練吧。</font></font>", 
					C_GetStringFromPreset( 8250230),
					100);
	local PicId = C_ShowPicAnm( 4036 , 275 , 190 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow步驟一：看見"黃色驚嘆號"時，請用滑鼠點選我來接下任務。</font></font>", 
					C_GetStringFromPreset( 8250231),
					100);
	C_ClosePic( PicId );
	PicId = C_ShowPicAnm( 4037 , 275 , 190 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>步驟二：變成"灰色的問號"時，這就代表你接的任務尚未完成，請快去執行。</font></font>", 
					C_GetStringFromPreset( 8250232),
					100);
	C_ClosePic( PicId );
	PicId = C_ShowPicAnm( 4042 , 275 , 190 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>步驟三：變成"黃色的問號"後，這就代表任務完成了，切記要來點選我進行回報喔。</font></font>",
					C_GetStringFromPreset( 8250233),
					100);
	C_ClosePic( PicId );
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>完成回報後我會送你一樣裝備做為獎勵。</font></font>", 
					C_GetStringFromPreset( 8250234),
					100);
					
	--C_PortraitDialog(9 , -64 ,false,false,
	                --"<font size=18><font color=yellow>我們來看看裝備如何使用。</font></font>",
					--C_GetStringFromPreset( 8250235),
					--100);
	--PicId = C_ShowPicAnm( 4038 , 200 , 200 , 0 , 450 , 0 , 4 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(9 , -64 ,false,false,
	                -- [[<font size=18><font color=yellow>步驟1：先點選主功能表，然後點選背包圖示</font></font>]], 
					--C_GetStringFromPreset( 8250236),
					--100);
	--C_ClosePic( PicId );	
	--PicId = C_ShowPicAnm( 4038 , 166 , 150 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(9 , -64 ,false,false,"<font size=18><font color=yellow>步驟2：點選背包圖示。</font></font>", 100);
	--C_ClosePic( PicId );
	--PicId = C_ShowPicAnm( 4039 , 272 , 190 , 0 , 450 , 0 , 4 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(9 , -64 ,false,false,
	                --"<font size=18><font color=yellow>在背包欄位上的裝備圖示按下右鍵後選擇「裝備」。</font></font>", 
					--C_GetStringFromPreset( 8250237),
					--100);
	--C_ClosePic( PicId );
	--PicId = C_ShowPicAnm( 4040 , 275 , 190 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	--C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>接著，你可以打開裝備欄，查看裝備的使用狀態喔。</font></font>", 
					--C_GetStringFromPreset( 8250238),
					--100);
	--C_ClosePic( PicId );
	
	--PicId = C_ShowPicAnm( 4047 , 200 , 150 , 0 , 450 , 0 , 3 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true); --撿寶教學 + 動態演出
	--C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>遊戲中還有一件很重要的事就是「撿寶物」。</font></font>", 
					--C_GetStringFromPreset( 8250239),
					--100);
	--C_ClosePic( PicId );
	--PicId = C_ShowPicAnm( 4048 , 114 , 57 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true); --撿寶教學 + 『I』 鍵
	--C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>只要看見寶物掉落，請靠近寶物並按下『I』鍵，只要背包還有空間，寶物就會裝入背包喔。</font></font>", 
					--C_GetStringFromPreset( 8250240),
					--100);
	--C_ClosePic( PicId );
	
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>你會看見裝備掉落，請靠近並按下『I』鍵，只要背包還有空間，寶物就會裝入背包喔。</font></font>", 
					C_GetStringFromPreset( 8250240),
					100);
	C_ClosePic( PicId );
	
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>好啦~現在就請你點擊我進行任務的訓練吧</font></font>", 
					C_GetStringFromPreset( 8250241),
					100);
	C_LockUserControl( false );
end

function PD_LV2_WuyongTalk_Finish()
    local PicId = C_ShowPicAnm( 4034 , 200 , 192 , 0 , 450 , 0 , 2 , 5 , 480 , 261 , 3 , 3 , 3 , 1,true);
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>恭喜你~訓練完成！剛剛所學的也都記載在"英雄秘笈"之中，可讓你隨身攜帶查詢喔。</font></font>", 
					C_GetStringFromPreset( 8250242),
					100);
	C_ClosePic( PicId );
    C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>快向右前進"梁山基地"吧，那有許多特別的英雄好漢等著要和你結識呢~</font></font>", 
					C_GetStringFromPreset( 8250243),
					100);
end

function PD_LV2_WuyongTalk()
	--Sleep(20)
	L_DoActionOnScreen( PD_LV2_WuyongTalk_Start ,true)
	C_AnswerDialog( -1 )
end

function PD_LV2_WuyongTalk_MissionFinish()
	L_DoActionOnScreen( PD_LV2_WuyongTalk_Finish ,true)
	C_AnswerDialog( -1 )
end

function PD_LV2_Wuyong_TrainMode_Unfinish()
	C_PortraitDialog(8 , 50 ,true,false,
	                --"<font size=18><font color=yellow>不要急!請先完成新手的訓練，才能出去。</font></font>", 
					C_GetStringFromPreset( 8250244),
					100);
end

--等待某一個按鍵完成後
function L_WaitingForKeyState( KeyName )
	local Tb_KeyName = {"Move","Combo","Rush","Jump","ShortCut",
						"ShortCutPrev","ShortCutNext","PickUpItem",
						"ShortCut1"	,"ShortCut2","Up","Down","Left","Right"
						}
	local CheckKeyIndex = 0
	for i,v in pairs (Tb_KeyName) do
		if KeyName == v then
			CheckKeyIndex = i
			break
		end
	end
	
	while true do
		C_WaitingInputState(500)
		local KeyState = C_GetInputState()
		local Tb_Key = {}
		local remain,i
		i = 0
		while KeyState > 0 do
			i = i + 1
			remain = KeyState % 2
			KeyState = (KeyState - remain) / 2
			if remain == 1 then
				Tb_Key[i] = true
			else
				Tb_Key[i] = false
			end
		end
	
		if CheckKeyIndex > 0 then
			if Tb_Key[CheckKeyIndex] == true then
				return
			end
		end
--[[	
		for i,v in pairs (Tb_Key) do 
			if v == true then
				if i == 1 then
					C_HUDMessage("移動")
				elseif i == 2 then
					C_HUDMessage("攻擊")
				elseif i == 3 then
					C_HUDMessage("衝刺")
				elseif i == 4 then
					C_HUDMessage("跳躍")
				elseif i == 5 then
					C_HUDMessage("使用ShortCut")
				end
			end
		end
--]]	
	end
end
--=============================================================================
--從亮到一半暗 -> 表演 -> 亮到一半暗 
function L_DoActionOnScreen( DoWhat , bLock )

	local FadeCount = 16
    local height,width,Rate
	local TotalFrameCount = 64
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024

	if bLock then
		C_LockUserControl( true );
	end

	--local PicId = C_ShowPicAnm( 4046 , 400 , 400 , 0 , 100 , 1 , 16 , 0 , 400 , 400 , 3 , 3 , 3 , 1,true)
	local FadeInId = C_ShowAutoScalePicAnmByUV  ( 4046 , width  , height , 0 , 50 , 1 , FadeCount , 0 , width, height , 0.5 , 0.5 ,true);
	--local PicId = C_ShowAutoScalePicAnmByUV  ( 4046 , width  , height , 0 , 100 , 0 , 16 , 0 , width, height , 0.5 , 0.5 ,true);
	Sleep(10)
	
	local Pic01 = C_ShowAutoScalePicAnmByUV  ( 4041 , width  , height , 0 , 100 , 0 , 3 , 0 , width, height , 0.5 , 0.5 ,true);
	
	if DoWhat ~= nil then
		if "function" == type(DoWhat) then
			DoWhat()
		end
	end
	
	C_ClosePic( Pic01 )
	
	if bLock then
		C_LockUserControl( false )
	end
	C_ClosePic(FadeInId)
	local FadeOutId = C_ShowAutoScalePicAnmByUV  ( 4046 , width  , height , TotalFrameCount - FadeCount -1, 50 , 1 , FadeCount , 0 , width, height , 0.5 , 0.5 ,true);
	Sleep(10)	
	C_ClosePic(FadeOutId)
end
--=============================================================================
-- 演戲專用
--從暗到一半暗 -> 表演 -> 一半暗到亮 
function L_DoActionOnScreen1( DoWhat , DoWhatOnDark , UserData , bLock , bNoBlackBar , bNoFadeIn)

	local FrameCount = 32
    local height,width,Rate
	local TotalFrameCount = 64
	local FrameTime = 60
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024

	if bLock then
		C_LockUserControl( true );
	end
	
	if bNoBlackBar == nil then
		bNoBlackBar = false
	end
	
	if bNoFadeIn == nil then
		bNoFadeIn = false
	end
	
	-- 先變暗
	Default_Screen_Fade_Out( 0 , false )

	if DoWhatOnDark ~= nil then
		if "function" == type(DoWhatOnDark) then
			DoWhatOnDark(UserData)
		end
	end
	
	
	local FadeInId = -1
	-- 變亮
	if bNoFadeIn == false then
		FadeInId = C_ShowAutoScalePicAnmByUV  ( 4046 , width  , height , TotalFrameCount/2 , FrameTime , 1 , FrameCount , 0 , 1 , 1 , 0.5 , 0.5 ,true)
	end
	
	local Pic01 = -1
	--顯示上下黑邊
	if bNoBlackBar == false then
		Pic01 = C_ShowAutoScalePicAnmByUV  ( 4041 , width  , height , 0 , 100 , 0 , 3 , 0 , width, height , 0.5 , 0.5 ,true);
	end
	Sleep(10)

	--做表演
	if DoWhat ~= nil then
		if "function" == type(DoWhat) then
			DoWhat(UserData)
		end
	end

	--關閉上下黑邊
	if bNoBlackBar == false then
		C_ClosePic( Pic01 )
	end

	if bLock then
		C_LockUserControl( false )
	end
	
	-- 變成全亮
	if bNoFadeIn == false then
		C_ClosePic(FadeInId)
	end

	-- 變暗
	local FadeOutId = C_ShowAutoScalePicAnmByUV  ( 4046 , width  , height , TotalFrameCount/2 + TotalFrameCount/2 - FrameCount , FrameTime , 1 , FrameCount , 0 , 1 , 1 , 0.5 , 0.5 ,true);	
	Sleep(10)	
	C_ClosePic(FadeOutId)
end
--=============================================================================
-- 播放影片專用
-- 先變暗--> 播影片 --> 結束
function L_DoActionOnScreen_ForMovie( DoWhat , DoWhatOnDark , UserData , bLock )

	local FrameCount = 32
    local height,width,Rate
	local TotalFrameCount = 64
	local FrameTime = 60
	Rate = 1;
	height = 768 *  Rate / 768
	width = 1048 * Rate / 1024

	if bLock then
		C_LockUserControl( true );
	end
	
	-- 先變暗
	local CloseTime = Default_Screen_Fade_Out( 5 , true )
	Sleep( CloseTime - 1 )
	if DoWhatOnDark ~= nil then
		if "function" == type(DoWhatOnDark) then
			DoWhatOnDark(UserData)
		end
	end
	
	--做表演
	if DoWhat ~= nil then
		if "function" == type(DoWhat) then
			DoWhat(UserData)
		end
	end

	if bLock then
		C_LockUserControl( false )
	end

end
--=============================================================================

function TestTest( )
	local width = 1
	local height = 1
	local FadeCount = 16
	
	local type = 0
	while true do
		if type == 0 then
			type = 1
			C_SetPosition(OwnerID() ,0 , 0, 0)
		else
			type = 0
			C_SetPosition(OwnerID() ,2000 ,0 ,800 )
		end
		
	end
end
G_FadeOutPicId = -1
G_FadeInPicId = -1

function Default_Screen_Fade_In( DelayTime , bNoWaiting )
	local FrameTime = 60
	local FrameCount = 32
	local TotalFrameCount = 64	
	
	if G_FadeOutPicId ~= -1 then
		C_ClosePic(G_FadeOutPicId)
	end
	
	G_FadeInPicId = C_ShowAutoScalePicAnmByUV  ( 4046 , 1  , 1 , TotalFrameCount/2 + TotalFrameCount/2 - FrameCount , FrameTime , 1 , FrameCount , 0 , 1 , 1 , 0.5 , 0.5 ,true);
	local CloseTime = FrameTime*FrameCount / 100 + 1 

	if (DelayTime ~= nil) and  (type(DelayTime) == "number") then
		CloseTime  = CloseTime + DelayTime
	end

	if bNoWaiting ~= nil and bNoWaiting == true then
		L_CreateTask(CloseTime , {Default_DelayClosePic} , G_FadeInPicId )
	else
		Sleep(CloseTime)
		C_ClosePic(G_FadeInPicId)
	end
	G_FadeInPicId = -1
	return CloseTime
end
function Default_Screen_Fade_Out( DelayTime , bNoWaiting )
	local FrameTime = 60
	local FrameCount = 32
	local TotalFrameCount = 64	

	if G_FadeInPicId ~= -1 then
		C_ClosePic(G_FadeInPicId)
	end
	
	local G_FadeOutPicId = C_ShowAutoScalePicAnmByUV  ( 4046 , 1  , 1 , 0 + TotalFrameCount/2 - FrameCount , FrameTime , 1 , FrameCount , 0 , 1 , 1 , 0.5 , 0.5 ,true);

	local CloseTime = FrameTime*FrameCount / 100 + 1 

	if (DelayTime ~= nil) and  (type(DelayTime) == "number") then
		CloseTime  = CloseTime + DelayTime
	end

	if bNoWaiting ~= nil and bNoWaiting == true then
		L_CreateTask(CloseTime , {Default_DelayClosePic} , G_FadeOutPicId )
	else
		Sleep(CloseTime)
		C_ClosePic(G_FadeOutPicId)
	end
	G_FadeOutPicId = -1
	return CloseTime
end

function Default_Screen_Fade_In_Now()
	Default_Screen_Fade_In(0,true)
end

function Default_Screen_Fade_Out_Now()
	Default_Screen_Fade_Out(0,true)
end

function Default_DelayClosePic ( InArg )
	if InArg ~= nil then
		if type(InArg) == "number" then
			C_ClosePic(InArg)
		elseif type(InArg) == "table" then
			for i,v in pairs (InArg) do
				if v~= nil and type(v) == "number" then
					C_ClosePic(v)
				end
			end
		end
	end
end
