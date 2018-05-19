Preload("Quest30000.lua")
Preload("Quest10602.lua")
Preload("Quest10603.lua")
Preload("Quest10606.lua")
Preload("Quest10607.lua")
Preload("Quest10608.lua")
Preload("Quest10609.lua")
Preload("Quest10611.lua")
Preload("Quest10612.lua")
Preload("Quest23019.lua")

Npc00004= {	
	npc_id = 04,				--李寻欢
	name = GetNpcName(04),
	quests = {Quest10602, Quest10603,Quest10606,Quest10607,Quest10608,Quest10609,Quest10611,Quest10612,Quest23019}			-- NPC 会派出的任务表
}

function Npc00004:Talk(bProcess)
    local Quest = player:GetQuests():GetQuest(30000)
	local quest_ids = {10602,10603,10606,10607,10608,10609,10611,10612}
	local flag429 = player:GetQuests():GetFlag(429)
	local quest23019 = player:GetQuests():GetQuest(23019)
	NpcAsk( "桃李春风一杯酒，江湖夜雨十年灯。江湖儿女闯荡江湖，若能觅得知心挚友，岂非人生最宝贵的财富？在下非常乐意成为各位结义金兰的见证人。" )
	if HasQuest(quest_ids) then
		SetAnswer(1, "主线任务")
	end
	if (player:GetLevel() >= 35 and flag429 == 0) or  quest23019 then
		SetAnswer(2, "新手引导")
	end
	if player:GetQuests():HasQuest(30000)and Quest:GetTargetNpcId(1) == self.npc_id then
		SetAnswer(3, "跑腿任务")
	end	
	SetAnswer(4, "了解结拜系统")
	SetAnswer(5, "我们是来义结金兰的")
	SetAnswer(6, "我是带新兄弟来结拜的")
	SetAnswer(7, "我来设定结拜称号")
	SetAnswer(8, "我要解除结拜关系")
	SetAnswer(9, "我要踢除结拜成员")
	SetAnswer(10, "我就是来看看")
	WaitAnswer(10)
	
	local party = player:GetParty()
	local relationSystem = player:GetRelationSystem()
	if GetAnswer() == 1 then --主线任务
		if HasQuest(10602) then
			if Quest10602:Return() then
				Quest10603:Take()
			end
		elseif HasQuest(10603) then
			Quest10603:Return()
		elseif HasQuest(10606) then
			if Quest10606:Return() then
				Quest10607:Take()
			end
		elseif HasQuest(10607) then
			Quest10607:Return()
		elseif HasQuest(10608) then
			if Quest10608:Return() then
				Quest10609:Take()
			end
		elseif HasQuest(10609) then
			Quest10609:Return()
		elseif HasQuest(10611) then
			if Quest10611:Return() then
				Quest10612:Take()
			end
		elseif HasQuest(10612) then
			Quest10612:Return()
		end
	elseif GetAnswer() == 2 then --新手引导任务
		if player:GetLevel() >= 35 and flag429 == 0 then
			Quest23019:Take()	
		else
			Quest23019:Return()	
		end
	elseif GetAnswer() == 3 then --跑腿任务
		Quest30000:Return()
	
	elseif GetAnswer() == 4 then --了解结拜系统
		NpcAsk( "桃李春风一杯酒，江湖夜雨十年灯。江湖儿女闯荡江湖，若能觅得知心挚友，岂非人生最宝贵的财富？在下非常乐意成为各位结义金兰的见证人。" )
		SetAnswer(1, "我想知道如何结拜")
		SetAnswer(2, "我想知道如何添加新成员")
		SetAnswer(3, "我想知道如何修改称号后缀")
		SetAnswer(4, "我想知道如何解除结拜关系")
		SetAnswer(5, "我已经知道了")
		WaitAnswer(5)
		
		if GetAnswer() == 1 then
			NpcSay("千金易得，挚友难寻。若是遇上了，千万莫要错过。若阁下和你的好友等级≥\#P35\#W级，且好友度≥\#P1000\#W时，在下愿为阁下等结义作个见证。如若你们彼此间的好友度未满\#P1000\#W，但倘能寻来那\#P投名状\#W，在下亦愿成人之美。结拜时需要队长支付\#P100\#W万银两，以示真诚。")
		elseif GetAnswer() == 2 then
			NpcSay("义结金兰之后，若是兄弟未满\#P10\#W人，可随时来找在下添加新成员。添加新成员必须由\#P大哥/大姐\#W带队，且新成员与其他成员的友好度≥\#P1000\#W，或每位新成员身上携带\#P投名状\#W一枚。最多可以\#P10\#W人结拜。")
		elseif GetAnswer() == 3 then
			NpcSay("结义成功后，每位成员都会获得一个专有的称号，并且在下可以为各位更改称号后缀。不过每次修改称号后缀都需要花费\#P10\#W万银两。")
		elseif GetAnswer() == 4 then
			NpcSay("不是每一个盟约都能自始至终被贯彻，再深厚的感情也有可能转淡。在下虽不忍看到背盟败约之事发生，然世事终难预料。倘若阁下与其他兄弟感情破裂已至无可挽回的地步，在下也可替你解除结拜关系。若要踢除结义成员，则需\#P大哥/大姐\#W亲自前来。")
			NpcSay("解除与其他成员的结拜关系，需要花费\#P20\#W万银两。每踢除一名结拜成员，则需要花费\#P30\#W万银两")
		end
		
	elseif GetAnswer() == 5 then --义结金兰
		if party == nil or party:GetRealMemNum() < 2 then
			NpcSay( "阁下只身一人，想与谁结拜呢？" )
			return;
		end
			
		local membername = ""
		for d = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(d)
			if member then
				membername = string.format("%s %s", membername, member:GetName())
			end
		end
		NpcAskParty("你是否愿意与队伍成员义结金兰？")
		SetAnswer(1, "是")
		SetAnswer(2, "否")
		WaitAnswer(2,20)
		for I = 0, party:GetRealMemNum() -1 do
			local ans = GetAnswer(I)
			if ans == 1 then
			
			elseif ans == 2 then
				NpcSayParty( "结义在乎真诚，你们中间有人似乎还不够坦诚呢，等你们考虑好了再来吧。" )
				return;
			end
		end
		
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			if member then
				if member:GetSibling_id() ~= 0 then 
					NpcSayParty("各位少侠，你们之间似乎已经有人已经结拜了。")
					return 
				end
				
				local masters  = GetMessengers(member:GetChar_id(),3)
				if table.getn(masters) ~= 0 then
					for j = 0, party:GetRealMemNum() - 1 do
						local master = party:GetInPartyMember(j)
						if master and master:GetChar_id() ~= member:GetChar_id() and masters[1] == master:GetChar_id() then
							NpcSayParty("各位少侠，你们之间似乎有人有师徒关系呀。")
							return 
						end
					end
				end
				
				local students = GetMessengers(member:GetChar_id(),4)
				if table.getn(students) ~= 0 then
					for b = 0, party:GetRealMemNum() - 1 do
						local student = party:GetInPartyMember(b)
						if student and student:GetChar_id() ~= member:GetChar_id() then
							for k = 1, table.getn(students) do
								if students[k] == student:GetChar_id() then
									NpcSayParty("各位少侠，你们之间似乎有人有师徒关系呀。")
									return 
								end
							end
						end
					end
				end
				
				if member:GetLevel() < 35 then
					NpcSayParty(string.format("若想结义金兰，每位兄弟的修为都不能太差吧，你们当中的\#P%s\#W等级不足35级，不能进行结拜。", member:GetName()))
					return
				end
			end
		end
		
		--local membername = ""; --获取队伍中所有成员的名字
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			if member then
				for j = 0, party:GetRealMemNum() - 1 do
					local member1 = party:GetInPartyMember(j)
					if member1 and member:GetChar_id() ~= member1:GetChar_id() and GetFriendly(member:GetChar_id(),member1:GetChar_id()) < 1000  then
						if IsFriend(member:GetChar_id(),member1:GetChar_id()) == 0 then
							NpcSayParty("你们还不是好友关系，请先加对方为好友!")
							return
						end
						
						if  GetFriendly(member:GetChar_id(),member1:GetChar_id()) < 1 or member1:GetItems():GetItemCount(51092) < 1 then
							NpcSayParty("结拜可不是玩过家家酒，你们彼此之间的友好度不足\#P1000\#W，等各位友情深厚了点再来吧。")
							NpcSayParty("当然，如果各位都能寻来\#P投名状\#W一份，在下也愿为各位结拜作见证人。")
							return
							
						end
					end
				end
				--membername = string.format("%s %s", membername, member:GetName()); --在队伍中循环，每多一个人，则多循环一次，名字+1
			end
		end
			
		if player:GetMoney() < 1000000 then
			NpcSay("结拜需要\#P100\#W万两银子，阁下似乎没这么多银两嘛。")
			return
		end
			
		local sibling_id1 = 0
		local sibling_id2 = 0
		local sibling_id3 = 0
		local sibling_id4 = 0
		if party:Get(1) ~= nil then sibling_id1 = party:Get(1):GetChar_id()  end
		if party:Get(2) ~= nil then sibling_id2 = party:Get(2):GetChar_id()  end
		if party:Get(3) ~= nil then sibling_id3 = party:Get(3):GetChar_id()  end
		if party:Get(4) ~= nil then sibling_id4 = party:Get(4):GetChar_id()  end
		
		if relationSystem ~= nil then
			if IsProcess() then
				relationSystem:CreateSibling(player:GetChar_id(),sibling_id1,sibling_id2,sibling_id3,sibling_id4)
				--script:Rumor(string.format("恭喜\#W%s\#O义结金兰，愿他们永远同心同德，祸福同享，患难与共。", membername), false)
				for i = 0, party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					if member then
						for j = 0, party:GetRealMemNum() - 1 do
							local member1 = party:GetInPartyMember(j)
							if member1 and member:GetChar_id() ~= member1:GetChar_id() and GetFriendly(member:GetChar_id(),member1:GetChar_id()) < 1000  then
								member1:GetQuests():SetFlag(4,1)
							end
						end
					end
				end
			end
		end
	
	elseif GetAnswer() == 6 then --添加新成员
		if player:GetSibling_id() == 0 then --判断是否存在结拜关系
			NpcSay("阁下似乎没有和任何人结拜吧？")
			return
		end
		
		if party == nil or party:GetRealMemNum() < 2 then
			NpcSay( { "请阁下将您的新兄弟一起带来吧。" } )
			return
		end
		
		if relationSystem:GetSiblingRank(player:GetChar_id()) ~= 1 then --检测结拜关系中的排行
			NpcSay( "还是让你们的\#P大哥/大姐\#W带新兄弟来吧。"  )
			return
		end
		
		local membername = ""
		for d = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(d)
			if member then
				membername = string.format("%s %s", membername, member:GetName())
			end
		end
		
		NpcAskParty(string.format("你是否愿意与队伍成员义结金兰？？队伍成员:\#P%s\#W", membername))
		SetAnswer(1, "是")
		SetAnswer(2, "否")
		WaitAnswer(2,20)
		for I = 0, party:GetRealMemNum() -1 do
			local ans = GetAnswer(I)
			if ans == 1 then
			
			elseif ans == 2 then
				NpcSayParty( "结义在乎真诚，你们中间有人似乎还不够坦诚呢，等你们考虑好了再来吧。" )
				return
			end
		end
		
		for b = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(b)
			if member then
				if member:GetChar_id() ~= player:GetChar_id() and member:GetSibling_id() ~= 0 then 
					NpcSayParty("各位少侠，你们之间似乎已经有人已经结拜了。")
					return 
				end
				
				local masters  = GetMessengers(member:GetChar_id(),3)
				if table.getn(masters) ~= 0 then
					for j = 0, party:GetRealMemNum() - 1 do
						local master = party:GetInPartyMember(j)
						if master and master:GetChar_id() ~= member:GetChar_id() and masters[1] == master:GetChar_id() then
							NpcSayParty("各位少侠，你们之间似乎有人有师徒关系呀。")
							return 
						end
					end
				end
				
				local students = GetMessengers(member:GetChar_id(),4)
				if table.getn(students) ~= 0 then
					for b = 0, party:GetRealMemNum() - 1 do
						local student = party:GetInPartyMember(b)
						if student and student:GetChar_id() ~= member:GetChar_id() then
							for k = 1, table.getn(students) do
								if student[k] == student:GetChar_id() then
									NpcSayParty("各位少侠，你们之间似乎有人有师徒关系呀。")
									return 
								end
							end
						end
					end
				end
				
				if member:GetLevel() < 35 then
					NpcSayParty(string.format("若想结义金兰的话，每位兄弟的修为都不能太差吧，你们当中的\#P%s\#W等级不足35级，不能进行结拜。", member:GetName()))
					return
				end
			end
		end
		
		local brotherIds = GetMessengers(player:GetChar_id(),5)--获取队长的结拜关系
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			if member and member:GetChar_id() ~= player:GetChar_id() then
				for a = 1, table.getn(brotherIds) do --table.getn()在一个列表中读取，循环时应从1开始
					local masters  = GetMessengers(member:GetChar_id(),3)
					if table.getn(masters) ~= 0 then
						if masters[1] == brotherIds[a] then --判断新成员的师父是否在队长的结拜兄弟中
							NpcSayParty("各位少侠，你们之间似乎有人有师徒关系呀。")
							return 
						end
					end
					
					local students = GetMessengers(member:GetChar_id(),4)
					if table.getn(students) ~= 0 then
						for k = 1, table.getn(students) do
							if students[k] == brotherIds[a] then
								NpcSayParty("各位少侠，你们之间似乎有人有师徒关系呀。")
								return 
							end
						end
					end
				end
			end
		end
		
		--local membername = ""; --获取队伍中所有成员的名字
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			if member then
				for j = 0, party:GetRealMemNum() - 1 do
					local member1 = party:GetInPartyMember(j)
					if member1 and member:GetChar_id() ~= member1:GetChar_id() and GetFriendly(member:GetChar_id(),member1:GetChar_id()) < 1000  then
						if IsFriend(member:GetChar_id(),member1:GetChar_id()) == 0 then
							NpcSayParty("你们还不是好友关系，请先加对方为好友!")
							return
						end
						if  GetFriendly(member:GetChar_id(),member1:GetChar_id()) < 1 or member1:GetItems():GetItemCount(51092) < 1 then
							NpcSayParty("结拜可不是玩过家家酒，你们彼此之间的友好度不足\#P1000\#W，等各位友情深厚了点再来吧。")
							NpcSayParty("当然，如果各位都能寻来\#P投名状\#W一份，在下也愿为各位结拜作见证人。")
							return
						end
					end
				end
				--membername = string.format("%s %s", membername, member:GetName()); --在队伍中循环，每多一个人，则多循环一次，名字+1
			end
		end
		
		local brotherIds = GetMessengers(player:GetChar_id(),5)--获取队长的结拜关系
		local membername = ""
		for d = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(d)
			if member and member:GetChar_id() ~= player:GetChar_id() then
				for a = 1, table.getn(brotherIds) do --table.getn()在一个列表中读取，循环时应从1开始
					--if  member:GetItems():GetItemCount(51092) < 1 then
					if GetFriendly(member:GetChar_id(),tonumber(brotherIds[a])) < 1000 then
						if  GetFriendly(member:GetChar_id(),tonumber(brotherIds[a])) < 1 or member:GetItems():GetItemCount(51092) < 1 then
							NpcSayParty("若想结义金兰的话，必须每个成员都在线，或各成员之间的友好度≥1000。当前有成员不在线，或与各成员之间的友好度<1000，无法进行结拜。")
							NpcSayParty("当然，如果新加入的成员都能寻来\#P投名状\#W一份，在下也愿成人之美，为各位结拜作见证人。")
							
							return
						end	
					end
				end
			end
			membername = string.format("%s %s", membername, member:GetName())
		end
		
		local newMemberCount = 0;
		local sibling_id1 = 0
		local sibling_id2 = 0
		local sibling_id3 = 0
		local sibling_id4 = 0
		if party ~= nil then
			if party:Get(1) ~= nil then sibling_id1 = party:Get(1):GetChar_id(); newMemberCount = newMemberCount+1;end
			if party:Get(2) ~= nil then sibling_id2 = party:Get(2):GetChar_id(); newMemberCount = newMemberCount+1;end
			if party:Get(3) ~= nil then sibling_id3 = party:Get(3):GetChar_id(); newMemberCount = newMemberCount+1;end
			if party:Get(4) ~= nil then sibling_id4 = party:Get(4):GetChar_id(); newMemberCount = newMemberCount+1;end
		end
		
		local messengers = GetMessengers(player:GetChar_id(),5) -- 参数5代表结拜兄弟
		if (table.getn(messengers)+newMemberCount) > 9 then --判断最大结拜成员数
			NpcSayParty("最多只能有10个兄弟。")
			return
		end
		
		if relationSystem ~= nil then
			if IsProcess() then
				relationSystem:AddSibling(sibling_id1,sibling_id2,sibling_id3,sibling_id4)
				for i = 0, party:GetRealMemNum() - 1 do
					local member = party:GetInPartyMember(i)
					if member and member:GetChar_id() ~= player:GetChar_id() then
						member:GetItems():RemoveItem(51092,1)
					end
				end
			end
			NpcSayParty("恭喜，接纳新成员成功。")
		end

	elseif GetAnswer() == 7 then --修改结拜称号
		if player:GetSibling_id() == 0 then
			NpcSay("阁下似乎没有和任何人结拜吧？")
			return
		end
		
		NpcAsk("每次修改结拜称号后缀需要花费\#P10\#W万银两，你确定要修改称号后缀吗？")
		SetAnswer(1,"是")
		SetAnswer(2,"否")
		WaitAnswer(2)
		
		if GetAnswer(i) == 1 then
			if  player:GetMoney() < 100000 then
				NpcSay("每次修改结拜称号后缀需要花费\#P10\#W万银两，阁下似乎没这么多银两嘛。")
				return
			end
			
			if IsProcess() then
				relationSystem:RequestSetSiblingTitleSuffix()
			end
		end	
	
	elseif GetAnswer() == 8 then --解除结拜关系
		if player:GetSibling_id() == 0 then
			NpcSay("阁下似乎没有和任何人结拜吧？")
			return
		end
		
		NpcAsk("解除结拜关系，需要花费\#P200000\#W两银子，确定要解除关系吗？")
		SetAnswer(1,"是")
		SetAnswer(2,"否")
		WaitAnswer(2)
		
		if GetAnswer(i) == 1 then
			if player:GetMoney() < 200000 then
				NpcSay("解除结拜关系需要花费\#P20\#W万两银子，阁下似乎没这么多银两嘛。")
				return
			end
			
			if IsProcess() then
				relationSystem:RemoveSibling(player:GetChar_id())
				player:ChangeMoney(-200000,71)
			end
			NpcSay("你已经解除了结拜关系。")
		end
		
	elseif GetAnswer() == 9 then --踢除成员
		local brotherIds = GetMessengers(player:GetChar_id(),5)
		if table.getn(brotherIds) == 0 then
			NpcSay("阁下似乎没有结义兄弟姐妹吧？")
			return
		end
		
		if relationSystem:GetSiblingRank(player:GetChar_id()) ~= 1 then --检测结拜关系中的排行
			NpcSay( "阁下似乎没有这个权力吧。"  )
			return
		end
		
		if player:GetMoney() < 300000 then
			NpcSay("踢除结拜成员需要花费\#P30\#W万两银子，阁下似乎没这么多银两嘛。")
			return
		end
		
		local brotherNames = GetMessengersName(player:GetChar_id(),5);
		NpcAsk("请选择你要踢除的成员：")
		for i=1,table.getn(brotherNames) do
			SetAnswer(i, string.format("%s [ID:%d]",tostring(brotherNames[i]),tonumber(brotherIds[i])));
		end
		SetAnswer(table.getn(brotherNames)+1,"取消")
		WaitAnswer(table.getn(brotherNames)+1)
		local ans = GetAnswer(i);
		if ans == table.getn(brotherNames)+1 then
			return
		end
		
		NpcAsk("确定要将踢除该成员吗？")
		SetAnswer(1,"是")
		SetAnswer(2,"否")
		WaitAnswer(2);
		if GetAnswer(i) == 1 then
			if IsProcess() then
				relationSystem:RemoveSibling(brotherIds[ans])
				player:ChangeMoney(-300000,71)
			end
			NpcSay("踢除成员成功。")
		end	
	end
end

AddNpcTable(Npc00004)

