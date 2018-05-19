-- 定义副本表 : 副本表是个 lua table, 名称要与脚本名称相同
Inst00001 = {
	inst_id = 1,									-- 副本 ID
	inst_type = 6,									-- 副本类 ID
	name = "一级山庄",							-- 副本名称
	maps = {149,154,155,156,157,158}, 									-- 副本地图 IDs
	lasting = 1,									-- 副本空置後存在时间(min)
	player_limit = 0,								-- 副本人数限制(0=无限)
	require = {}, -- 副本进入要求
	feature = { }									-- 副本特性
}

-- Inst00001 副本开启时用的方法
function Inst00001:OnInit()
	--print("Inst00001:OnInit", instance:GetInstId(), 
			--instance:GetOwnerId())
	-- 在副本中的地图上随机生产 5 个 NPC
	--[[local npclist = { 2 }
	local randPos = { {map_id=2,x1=5,y1=10,x2=39,y2=120} }
	local npcNum = 5
	for i = 1, npcNum do
		local npc_id = RandTable(npclist)
		local loc = RandMapLoc(randPos)
		if loc then
			GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, true, -1, self)
		end
	end]]--
end

-- Inst00001 进入副本另外要求的方法(optional)
-- 必定要返回 true/false, 和 err message
function Inst00001:CanEnter()
	return true, "正常"
end

-- Inst00001 离开副本另外要求的方法(optional)
-- 必定要返回 true/false, 和 err message
function Inst00001:CanLeave()
	return true, "正常"
end

-- Inst00001 进入副本时用的方法
function Inst00001:OnEnter()
	--print("Inst00001:OnEnter", instance:GetInstId(), 
		--instance:GetOwnerId(), player:GetChar_id())
end

-- Inst00001 离开副本时用的方法
function Inst00001:OnLeave()
	--print("Inst00001:OnLeave", instance:GetInstId(), 
		--instance:GetOwnerId(), player:GetChar_id())
end

-- Inst00001 副本关闭时用的方法
function Inst00001:OnClose()
	--print("Inst00001:OnClose", instance:GetInstId(), instance:GetOwnerId())
end

-- 必需在脚本最后将副本表加入系统中
AddInstTable(Inst00001)
