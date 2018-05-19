-- 定义副本表 : 副本表是个 lua table, 名称要与脚本名称相同
Inst00010 = {
	inst_id = 10,									-- 副本 ID
	inst_type = 6,									-- 副本类 ID
	name = "乌鸡国",							-- 副本名称
	maps = {265,266,267,268,269,272}, 									-- 副本地图 IDs
	lasting = 1,									-- 副本空置後存在时间(min)
	player_limit = 5,								-- 副本人数限制(0=无限)
	require = {}, -- 副本进入要求
	feature = { }									-- 副本特性
}

-- Inst00010 副本开启时用的方法
function Inst00010:OnInit()
  local OwnerID = player:GetChar_id()
  if player:GetQuests():GetFlag(5500) >= 1 then 
    script:GenerateNPC(300513, 269,  61,  204, true, 10800, 0, OwnerID)
  end
end

-- Inst00010 进入副本另外要求的方法(optional)
-- 必定要返回 true/false, 和 err message
function Inst00010:CanEnter()
	return true, "正常"
end

-- Inst00010 离开副本另外要求的方法(optional)
-- 必定要返回 true/false, 和 err message
function Inst00010:CanLeave()
	return true, "正常"
end

-- Inst00010 进入副本时用的方法
function Inst00010:OnEnter()
	--print("Inst00010:OnEnter", instance:GetInstId(), 
		--instance:GetOwnerId(), player:GetChar_id())
end

-- Inst00010 离开副本时用的方法
function Inst00010:OnLeave()
	--print("Inst00010:OnLeave", instance:GetInstId(), 
		--instance:GetOwnerId(), player:GetChar_id())
end

-- Inst00010 副本关闭时用的方法
function Inst00010:OnClose()
	--print("Inst00010:OnClose", instance:GetInstId(), instance:GetOwnerId())
end

-- 必需在脚本最后将副本表加入系统中
AddInstTable(Inst00010)
