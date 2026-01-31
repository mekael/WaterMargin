-- Client Script 
-- 當玩家升級時發出的Script
-------------------------------------------------------------------------------
--
MessageOfLevel = {}-- 所有等級須要通知玩家的資訊
-- 等級2時

function MessageOfLevelInitialize()
	MessageOfLevel[2] = {
						{C_GetStringFromPreset( 8281001 ),C_GetStringFromPreset( 8282000 )} --※2連段提示
						}
						
	MessageOfLevel[5] = {
						{C_GetStringFromPreset( 8281067 ),C_GetStringFromPreset( 8282067 )} --5技能升級提示
						}
						
	MessageOfLevel[6] = {
						{C_GetStringFromPreset( 8281002 ),C_GetStringFromPreset( 8282001 )} --6技能升級提示
						}
						
	MessageOfLevel[7] = {
						{C_GetStringFromPreset( 8281003 ),C_GetStringFromPreset( 8282002 )} --7※飾品使用提示(請找雜貨商人)
						}
						
	MessageOfLevel[8] = {
						{C_GetStringFromPreset( 8281068 ),C_GetStringFromPreset( 8282068 )} --6技能升級提示
						}
						
	MessageOfLevel[9] = {
						{C_GetStringFromPreset( 8281005 ),C_GetStringFromPreset( 8282004 )} --9技能升級提示
						}
						
	MessageOfLevel[10] ={
						{C_GetStringFromPreset( 8281006 ),C_GetStringFromPreset( 8282005 )},--10※3連段提示
						{C_GetStringFromPreset( 8281008 ),C_GetStringFromPreset( 8282007 )} --10裝備升級提示 
						}
						
	MessageOfLevel[11] ={
						{C_GetStringFromPreset( 8281009 ),C_GetStringFromPreset( 8282008 )} --11技能升級提示 
						}
						
	MessageOfLevel[12] ={
					--	 {C_GetStringFromPreset( 8281010 ),C_GetStringFromPreset( 8282009 )}, --12※PK開始提示
						{C_GetStringFromPreset( 8281011 ),C_GetStringFromPreset( 8282010 )} --12飾品升級提示
						}
						
	MessageOfLevel[13] ={
						{C_GetStringFromPreset( 8281012 ),C_GetStringFromPreset( 8282011 )} --13技能升級提示
						}
						
	MessageOfLevel[14] ={
						{C_GetStringFromPreset( 8281069 ),C_GetStringFromPreset( 8282069 )} --14技能升級提示
						}
						
	MessageOfLevel[15] ={
						{C_GetStringFromPreset( 8281013 ),C_GetStringFromPreset( 8282012 )} --15裝備與技能升級提示
						}
						
	MessageOfLevel[16] ={
						{C_GetStringFromPreset( 8281014 ),C_GetStringFromPreset( 8282013 )} --16技能升級提示
						}
						
	MessageOfLevel[17] ={
						{C_GetStringFromPreset( 8281015 ),C_GetStringFromPreset( 8282014 )} --17飾品與技能升級提示
						}
						
	MessageOfLevel[18] ={
						{C_GetStringFromPreset( 8281017 ),C_GetStringFromPreset( 8282016 )} --18※使用守護神提示(請找守護神商人)
						}
						
	MessageOfLevel[19] ={
						{C_GetStringFromPreset( 8281070 ),C_GetStringFromPreset( 8282070 )} --19技能升級提示
						}
						
	MessageOfLevel[20] ={
						{C_GetStringFromPreset( 8281007 ),C_GetStringFromPreset( 8282006 )}, --20※創立公會提示	
					--	{C_GetStringFromPreset( 8281016 ),C_GetStringFromPreset( 8282015 )}, --20※挑戰兔城副本提示
						{C_GetStringFromPreset( 8281019 ),C_GetStringFromPreset( 8282018 )}, --20※4連段提示
						{C_GetStringFromPreset( 8281020 ),C_GetStringFromPreset( 8282019 )}, --20※使用坐騎提示(請找坐騎商人)
						{C_GetStringFromPreset( 8281021 ),C_GetStringFromPreset( 8282020 )} --20裝備升級提示
						}
						
	MessageOfLevel[21] ={
						{C_GetStringFromPreset( 8281022 ),C_GetStringFromPreset( 8282021 )} --21技能升級提示
						}
						
	MessageOfLevel[22] = {
						{C_GetStringFromPreset( 8281023 ),C_GetStringFromPreset( 8282022 )} --22飾品升級提示
						}
						
	MessageOfLevel[23] = {
						{C_GetStringFromPreset( 8281024 ),C_GetStringFromPreset( 8282023 )} --23守護神與技能升級提示
						}
						
	MessageOfLevel[24] ={
						{C_GetStringFromPreset( 8281071 ),C_GetStringFromPreset( 8282071 )} --24技能升級提示
						}
						
	MessageOfLevel[25] ={
						{C_GetStringFromPreset( 8281025 ),C_GetStringFromPreset( 8282024 )},--25※展開25級推王提示 
						{C_GetStringFromPreset( 8281026 ),C_GetStringFromPreset( 8282025 )} --25裝備技能升級提示
						}
						
	MessageOfLevel[26] ={
						{C_GetStringFromPreset( 8281027 ),C_GetStringFromPreset( 8282026 )} --26技能升級提示
						}
						
	MessageOfLevel[27] ={
						{C_GetStringFromPreset( 8281028 ),C_GetStringFromPreset( 8282027 )} --27飾品升級提示
						}
						
	MessageOfLevel[28] ={
						{C_GetStringFromPreset( 8281029 ),C_GetStringFromPreset( 8282028 )} --28守護神升級提示					
						}
						
	MessageOfLevel[29] ={
						{C_GetStringFromPreset( 8281030 ),C_GetStringFromPreset( 8282029 )} --29技能升級提示
						}
						
	MessageOfLevel[30] ={
						{C_GetStringFromPreset( 8281031 ),C_GetStringFromPreset( 8282030 )}, --30坐騎升級提示
						{C_GetStringFromPreset( 8281032 ),C_GetStringFromPreset( 8282031 )} --30裝備升級提示
						}
						
	MessageOfLevel[31] ={
						{C_GetStringFromPreset( 8281033 ),C_GetStringFromPreset( 8282032 )} --31技能升級提示
						}
						
	MessageOfLevel[32] ={
					--	{C_GetStringFromPreset( 8281061 ),C_GetStringFromPreset( 8282060 )},--32※挑戰象城副本提示
						{C_GetStringFromPreset( 8281034 ),C_GetStringFromPreset( 8282033 )} --32飾品與技能升級提示
						}
						
	MessageOfLevel[33] ={
						{C_GetStringFromPreset( 8281035 ),C_GetStringFromPreset( 8282034 )} --33守護神與技能升級提示										
						}
						
	MessageOfLevel[34] ={
						{C_GetStringFromPreset( 8281036 ),C_GetStringFromPreset( 8282035 )} --34技能升級提示
						}
						
	MessageOfLevel[35] ={
						{C_GetStringFromPreset( 8281037 ),C_GetStringFromPreset( 8282036 )},--35※展開35級推王提示 
						{C_GetStringFromPreset( 8281038 ),C_GetStringFromPreset( 8282037 )} --35裝備升級提示
						}
						
	MessageOfLevel[37] ={
					--	{C_GetStringFromPreset( 8281062 ),C_GetStringFromPreset( 8282061 )},--37※挑戰彪城與駱駝城副本提示
						{C_GetStringFromPreset( 8281039 ),C_GetStringFromPreset( 8282038 )} --37飾品與技能升級提示
						}
						
	MessageOfLevel[38] ={
						{C_GetStringFromPreset( 8281040 ),C_GetStringFromPreset( 8282039 )} --38守護神升級提示														
						}
						
	MessageOfLevel[39] ={
						{C_GetStringFromPreset( 8281041 ),C_GetStringFromPreset( 8282040 )} --39技能升級提示
						}
						
	MessageOfLevel[40] ={
						{C_GetStringFromPreset( 8281042 ),C_GetStringFromPreset( 8282041 )}, --40坐騎升級提示
						{C_GetStringFromPreset( 8281043 ),C_GetStringFromPreset( 8282042 )} --40裝備升級提示
						}
						
	MessageOfLevel[41] ={
						{C_GetStringFromPreset( 8281072 ),C_GetStringFromPreset( 8282072 )} --41技能升級提示
						}
						
	MessageOfLevel[42] ={
					--	{C_GetStringFromPreset( 8281063 ),C_GetStringFromPreset( 8282062 )},--42※挑戰貓城副本提示
						{C_GetStringFromPreset( 8281044 ),C_GetStringFromPreset( 8282043 )} --42飾品與技能升級提示
						}
						
	MessageOfLevel[43] ={
						{C_GetStringFromPreset( 8281045 ),C_GetStringFromPreset( 8282044 )} --43守護神升級提示														
						}
						
	MessageOfLevel[44] ={
						{C_GetStringFromPreset( 8281073 ),C_GetStringFromPreset( 8282073 )} --44技能升級提示
						}
						
	MessageOfLevel[45] ={
						{C_GetStringFromPreset( 8281046 ),C_GetStringFromPreset( 8282045 )},--45※展開45級推王提示 
						{C_GetStringFromPreset( 8281047 ),C_GetStringFromPreset( 8282046 )} --45裝備與技能升級提示
						}
						
	MessageOfLevel[46] ={
						{C_GetStringFromPreset( 8281048 ),C_GetStringFromPreset( 8282047 )} --46技能升級提示
						}
						
	MessageOfLevel[47] ={
					--	{C_GetStringFromPreset( 8281064 ),C_GetStringFromPreset( 8282063 )},--47※挑戰鷹城副本提示
						{C_GetStringFromPreset( 8281049 ),C_GetStringFromPreset( 8282048 )} --47飾品與技能升級提示
						}
						
	MessageOfLevel[48] ={
						{C_GetStringFromPreset( 8281050 ),C_GetStringFromPreset( 8282049 )} --48守護神升級提示														
						}
						
	MessageOfLevel[49] ={
						{C_GetStringFromPreset( 8281074 ),C_GetStringFromPreset( 8282074 )} --49技能升級提示
						}
						
	MessageOfLevel[50] ={
						{C_GetStringFromPreset( 8281051 ),C_GetStringFromPreset( 8282050 )}, --50坐騎升級提示
						{C_GetStringFromPreset( 8281052 ),C_GetStringFromPreset( 8282051 )} --50裝備與技能升級提示
						}
						
	MessageOfLevel[51] ={
						{C_GetStringFromPreset( 8281075 ),C_GetStringFromPreset( 8282075 )} --51技能升級提示
						}
						
	MessageOfLevel[52] ={
						{C_GetStringFromPreset( 8281053 ),C_GetStringFromPreset( 8282052 )} --52飾品升級提示
						}
						
	MessageOfLevel[53] ={
						{C_GetStringFromPreset( 8281054 ),C_GetStringFromPreset( 8282053 )} --53守護神與技能升級提示														
						}
						
	MessageOfLevel[54] ={
						{C_GetStringFromPreset( 8281076 ),C_GetStringFromPreset( 8282076 )} --54技能升級提示
						}
						
	MessageOfLevel[55] ={
						{C_GetStringFromPreset( 8281055 ),C_GetStringFromPreset( 8282054 )},--55※展開55級推王提示 
						{C_GetStringFromPreset( 8281056 ),C_GetStringFromPreset( 8282055 )} --55裝備升級提示
						}
						
	MessageOfLevel[57] ={
						{C_GetStringFromPreset( 8281057 ),C_GetStringFromPreset( 8282056 )} --57飾品升級提示
						}
						
	MessageOfLevel[58] ={
						{C_GetStringFromPreset( 8281058 ),C_GetStringFromPreset( 8282057 )} --58守護神與技能升級提示														
						}
						
	MessageOfLevel[60] ={
						{C_GetStringFromPreset( 8281059 ),C_GetStringFromPreset( 8282058 )},--60※展開60級推終極魔王提示 
						{C_GetStringFromPreset( 8281060 ),C_GetStringFromPreset( 8282059 )} --60裝備與技能升級提示
						}
						
end
function DoLevelUpNotify( Level )
	if Level == nil then 
		return
	else
		--C_HUDMessage("Have Level")
	end

	--C_HUDMessage("DoLevelUpNotify"..Level)

	local Message = MessageOfLevel[Level]
	
	if Message == nil then
		return
	else
		--C_HUDMessage("Have Message")
	end
	
	-- 產生需要通知玩家MessageBox
	for i,v in pairs( Message ) do
		C_NotifyMessageBox( v[1] , v[2] , false , false )
	end
end
-------------------------------------------------------------------------------
