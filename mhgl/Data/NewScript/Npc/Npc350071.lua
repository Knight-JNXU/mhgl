--beifang
--万梅山庄仆人
Preload("Quest60220.lua")
Npc350071 = {							
	npc_id = 350071,					
	name = GetNpcName(350071),	
    quests = { Quest60220}
}

function Npc350071:Talk(bProcess)	
	local Quest = player:GetQuests():GetQuest(60220)
	if Quest == nil then	
		NpcAsk("主人身体欠安，所以闭门谢客，但是他让我给来访者捎上一句话：唯破阵者见之。")	
		SetAnswer(1, "智力闯关任务")
		SetAnswer(2, "任务简介")
		SetAnswer(3, "查询积分")
		--SetAnswer(4, "传送至京城")		
		SetAnswer(5, "离开")
		WaitAnswer(5)
		if GetAnswer() == 1 then	
			Quest60220:Take()
		elseif GetAnswer() == 2 then
		    NpcSay("此阵由50个既独立又相关的神秘人组成，你是否想从第一个从容不迫的走到第50个呢？那就看看你是否有足够的应变能力。")		
		elseif GetAnswer() == 3 then
			local flag60230 = player:GetQuests():GetFlag(60230)
			NpcSay(string.format("\#W你的副本积分为\#P%d\#W点。",flag60230))
		elseif GetAnswer() == 4 then
		    if IsProcess() then	
				player:JumpMap(34, 251, 136)
			end						
		end	
	else
	    NpcSay("主人常念：“天地不仁以万物为刍狗。”")
	end
end

AddNpcTable(Npc350071)
