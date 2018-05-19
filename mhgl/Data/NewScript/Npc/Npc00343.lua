Preload("Quest23018.lua")


Npc000343= {	
	npc_id = 343,				
	name = GetNpcName(343),		
	quests = {Quest23018}							
}

function Npc000343:Talk(bProcess)
	local flag428 = player:GetQuests():GetFlag(428)
	local quest23018 = player:GetQuests():GetQuest(23018)
	NpcAsk("江湖事江湖了，如果你等级≥30级，可以在我这里开启PK开关来对付你的仇人。然而，冤冤相报何时了？开启PK开关前，请三思吧。")	
--[[	if (player:GetLevel() >= 31 and flag428 == 0) or  quest23018 then
		SetAnswer(1, "新手引导")
	end--]]
	SetAnswer(2, "我要开启PK开关")
	SetAnswer(3, "我要关闭PK开关")
	SetAnswer(4, "关于PK")
	SetAnswer(5, "离开")
	WaitAnswer(5)
	if GetAnswer() == 1 then
		if player:GetLevel() >= 31 and flag428 == 0 then
			Quest23018:Take()
		else
			Quest23018:Return()
		end
	elseif GetAnswer() == 2 then
		if player:GetLevel() < 30 then
			NpcSay("30级以下玩家无法打开PK开关。")
			return 
		end
		if player:GetEnablePK() == true then
			NpcSay("你的PK开关已开启，无需再打开。")
			return 
		end
		if player:GetQuests():TimeMarkOver(401, 360) == false then
			NpcAsk("由于你上次是被强P至死，现在处于PK受保护时间，但如果此时开启PK开关，你的PK受保护时间将失效，确定开启PK开关吗？")	
			SetAnswer(1, "是的，我坚决要开启PK开关")
			SetAnswer(2, "离开")
			WaitAnswer(2)
			if GetAnswer() == 1 then
				NpcSay("你的PK开关已开启，凡事请三思而后行。")	
				if bProcess then
					player:SetEnablePKEx(true);--打开PK开关
					player:GetQuests():RemoveTimeMark(400)
					player:GetQuests():RemoveTimeMark(401)
					player:GetQuests():SetTimeMark(400)
				end	
			end
			return 
		end
		NpcAsk("开启PK开关后，在野外可能随时被其他玩家攻击，你确定要开启吗？")
		SetAnswer(1, "确定")
		SetAnswer(2, "离开")
		WaitAnswer(2)	
		if GetAnswer() == 1 then
			NpcSay("你的PK开关已开启，凡事请三思而后行。")	
			if bProcess then
				player:SetEnablePKEx(true);--打开PK开关
				player:GetQuests():RemoveTimeMark(400)
				player:GetQuests():SetTimeMark(400)
			end	
		end
	elseif GetAnswer() == 3 then
		if player:GetEnablePK() == false then
			NpcSay("你的PK开关已关闭，无需再关闭。")
			return 
		end
		local PKValue = player:GetPK_Value();	
		if player:GetQuests():TimeMarkOver(400, 1440) == false then
			NpcSay("距离上次开启PK开关的时间不足24小时，无法关闭。")
			return 
		end
		if PKValue > 0 then
			NpcSay("你身上带有杀孽值，无法关闭PK开关。")
			return 
		end	
		NpcSay("你的PK开关已关闭。")	
		if bProcess then
			player:SetEnablePKEx(false);--关闭PK开关
		end
	elseif GetAnswer() == 4 then
		NpcSay("开启PK开关，即表示自愿与别人进行生死决斗。每次开启后24小时内不能关闭，期间可以与其他开启开关的玩家进行PK。战斗失败方会受到PK死亡的损失，获胜方不会受到PK惩罚。开启条件：等级>=30级 关闭条件：开启PK开关24小时后，非红名。")
	end	
end

AddNpcTable(Npc000343)