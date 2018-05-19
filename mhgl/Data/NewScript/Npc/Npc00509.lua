Preload("Quest30300.lua")
Preload("Quest30301.lua")
Preload("Quest30302.lua")
Preload("Quest30303.lua")
Preload("Quest30304.lua")
Preload("Quest30305.lua")
Preload("Quest30306.lua")
Preload("Quest30307.lua")
Preload("Quest30308.lua")
Preload("Quest30200.lua")
Preload("Quest30601.lua")
Preload("Quest30602.lua")
Preload("Quest30603.lua")
Preload("Quest30604.lua")
Preload("Quest30605.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00509 = {							-- 杵官王
	npc_id = 509,						-- NPC ID
	name = GetNpcName(509),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00509:Talk(bProcess) 
  local quest_ids = {30601,30602,30603,30604,30605}
  NpcAsk("菩提本无树，明镜亦非台，本来无一物，何处惹尘埃。!")
  if player:GetFaction() == 0 then
	  SetAnswer(11, "拜师")
	end
  SetAnswer(1,"交谈")
  SetAnswer(2,"给予")
  SetAnswer(3,"领取法宝任务")
  SetAnswer(4,"兑换斗战之书")
  SetAnswer(5,"任务 ")
  SetAnswer(6,"学习技能")
  SetAnswer(7,"兑换飞天密信")
  SetAnswer(8,"兑换法宝任务书")
  if HasQuest(quest_ids)  then 
		if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604) or player:GetQuests():HasQuest(30605) then
			SetAnswer(10, "跑镖任务")
		end
  end
  SetAnswer(9,"我什么都不想做")
  WaitAnswer(9)
  if GetAnswer() == 11 then
		NpcAsk("您确定要成为#Y魔王寨弟子#W吗？")
		SetAnswer(1,"确定")
		SetAnswer(2,"我在想想")
		WaitAnswer(2)
	  if GetAnswer() == 1 then
		  local job = player:GetJob()
		  local sex = player:GetSex()
		  if (job == 1 and sex == 1) or (job == 2 and sex == 0 ) then
		    NpcSay("很好,现在你已是魔王寨弟子,为师传你一招\#P牛屎遁\#W，方便你随时返回门派。")
		    player:AddSkill(11000)
		    player:SetFaction(2)
		  else
		    NpcSay("本门只收魔族弟子,你还是请回吧")
		  end
		end
	elseif GetAnswer() == 6 then

	  if player:GetSkillLv(11000) < 1 then
		  NpcSay("本门武学从不外传。3")
		  return
	  end
	  if bProcess then
	    script:OpenInterface("skillshop", 2)
	  end
	elseif GetAnswer() == 10 then
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
	elseif GetAnswer() == 2 then
	  if player:GetFaction() ~= 1 then
		  NpcSay("本门武学从不外传。")
		  return
		end
	 if bProcess then
		 script:OpenInterface("skillshop", 1)
	  end
	elseif GetAnswer() == 5 then
		if player:GetFaction() == 2 then
			if  player:GetQuests():HasQuest(30300) then
				Quest30300:Return()
			elseif player:GetQuests():HasQuest(30301) then
				Quest30301:Return()
			elseif player:GetQuests():HasQuest(30302) then
				Quest30302:Return()
			elseif player:GetQuests():HasQuest(30303) then
				Quest30303:Return()
			elseif player:GetQuests():HasQuest(30304) then
			    Quest30304:Return()
			elseif player:GetQuests():HasQuest(30305) then
			    Quest30305:Return()
			elseif player:GetQuests():HasQuest(30306) then
			    Quest30306:Return()
			elseif player:GetQuests():HasQuest(30307) then
			    Quest30307:Return()
			elseif player:GetQuests():HasQuest(30308) then
			    Quest30308:Return()
			else
				if player:GetQuests():TimeMarkOver(303, 10) == false then
					NpcSay("上次交给你的任务都没有好好完成，等\#G10\#W分钟后再给你任务吧。")
				else
					if player:GetQuests():TimeMarkOver(303, 10) then
						player:GetQuests():RemoveTimeMark(303)
					end
					local A = math.random(1,30)
					if A == 1 then
					  if not bProcess then
					  	player:AntiHack()
					  end
					end
					if bProcess then
					script:SetSaying(true)
					 	if player:GetLevel() < 30 then
							local R = math.random(1,10)
							if R < 3 then
								Quest30300:Take()   --找人
							elseif R < 7 then
								Quest30301:Take()   --储备
							elseif R < 9 then
								Quest30300:Take()   --试炼
							else
								Quest30300:Take()   --寻物
							end
						elseif player:GetLevel() < 60 then
						    local R = math.random(1,10)
							if R < 3 then
								Quest30301:Take()   --储备
							elseif R < 6 then
								Quest30300:Take()   --叛徒
							elseif R < 7 then
								Quest30305:Take()   --巡逻
							elseif R < 8 then
								Quest30300:Take()  --寻物
							elseif R < 10 then
								Quest30305:Take()  --杀怪
							else
								Quest30300:Take()  --抓同伴
							end
						elseif player:GetLevel() < 70 then
							R = math.random(1,10)
							if R < 3 then
								Quest30301:Take()   --储备
							elseif R < 5 then
								Quest30300:Take()   --叛徒
							elseif R < 6 then
								Quest30305:Take()   --巡逻
							elseif R < 7 then
								Quest30300:Take()   --寻物
							elseif R < 9 then
								Quest30305:Take()   --杀怪
							else
								Quest30300:Take()   --抓同伴
							end
						elseif player:GetLevel() < 90 then
							R = math.random(1,10)
							if R < 3 then
								Quest30301:Take()   --储备
							elseif R < 5 then
								Quest30300:Take()   --叛徒
							elseif R < 6 then
								Quest30305:Take()   --援助
							elseif R < 7 then
								Quest30300:Take()   --寻物
							elseif R < 9 then
								Quest30305:Take()   --杀怪
							else
								Quest30300:Take()   --抓同伴
							end	
						else
							R = math.random(1,10)
							if R == 1 then
								Quest30301:Take()   --储备
							elseif R < 5 then
								Quest30300:Take()   --叛徒
							elseif R < 6 then
								Quest30305:Take()   --援助
							elseif R < 7 then
								Quest30300:Take()   --寻物
							elseif R < 9 then
								Quest30305:Take()   --杀怪
							else
								Quest30300:Take()   --抓同伴
						  end
						end
					end
				end
			end
		else
			NpcSay("本帮的事情，我们自然懂得处理，不需要外人插手。")
		end	
  end
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00509)
