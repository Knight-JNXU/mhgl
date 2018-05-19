Preload("Quest10000.lua")






Npc00582= {	
	npc_id = 582,				
	name = GetNpcName(582),		
	quests = { Quest10000}						
}

function Npc00582:Talk(bProcess)

  local flag10000 = player:GetQuests():GetFlag(10000)
  local wlqlv = player:GetSkillLv(376)
  local wlklv = player:GetSkillLv(377)
  local fsqlv = player:GetSkillLv(378)
  local fsklv = player:GetSkillLv(379)
  if not player:GetQuests():HasQuest(10000) and player:GetQuests():GetFlag(10000) == 0 then
    Quest10000:Take()
  else
    local A = player:GetQuests():GetFlag(583)
    NpcAsk("欢迎来到铅笔梦幻,我是修为接待员,提供修炼相关的服务哦！")
	SetAnswer(1,"免费学习所有修为修为")
    SetAnswer(2,"免费提升15级修为")
	SetAnswer(3,"移除所有修为")
    SetAnswer(4,"暂时不用，谢谢！")
    WaitAnswer(4)
	if GetAnswer() == 1 then
	    if player:HasSkill(376) or player:HasSkill(377) or player:HasSkill(378) or player:HasSkill(379) then
          NpcSay("你已经成功的学会8个修为了，可以直接选择免费提升等级了！")
        else  
          player:AddSkill(376)
		  player:AddSkill(377)
		  player:AddSkill(378)
		  player:AddSkill(379)
		  player:AddSkill(382)
		  player:AddSkill(383)
		  player:AddSkill(384)
		  player:AddSkill(385)
          NpcSay("学习修为成功，请继续点击提升修为等级！")
        end
	elseif GetAnswer() == 2 then
	   if player:HasSkill(376) and player:HasSkill(377) and player:HasSkill(378) and player:HasSkill(379) then
	   else
       NpcSay("你4种修为都没学全呢，提升什么？先去学全再来吧！")
       return
       end
	   if wlqlv == 1 and wlklv == 1 and fsqlv == 1 and fsklv == 1 then
	   player:ChangeSkillLv(376,14)
	   player:ChangeSkillLv(377,14)
	   player:ChangeSkillLv(378,14)
	   player:ChangeSkillLv(379,14)
	   player:ChangeSkillLv(382,14)
	   player:ChangeSkillLv(383,14)
	   player:ChangeSkillLv(384,14)
	   player:ChangeSkillLv(385,14)
       NpcSay("恭喜！你现在已经是8项修为15级的高手了！")
       else 
       NpcSay("你的修为程度已经不能免费提升了！去闯荡江湖吧！")
	   end
	elseif GetAnswer() == 3 then
			if  player:HasSkill(376) then
          player:RemoveSkill(376)
		end
		if  player:HasSkill(377) then
          player:RemoveSkill(377)
		end
		if  player:HasSkill(378) then
          player:RemoveSkill(378)
		end
		if  player:HasSkill(379) then
          player:RemoveSkill(379)
		end
		if  player:HasSkill(382) then
          player:RemoveSkill(382)
		end
		if  player:HasSkill(383) then
          player:RemoveSkill(383)
		end
		if  player:HasSkill(384) then
          player:RemoveSkill(384)
		end
		if  player:HasSkill(385) then
          player:RemoveSkill(385)
		end
		NpcSay("#o已经安全移除#y所有修为，#O少侠再会")
	else
	 end
	end
  end
    
  




	    
	
	
	
	
	
	
	

AddNpcTable(Npc00582)