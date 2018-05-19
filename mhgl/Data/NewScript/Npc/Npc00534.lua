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


Npc00534 = {							-- 陈咬金
	npc_id = 534,						-- NPC ID
	name = GetNpcName(534),				-- NPC 名称
	quests = {Quest30300,Quest30301,Quest30302,Quest30303,Quest30304,Quest30305,
	           Quest30306,Quest30307,Quest30308,Quest30200}			-- NPC 会派出的任务表
}

function Npc00534:Talk(bProcess)
  local quest_ids = {30601,30602,30603,30604,30605}
  NpcAsk({"作了官还要天天上朝，真是麻烦。",
        "作了官还要天天上朝，真是麻烦。",
		"作了官还要天天上朝，真是麻烦。",
		"作了官还要天天上朝，真是麻烦。"})
  
  if player:GetFaction() == 0 then
	    SetAnswer(1, "拜师")
	end
  SetAnswer(2, "学习技能")
	SetAnswer(3, "任务")
  if HasQuest(quest_ids)  then 
		if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604) or player:GetQuests():HasQuest(30605) then 
			SetAnswer(4, "跑镖任务")
		end
  end
    SetAnswer(9, "领取门派法宝")
	SetAnswer(8, "我什么都不想做")
	WaitAnswer(8)
    if GetAnswer() == 9 then
	  if player:GetSkillLv(13000) < 1 then
		  NpcSay("本门武学从不外传。")
		  return
	  end
	  if player:HasSkill(394) then
	     player:GetItems():AddItem(60235,1)
		 NpcSay("为师现将本门独有法宝《干将莫邪》传授于你，希望日后勤加练习，将本门发扬光大。")
		 return
	  else
	    NpcSay("你还没学会法宝，无法领取本门独有法宝！")
        return
	  end
	elseif GetAnswer() == 1 then
		NpcAsk("您确定要成为#大唐官府弟子#W吗？")
		SetAnswer(1,"确定")
		SetAnswer(2,"我在想想")
		WaitAnswer(2)
		if GetAnswer() == 1 then
		  local job = player:GetJob()
		  local sex = player:GetSex()
      if player:GetFaction() ~= 0 then		 
        NpcSay("你已经是有门有派的人了,还来拜什么师？")
        return
      end 
		  if (job == 3 and sex == 0) or (job == 4 and sex == 0) or (job == 4 and sex == 1) then 
		    NpcSay("很好,现在你已是大唐官府弟子,为师传你一招\#P疾风步\#W，方便你随时返回门派。")
		    player:AddSkill(13000)
		    player:SetFaction(7)
		  else
		    NpcSay("本门只收人族弟子,你还是请回吧")
		  end
		end
	elseif GetAnswer() == 6 then

	  if player:GetSkillLv(13000) < 1 then
		  NpcSay("本门武学从不外传。")
		  return
	  end
	  if bProcess then
	    script:OpenInterface("skillshop", 4)
	  end
	elseif GetAnswer() == 4 then
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
				  or player:GetQuests():HasQuest(30605) and player:GetQuests():GetQuest(30605):IsFailed()  then 
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
	  if player:GetSkillLv(13000) < 1 then
		  NpcSay("本门武学从不外传。")
		  return
	  end
	 if bProcess then
		 script:OpenInterface("skillshop", 4)
	  end
	elseif GetAnswer() == 3 then
		if player:GetFaction() == 7 then
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
	elseif GetAnswer() == 4 then
		if player:GetFaction() == 7 then
			local flag = player:GetQuests():GetFlag(19)
			local lv = player:GetLevel()
			NpcAsk("为鼓励本门弟子多向发展，为师特给本门弟子四次重置属性点的机会，但每次需消耗一定的门派贡献。\#Y第一次需门贡\#W：\#G24\#W点；\#Y第二次需门贡\#W：\#G120\#W点；\#Y第三次需门贡\#W：\#G312\#W点；\#Y第四次需门贡\#W：\#G600\#W点；你现在决定要重置属性点吗？")
			SetAnswer(1, "决定")
			SetAnswer(2, "离开")
			WaitAnswer(2)
			if GetAnswer() == 1 then
				if bProcess then
					script:SetSaying(true)
					if flag == 0 then
						if player:GetFDonate() > 23 then
							NpcSay("重置属性点成功。请慎重分配属性点，花费门贡重置属性点还有三次机会。")
							player:ResetCharLevel(lv)
							player:GetQuests():SetFlag(19,1)
							player:ChangeFDonate(-24)
						else
							NpcSay("门派贡献不足24点，无法重置属性点。")
							return
						end
					elseif flag == 1 then
						if player:GetFDonate() > 119 then
							NpcSay("重置属性点成功。请慎重分配属性点，花费门贡重置属性点还有两次机会。")
							player:ResetCharLevel(lv)
							player:GetQuests():SetFlag(19,2)
							player:ChangeFDonate(-120)
						else
							NpcSay("门派贡献不足120点，无法重置属性点。")
							return
						end
					elseif flag == 2 then
						if player:GetFDonate() > 311 then
							NpcSay("重置属性点成功。请慎重分配属性点，花费门贡重置属性点还有一次机会。")
							player:ResetCharLevel(lv)
							player:GetQuests():SetFlag(19,3)
							player:ChangeFDonate(-312)
						else
							NpcSay("门派贡献不足312点，无法重置属性点。")
							return
						end
					elseif flag == 3 then
						if player:GetFDonate() > 599 then
							NpcSay("重置属性点成功。请慎重分配属性点，花费门贡重置属性点还有零次机会。")
							player:ResetCharLevel(lv)
							player:GetQuests():SetFlag(19,4)
							player:ChangeFDonate(-600)
						else
							NpcSay("门派贡献不足600点，无法重置属性点。")
							return
						end
					else
						NpcSay("你已用完四次重置属性点的机会，为师无法再帮助你。据说无名岛燕南天提供免费重置属性点机会，你可去打听打听。")
					end		
				end
			end
		else
			NpcSay("你不是本门弟子，来这里捣什么乱？")
		end
	elseif GetAnswer() == 5 then
		if player:GetFaction() == 7 then	
			NpcAsk("使用\#G200\#W点门派贡献可以在我这里换取一些宝贝，需要换取吗乖徒儿？")
			SetAnswer(1, "换取宝贝")
			SetAnswer(2, "离开")
			WaitAnswer(2)
			
			if GetAnswer() == 1 then
				if player:GetFDonate() >= 200 then
					local freeSlot = player:GetItems():GetFreeSlot(0)
					if freeSlot > 0 then
						if bProcess then
						script:SetSaying(true)
							local ItemId = 0
							local i = math.random(0,99)
							if i < 10 then
								ItemId = 71041
							elseif i < 20 then
								ItemId = 71042
							elseif i < 70 then
								ItemId = RandTable({60011,60021,60031,60041,60051,60061,60071,60081})
							elseif i < 80 then
								ItemId = 66004
							elseif i < 85 then
								ItemId = 60301
							elseif i < 90 then
								ItemId = 60311
							elseif i < 97 then
								if math.random(1,6) == 1 then
									ItemId = 51087
								else
									ItemId = RandTable({51083,51084,51085,51086})
								end
							else
								ItemId = RandTable({51220,51221,51222,51223,51224,51225,51226,51227,51228,51229,51230,51231})
							end
							local ItemName = GetItemName(ItemId)
							NpcSay(string.format("这是为师给你的%s。",ItemName))
							player:GetItems():AddItem(ItemId, 1)
							player:ChangeFDonate(-200)
						end
					else
						NpcSay("(你的当前物品栏已满，请整理后再次换取。)")
					end
				else
					NpcSay("你的门派贡献还不足\#G200\#W，看来你还要为帮里多做贡献才行啊！")
				end	
			end
		else
			NpcSay("你不是本门弟子，来这里捣什么乱？")
		end
	elseif GetAnswer() == 6 then	
	    if player:GetFaction() == 7 then	
			NpcAsk("使用\#G100000\#W银两可以在我这换取\#G10\#W点门派贡献，徒儿需要换取吗？考虑清楚了，为师可没有强迫你。")
			SetAnswer(1, "换取门派贡献")
			SetAnswer(2, "离开")
			WaitAnswer(2)
			if GetAnswer() == 1 then
			    if player:GetMoney() >= 100000 then
				    if bProcess then
					    player:ChangeMoney(-100000)
					    player:ChangeFDonate(10)
						script:SetSaying(true)
					    NpcSay("徒儿好样的，为师没白疼你, Y(^_^)Y")
					end
				else
				    NpcSay("银两不足，无法兑换。")
				end
			end
		else
			NpcSay("你不是本门弟子，来这里捣什么乱？")
		end	
	elseif GetAnswer() == 7 then	
		local flag31000 = player:GetQuests():GetFlag(31000) --15Lv坐骑猪
		local flag31001 = player:GetQuests():GetFlag(31001) --25Lv坐骑狼
		local flag31002 = player:GetQuests():GetFlag(31002) --35Lv坐骑虎
		if player:GetFaction() == 7 then			
			if flag31000 ~= 1 then 
				if player:GetLevel() >= 15 then
					if player:GetPets():GetCount() < player:GetMaxPet() then
						NpcAsk("\#W徒儿你进来武功有所精进，为师欲奖励你一只时限\#P7\#W日的\#P锦猪\#W，还望你日后更加努力，争取为本门争光。")
						SetAnswer(1, "立即领取宠物")
						SetAnswer(2, "稍后再领取")
						WaitAnswer(2)
						if GetAnswer() == 1 then
							if IsProcess() then						
								player:GetPets():AddPet(21)						
								player:GetQuests():SetFlag(31000,1)
								return							
							end
							ShowHint("获得了一只锦猪")
						end
					else
						ShowHint("你的宠物携带数量已达上限。")
					end
				else
					NpcSay("业精于勤而荒于嘻，徒儿你现在修为尚浅，应该多花些心思在习武上。等你有了足够的驾驭能力，为师自会将本门坐骑传授于你。")
				end
			elseif flag31001 ~= 1 then 
				if player:GetLevel() >= 25 then
					if player:GetPets():GetCount() < player:GetMaxPet() then
						NpcAsk("\#W徒儿你进来武功有所精进，为师欲奖励你一只时限\#P7\#W日的\#P苍狼\#W，还望你日后更加努力，争取为本门争光。")
						SetAnswer(1, "立即领取宠物")
						SetAnswer(2, "稍后再领取")
						WaitAnswer(2)
						if GetAnswer() == 1 then
							if IsProcess() then							
								player:GetPets():AddPet(22)						
								player:GetQuests():SetFlag(31001,1)
								return
							end
							ShowHint("获得了一只苍狼")
						end
					else
						ShowHint("你的宠物携带数量已达上限。")
					end
				else
					NpcSay("业精于勤而荒于嘻，徒儿你现在修为尚浅，应该多花些心思在习武上。等你有了足够的驾驭能力，为师自会将本门坐骑传授于你。")
				end
			elseif flag31002 ~= 1 then 
				if player:GetLevel() >= 35 then
					if player:GetPets():GetCount() < player:GetMaxPet() then
						NpcAsk("\#W徒儿你进来武功有所精进，为师欲奖励你一只时限\#P7\#W日的\#P刃虎\#W，还望你日后更加努力，争取为本门争光。")
						SetAnswer(1, "立即领取宠物")
						SetAnswer(2, "稍后再领取")
						WaitAnswer(2)
						if GetAnswer() == 1 then
							if IsProcess() then							
								player:GetPets():AddPet(23)						
								player:GetQuests():SetFlag(31002,1)
								return
							end
							ShowHint("获得了一只刃虎")
						end
					else
						ShowHint("你的宠物携带数量已达上限。")
					end
				else
					NpcSay("业精于勤而荒于嘻，徒儿你现在修为尚浅，应该多花些心思在习武上。等你有了足够的驾驭能力，为师自会将本门坐骑传授于你。")
				end	
			elseif flag31002 == 1 then
				NpcSay("好徒儿，你今日的修为已经达到一定的高度了，而你也不能永远生活在为师的庇护之下。今后的路，就要靠你自己去走了。")
			end	
		else
			NpcSay("本门坐骑只传给本门弟子")
		end
	end
end


AddNpcTable(Npc00534)
