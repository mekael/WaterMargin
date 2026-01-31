g_Mission ={};

g_CurrentStage ={};

function PrototypeRun()

	for i,Stage in pairs (g_Mission) do
		Stage.Initialize(Stage.Data);
	end
	C_Msg("Enter PrototypeRun");
	for i,Stage in pairs (g_Mission) do
		g_CurrentStage = Stage;
		Stage.Start(Stage.Data);
		while 1 ==  Stage.Update(Stage.Data) do
			Sleep(1);	
		end
		Stage.End(Stage.Data);
	end
	C_Msg("Leave PrototypeRun");
end

local function SetMissionForStage2( nArrayIndex )
	g_Mission[nArrayIndex] = {};
	g_Mission[nArrayIndex].Initialize = Task102_Stage2_Initialize;	-- 初始化關卡
	g_Mission[nArrayIndex].Start =      Task102_Stage2_Start;		-- 關卡開始
	g_Mission[nArrayIndex].End =        Task102_Stage2_End;			-- 關卡結束
	g_Mission[nArrayIndex].Update =     Task102_Stage2_Update;		-- 關卡進行中
	g_Mission[nArrayIndex].Data =       { bInitialized = false };
end
local function SetMissionForStage3( nArrayIndex )
	g_Mission[nArrayIndex] = {};
	g_Mission[nArrayIndex].Initialize = Stage3_Initialize;	-- 初始化關卡
	g_Mission[nArrayIndex].Start =      Stage3_Start;		-- 關卡開始
	g_Mission[nArrayIndex].End =        Stage3_End;			-- 關卡結束
	g_Mission[nArrayIndex].Update =     Stage3_Update;		-- 關卡進行中
	g_Mission[nArrayIndex].Data =       { bInitialized = false };
end

--- 初始化資料
function PrototypeInitialize()
	--g_Mission[1] = {};
	--g_Mission[1].Initialize = Stage1_Initialize;			-- 初始化關卡
	--g_Mission[1].Start = Stage1_Start;					-- 關卡開始
	--g_Mission[1].End = Stage1_End;						-- 關卡結束
	--g_Mission[1].Update = Stage1_Update;					-- 關卡進行中
	--g_Mission[1].Data = {};
	SetMissionForStage2( 2 );								--- stage 2 有許多項目仍然需要在 game client 表演，所以需要初始化。
	--SetMissionForStage3( 3 );
	C_RunScript(-1,0,[[PrototypeRun]]);
	C_Msg("PrototypeInitialize!!!");
end

--- 初始化資料
function PrototypeInitialize1()
	g_Mission[1] = {};
	g_Mission[1].Initialize = Stage1_Initialize;	-- 初始化關卡
	g_Mission[1].Start = Stage1_Start;				-- 關卡開始
	g_Mission[1].End = Stage1_End;					-- 關卡結束
	g_Mission[1].Update = Stage1_Update;			-- 關卡進行中
	g_Mission[1].Data = {};
	C_RunScript(-1,0,[[PrototypeRun]]);
	C_Msg("PrototypeInitialize!!!");
end

--- 初始化資料
function PrototypeInitialize2()
	C_Msg("PrototypeInitialize2()");
	SetMissionForStage2(1);
	C_RunScript(-1,0,[[PrototypeRun]]);
	C_Msg("PrototypeInitialize2!!!");
end

--- 初始化資料
function PrototypeInitialize3()
	C_Msg("PrototypeInitialize3()");
	SetMissionForStage3(1);
	C_RunScript(-1,0,[[PrototypeRun]]);
	C_Msg("PrototypeInitialize3!!!");
end
