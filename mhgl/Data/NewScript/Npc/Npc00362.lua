Preload("Quest69000.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00362 = {							-- 杵官王
	npc_id = 362,						-- NPC ID
	name = GetNpcName(362),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00362:Talk(bProcess)   
  local wDay = LuaI.GetRealWDay()
  local hour = LuaI.GetRealHour()
  NpcAsk("如今天下大乱,民不聊生,朝廷下旨,若是能赶进飞贼,便可加工进爵,少侠要为朝廷做事吗?\r\#Y活动开启时间:每周1、3、5、7中午12~14点，晚上19~21点")
  if (wDay == 1 or wDay == 3 or wDay == 5 or wDay == 7) and hour >= 12 and hour < 14 then
	  SetAnswer(1, "获取线报")
	end
  if (wDay == 1 or wDay == 3 or wDay == 5 or wDay == 7) and hour >= 19 and hour < 21 then
	  SetAnswer(1, "获取线报")
	end
  SetAnswer(2,"先走为妙")
  WaitAnswer(2)
	if GetAnswer() == 1 then
		if player:GetQuests():HasQuest(69000) then
			local q = player:GetQuests():GetQuest(69000)
			if q:IsFailed() then
				NpcSay("任务已失败，请删除。")
			else
				NpcSay("朝庭从不亏待有功之臣，快去消灭那些倭寇吧。")
			end
			return false
		else
			Quest69000:Take()
		end
  end
end

  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00362)
