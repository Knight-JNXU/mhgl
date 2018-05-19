-- 中秋活动 荷灯商人 
--author xiaofeng
Preload("Quest690010.lua")

Npc403000 = {							-- 荷灯商人
	npc_id = 403000,						-- NPC ID
	name = GetNpcName(403000),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc403000:Talk(bProcess)
	local Day =  LuaI.GetRealDay();
	local Month = LuaI.GetRealMonth();
	local Year = LuaI.GetRealYear();
	
	
	NpcAsk("想进副本先帮我把这四周的小妖清理干净吧")	
	
	  SetAnswer(1, "交给我了")
	SetAnswer(2, "进入下一环")	  	
	SetAnswer(12, "离开")	
	WaitAnswer(12)
	if GetAnswer() == 1 then
		if player:GetQuests():HasQuest(690010) then
			local q = player:GetQuests():GetQuest(690010)
			if q:IsFailed() then
				NpcSay("任务已失败，请删除。")
			else
				NpcSay("怎么还不去。")
			end
			return false
		else
			if npc then
				Quest690010:Take()
			end
		end
	end
	  if GetAnswer() == 2 then
	        if player:GetItems():GetItemCount(402900) < 1 then
        NpcSay("小子你那里混进来的")
        return 
      end
    if player:GetLevel() < 110 then
      NpcSay("低于110级,没有资格进入")
      return
    end
    player:JumpMap(87,32,226)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc403000)