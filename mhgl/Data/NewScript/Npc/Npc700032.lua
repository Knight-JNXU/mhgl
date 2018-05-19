--2015-04-15---药罐子
Npc7010= {	
	npc_id = 7010,				
	name = GetNpcName(7010),
}

function Npc7010:Talk(self,bProcess)
	local Day = LuaI.GetRealDay(LuaI.GetServiceTime())--当月天数
	local num = player:GetQuests():GetNpcFlag(7010, Day, 0)
NpcAsk(string.format("#R%s#W,只要你每次上交#Y“欢庆开服”#W给我，就可以得到随机各种物品奖历，保证不会让白费功夫！并且全服提交数量达到#R100#W的时候，我会为大家开启#Y“全服活动”#W，惊喜不断！快来参与吧\r#R目前全服进度:#A%s％", player:GetName(),num), false)
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
		local num = player:GetQuests():GetNpcFlag(7010, Day, 0)--NPC的值
		local a = 0
		if	num <= 10 then--判定饱食度并且制定物品数量
			a = 1 
		elseif num <= 30 then
			a = 2
		elseif num <= 70 then
			a = 4
		else			
			a = 5
		end
		if player:GetItems():GetItemCount(61300) >= a then--判定有无指定物品
			if freeSlot > 0 then--判定包裹位置是否大于0
				local item = 0
				local jl = math.random(1,100) --设定物品循环数范围
				if jl < 30 then
					item = RandTable({20001,15006,15007,15008,15009,30001,20001,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095})--当循环数小于5,那么物品为...
				elseif jl < 45 then
					item = RandTable({30001,20001})--当循环数小于10,那么物品为...
				elseif jl < 65 then
					item = RandTable({40041,20002,20003,20004})--当循环数小于15,那么物品为...
				elseif jl < 99 then
					item = RandTable({20005,20006,30001,402800,402801,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109})--当循环数小于20,那么物品为...
				else
					item = RandTable({20000})--当循环数不在以上范围~,那么物品为...
				end
				
				if IsProcess() then
					player:GetQuests():RemoveTimeMark(7009)--删除时间值
					player:GetQuests():SetTimeMark(7009)--赋予时间值
					player:GetItems():RemoveItem(61300, a)--删除指定物品
					player:GetItems():AddItem(item, 1)
					player:GetQuests():SetNpcFlag(7010, Day, 0, num + 1)
					if	num >= 95 then
						player:GetQuests():SetNpcFlag(7010, Day, 0, num - num)
						if npc then
							npc:Destroy()
							local oneMap1 = {{map_id = 34, x1 = 10, y1 = 10, x2 = GetMap(34):GetWidth()-10, y2 = GetMap(34):GetHeight()-10}}
							local npc_id = 401123			
							local i = 0
							while i < 10 do
								local loc1 = RandMapLoc(oneMap1)
								if loc1 then
									script:GenerateNPC(npc_id, loc1.map_id, loc1.x, loc1.y, true, 1500)
								end
								i = i + 1;
							end		
							if npc then
								npc:SetEnableBattle(false)
								script:Rumor(string.format("#R“普天同庆”#O活动现在开启，现有#Y10#O只送礼使者出现在长安随机位置。大家赶紧找到去抢劫吧！"), false)
								script:Rumor(string.format("#R“普天同庆”#O活动现在开启，现有#Y10#O只送礼使者出现在长安随机位置。大家赶紧找到去抢劫吧！"), false)
															end
							local map = {{map_id=34,x1=4,y1=28,x2=66, y2=153,npc_id = 401123}}
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
				ShowHint("恭喜你获得奖励")				
			else
				NpcSay("包满了")	
			end
		else	
			NpcSay(string.format("没有#P“欢乐开服”#A你胡乱点什么？\r进度不同,需要的数量也不同~", player:GetName()), false)	
		end
	end
end

AddNpcTable(Npc7010)