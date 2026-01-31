
local DIR_UP		= 0;
local DIR_URIGHT	= 1;
local DIR_RIGHT		= 2;
local DIR_DRIGHT	= 3;
local DIR_DOWN		= 4;
local DIR_DLEFT		= 5;
local DIR_LEFT		= 6;
local DIR_ULEFT		= 7;


------------------------------------------------------------
local function DisplayCameraDistance()
	local fCameraToTargetDistance = C_GetCameraDistance();
	local fCameraToTargetDistanceDelta = C_GetCameraDistanceDelta();
	C_Msg( string.format("CameraToTargetDistance=%.2f, Delta=%.2f", fCameraToTargetDistance, fCameraToTargetDistanceDelta ) );	-- For debug.
end

------------------------------------------------------------

function LevelDesign9901_TriggerGroup1_OnEnter()
	local nOwnerId = OwnerID();	-- 
	local nTargetId = TargetID();	-- 
	-- C_Msg( string.format("LevelDesign9901_TriggerGroup1_OnEnter( nOwnerId=%d, nTargetId=%d )", nOwnerId, nTargetId ) );	-- For debug.

	C_SetCameraDistance( -300, 2.5 );	-- Zoom in
	DisplayCameraDistance();			-- For debug.

	C_CameraShockStart(		-- 開始鏡頭震動
		10.0, 50.0, 0.0,	-- 開始時的振幅
		0.0, 00.0, 0.0,		-- 結束時的振幅
		10,					-- 頻率
		10,					-- 持續時間
--		false				-- 是否亂數振幅
		true				-- 是否亂數振幅
	);
end

------------------------------------------------------------

function LevelDesign9901_TriggerGroup1_OnLeave()
	local nOwnerId = OwnerID();	-- 
	local nTargetId = TargetID();	-- 
	-- C_Msg( string.format("LevelDesign9901_TriggerGroup1_OnLeave( nOwnerId=%d, nTargetId=%d )", nOwnerId, nTargetId ) );	-- For debug.

	C_SetCameraDistanceDelta( 0, 0.5 );	-- Zoom out (zoom back to original)
	DisplayCameraDistance();			-- For debug.

	C_CameraShockStop();				-- 停止鏡頭震動
	
--	C_SetCameraDirection( DIR_URIGHT );
end

------------------------------------------------------------
