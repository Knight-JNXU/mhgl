--2015-04-15---药罐子
Npc17010= {	
	npc_id = 17010,				
	name = GetNpcName(17010),
}

function Npc17010:Talk(self,bProcess)
	local Day = LuaI.GetRealDay(LuaI.GetServiceTime())--当月天数
	local num = player:GetQuests():GetNpcFlag(17010, Day, 0)
NpcAsk(string.format("%s#W,你们五人的邀请令牌都要上交给我才行，不然拒绝参与本次大法\r#R目前你们队员集合的进度为:#A %s％", player:GetName(),num), false)
	SetAnswer(1, "我要为本服做贡献")
	SetAnswer(2, "离开")
	WaitAnswer(2)
	if GetAnswer() == 1 then--选择第一个选项
		if player:GetQuests():TimeMarkOver(7009, 0) == false then
			ShowHint("#O猪王大哥需要时间消化,请1分钟后再来吧。#64")
			return 
		end
		local freeSlot = player:GetItems():GetFreeSlot(0)--包裹
		local Day = LuaI.GetRealDay(LuaI.GetServiceTime())--当月天数
		local num = player:GetQuests():GetNpcFlag(17010, Day, 0)--NPC的值
		local a = 0
		if	num <= 10 then--判定饱食度并且制定物品数量
			a = 1 
		elseif num <= 30 then
			a = 1
		elseif num <= 70 then
			a = 1
		else			
			a = 1
		end
		if player:GetItems():GetItemCount(402900) >= a then--判定有无指定物品
			if freeSlot > 0 then--判定包裹位置是否大于0
				local item = 0
				local jl = math.random(1,100) --设定物品循环数范围
				if jl < 100 then
					item = RandTable({402901})--当循环数不在以上范围~,那么物品为...
				end
				
				if IsProcess() then
					player:GetQuests():RemoveTimeMark(7009)--删除时间值
					player:GetQuests():SetTimeMark(7009)--赋予时间值
					player:GetItems():RemoveItem(402900, a)--删除指定物品
					player:GetItems():AddItem(item, 1)
					player:GetQuests():SetNpcFlag(17010, Day, 0, num + 25)
					if	num >= 95 then
						player:GetQuests():SetNpcFlag(17010, Day, 0, num - num)
						if npc then
						--	npc:Destroy()
							local oneMap1 = {{map_id = 87, x1 = 10, y1 = 10, x2 = GetMap(87):GetWidth()-10, y2 = GetMap(87):GetHeight()-10}}
							local npc_id = 403011			
							local i = 0
							while i < 2 do
								local loc1 = RandMapLoc(oneMap1)
								if loc1 then
									script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 1500)
								end
								i = i + 1;
							end		
							if npc then
							npc:SetEnableBattle(false)
								script:Rumor(string.format("水陆法会竟然遭遇妖怪的破坏，也不知道有没有大侠能够收拾他们"), false)
															end
							local map = {{map_id=87,x1=4,y1=28,x2=66, y2=153,npc_id = 403011}}
							local map_id, x1, y1,x2,y2,npc_id
							local loc = RandTable(map)
								map_id = loc.map_id 
								x1 = loc.x1
								y1 = loc.y1
								x2 = loc.x2
								y2 = loc.y2
								npc_id = loc.npc_id
							local oneMap = { {  map_id = map_id , x1 = x1, y1 = y1, x2 = x2 - 10 , y2 = y2 -10 }}
							for i = 1, 1 do
								local loc1 = RandMapLoc(oneMap)
								if loc1 then
									script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 1200, 1)
								end
							end
						end
					end
				end
				ShowHint("感谢大侠前来参加法会")				
			else
				NpcSay("包满了")	
			end
		else	
			NpcSay(string.format("你这种没有身份的人怎么能参加这么高档的大会", player:GetName()), false)	
		end
end
end

AddNpcTable(Npc17010)