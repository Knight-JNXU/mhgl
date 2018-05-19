Preload("Quest30601.lua")
Preload("Quest30602.lua")
Preload("Quest30603.lua")
Preload("Quest30604.lua")
Preload("Quest30605.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00510 = {							-- 孙小红
	npc_id = 510,						-- NPC ID
	name = GetNpcName(510),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00510:Talk(bProcess)
  local quest_ids = {30601,30602,30603,30604,30605}
  NpcAsk({"现在的孙猴子早就不是五百年前那个孙猴子了！",
          "桃花过处，寸草不生。很多年之后，我有个绰号，叫做桃花娘子......",
          "往前算五百年，往后算五百年，没人的美貌能超越我。",
          "师妹对那个臭猴子还是念念不忘。",
          "在出道的时候，我认识一个人，他叫孙悟空，他后来有个绰号，叫齐天大圣。",
          "我盘丝洞的法术可不是轻易能学到手的。",
          "我有一项不传绝技，叫作“催情大法”。"
          })
  if HasQuest(quest_ids)  then 
		if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604) or player:GetQuests():HasQuest(30605) then
			SetAnswer(4, "跑镖任务")
		end
  end
	SetAnswer(8, "我什么都不想做")
	WaitAnswer(8)
	if GetAnswer() == 4 then
		local quest30601 = player:GetQuests():GetQuest(30601) 
		local quest30602 = player:GetQuests():GetQuest(30602)
		local quest30603 = player:GetQuests():GetQuest(30603)
		local quest30604 = player:GetQuests():GetQuest(30604)
		local quest30605 = player:GetQuests():GetQuest(30605)
		if bProcess then
		 script:SetSaying(true)
		 if player:GetQuests():HasQuest(30601) and player:GetQuests():GetQuest(30601):IsFailed() 
		 or player:GetQuests():HasQuest(30602) and player:GetQuests():GetQuest(30602):IsFailed() 
		 or player:GetQuests():HasQuest(30603) and player:GetQuests():GetQuest(30603):IsFailed()
		 or player:GetQuests():HasQuest(30604) and player:GetQuests():GetQuest(30604):IsFailed()
		 or player:GetQuests():HasQuest(30605) and player:GetQuests():GetQuest(30605):IsFailed()
		 
		  then
			
			
			
			
			NpcSay("我的镖银呢？")
		else
		   if player:GetQuests():HasQuest(30601) and quest30601:GetEndNpcId() == self.npc_id then
				   Quest30601:Return()
				elseif player:GetQuests():HasQuest(30602) and quest30602:GetEndNpcId() == self.npc_id then
				  Quest30602:Return()
				elseif player:GetQuests():HasQuest(30603) and quest30603:GetEndNpcId() == self.npc_id then
				  Quest30603:Return()
		
				elseif player:GetQuests():HasQuest(30604) and quest30604:GetEndNpcId() == self.npc_id then
				  Quest30604:Return()
		
				elseif player:GetQuests():HasQuest(30605) and quest30605:GetEndNpcId() == self.npc_id then
				  Quest30605:Return()
				else
				  NpcSay("这好像不是我的镖银吧？")
			   end
		   end
	  end	 
	end
end


          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00510)
