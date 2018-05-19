-- 中秋活动 荷灯商人 
--author xiaofeng
Preload("Quest69001.lua")

Npc000728 = {							-- 荷灯商人
	npc_id = 000728,						-- NPC ID
	name = GetNpcName(000728),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc000728:Talk(bProcess)
	local Day =  LuaI.GetRealDay();
	local Month = LuaI.GetRealMonth();
	local Year = LuaI.GetRealYear();
	local QuestFlagA = player:GetQuests():GetFlag(6916)
	
	NpcAsk(string.format("#O兑换物品哦\r\#P当前已完成：\r\#A嘉年华：%d/600兑换后自动扣除次数！", QuestFlagA))
	
  SetAnswer(1, "我是来参加你们考验的")
  SetAnswer(2, "我要进入桃园春色(挂机活动)")
  SetAnswer(3, "20次 换1号宠物盒子1个")
  if player:GetLevel() > 129 then
  SetAnswer(4, "50次 换2号宠物盒子1个")
  end
  if player:GetLevel() > 139 then
  SetAnswer(5, "100次 换3号宠物盒子1个")
  end
	SetAnswer(10,"离开")
	WaitAnswer(10)
	if GetAnswer() == 1 then
		if player:GetQuests():HasQuest(69001) then
			local q = player:GetQuests():GetQuest(69001)
			if q:IsFailed() then
				NpcSay("任务已失败，请删除。")
			else
				NpcSay("怎么还不去，再不抓紧就让尸王吃人了。")
			end
			return false
		else
			if npc then
				Quest69001:Take()
			end
	  end
	  end
	if GetAnswer() == 2 then
	  player:JumpMap(264,46,291)
	--	player:AddBuff(40006, 0, 0, 0, 60, 100)
		ShowHint("快去找桃园使者领取桃园春色为你带来温暖吧#18")
	end
	if GetAnswer() == 3 and bProcess then
	script:SetSaying(true)
	if QuestFlagA < 20 then
	NpcSay("#A你历练还不够啊，要加油喔！")
	return
	end
   player:GetItems():AddItem(600014, 1)
  player:GetQuests():SetFlag(6916, QuestFlagA - 20)
  end
  if GetAnswer() == 4 and bProcess then
	script:SetSaying(true)
	if QuestFlagA < 50 then
	NpcSay("#A你历练还不够啊，要加油喔！")
	return
	end
   player:GetItems():AddItem(600015, 1)
  player:GetQuests():SetFlag(6916, QuestFlagA - 50)
  end
  if GetAnswer() == 5 and bProcess then
	script:SetSaying(true)
	if QuestFlagA < 100 then
	NpcSay("#A你历练还不够啊，要加油喔！")
	return
	end
   player:GetItems():AddItem(600016, 1)
  player:GetQuests():SetFlag(6916, QuestFlagA - 100)
  end
end


-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc000728)