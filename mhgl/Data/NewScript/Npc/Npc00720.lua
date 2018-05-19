Preload("Quest55001.lua")
Preload("Quest55002.lua")
Preload("Quest55003.lua")
Preload("Quest55004.lua")
Preload("Quest55005.lua")
Npc00720 = {
	npc_id = 720, 
	name = GetNpcName(720),
	quests = { Quest55001,Quest55002,Quest55003,Quest55004,Quest55005 }
}
Npc00720.Talk = function(self, bProcess)
  if player:HasGuild() == false then
    NpcSay("你这家伙是哪里跑进来的？")
    return 
  end
  NpcAsk("帮派的发展是靠大家的。当前帮派贡献奖励:20倍")
  SetAnswer(1, "发展任务")
  SetAnswer(2, "离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then
	  if player:GetQuests():HasQuest(55001) then
			Quest55001:Return()
			return
		end		
		if player:GetQuests():HasQuest(55002) then
			Quest55002:Return()
			return
		end
		if player:GetQuests():HasQuest(55003) then
			Quest55003:Return()
			return
		end			
		if player:GetQuests():HasQuest(55004) then
			Quest55004:Return()
			return
		end	
		if player:GetQuests():HasQuest(55005) then
			Quest55004:Return()
			return
		end	
        local r = math.random(1, 5);
        if r == 1 then
          Quest55001:Take()
        elseif r == 2 then
          Quest55002:Take()
        elseif r == 3 then
          Quest55003:Take()
        elseif r == 4 then
          Quest55004:Take()
		elseif r == 5 then
          Quest55004:Take()
        end
    end
end

AddNpcTable(Npc00720)

