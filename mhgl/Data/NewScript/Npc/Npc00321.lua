Preload("Quest22103.lua")
Preload("Quest22104.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00321 = {							-- 杵官王
	npc_id = 321,						-- NPC ID
	name = GetNpcName(321),				-- NPC 名称
	quests = {Quest30300,Quest22103,Quest22104}
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00321:Talk(bProcess) 
	local quest30300 = player:GetQuests():GetQuest(30300) 
	if (player:GetQuests():HasQuest(30300) and quest30300:GetTargetNpcId(1) == self.npc_id) or 
		HasQuest(22103) or HasQuest(22104) then
		NpcAsk( { "咳……咳咳，客官可是来听我老头子说书的？",
			} )		
		if player:GetQuests():HasQuest(30300) and quest30300:GetTargetNpcId(1) == self.npc_id then
			SetAnswer(1, "师傅好客")
		end
		if HasQuest(22103) or HasQuest(22104) then
			SetAnswer(2,"阵法的迷惑")
		end
		SetAnswer(3, "离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
			NpcSay("我知道了，你先去回禀你师傅吧，我随后就到。")
			quest30300:FindTargetNPC(1)
			quest30300:SetDescription("事情办完了，回复师傅去吧。")
			quest30300:UpdateData()
		elseif GetAnswer() == 2 then
			if HasQuest(22103) then
				if Quest22103:Return()	then	
					Quest22104:Take()
				end
			elseif HasQuest(22104) then
				Quest22104:Return()
			end
		end
	else
    NpcAsk("人要想出名，就得靠刷屏，自己刷很累是不是？那你找我就对了，我这里有好多个大嗓门得伙计，那吼起来可是惊天地泣鬼神，保管吼出水平，吼出风格，吼出选票。")
    SetAnswer(1,"那我就请一个伙计回师门帮帮我拉选票。")
    SetAnswer(2,"我想了解下现在的雇佣情况。")
    SetAnswer(3,"等我以后有需要再找你把。")
    WaitAnswer(3)
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00321)
