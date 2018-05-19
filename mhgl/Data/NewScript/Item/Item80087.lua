--定义物品表 : 物品表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
Item80087 = {							
} 


function Item80087:MapUse(target)
--[[	if not party  then
		ShowHint("别丢下自己的队友，中国梦幻游泳大赛要大家齐心协力才能完成")
		return
	end
	if party:GetRealMemNum() < 5 then
		ShowHint("别丢下自己的队友，中国梦幻游泳大赛要大家齐心协力才能完成")
		return
	end
	--]]
	for i = 0 ,party:GetRealMemNum() - 1 do
		local member = party:GetInPartyMember(i)
		local q = member:GetQuests():GetQuest(69203)
		if q == nil then
			ShowHint("有人不是和你们同一队上的")
			return
		end
		if q:GetTargetNpcId(1) ~= 300088 then
			ShowHint("有人不是和你们同一队上的")
			return
		end
	end
	
	
	if player:GetMap_id() ~= 2 then
		ShowHint("快快到\#P东海湾\#W江边放下荷灯吧")
		return
	end
	
	if player:GetCurPosY() < 65 then
		ShowHint("请离江边近点吧")
		return
	else
		if player:GetCurPosX() < 69 then
			ShowHint("请离江边近点吧")
			return
		end
	end
	
	if not item:ReduceCount() then return end
	
	for i = 0 ,party:GetRealMemNum() - 1 do
		local member = party:GetInPartyMember(i)
		member:GetQuests():SetFlag(6956,1)
		local lv = member:GetLevel()
		local round = 2
		local Exp = (4*lv+10)*6.6*70*3*(5+round)*5/125    --5倍经验
		local Money = 100*lv*round*10/12   --10倍金钱
		member:ChangeExpForScript(Exp,5)
		member:ChangeMoneyForScript(Money,12010)
		ShowMessage(string.format("\#W获得经验值%d", Exp), member)							
		ShowMessage(string.format("\#W获得金钱%d", Money), member)
--[[		if member:GetItems():GetFreeSlot(0) >0 then
			local r = math.random(1,100)
			local ItemId = 0
			local sign = 0
			if r <= 3 then
				sign = 1
				ItemId = RandTable({60014,60024,60034,60044,60054,60064,60074,60084,63032})
			elseif r<= 10 then
				sign = 1
				ItemId = 63028
			elseif r <= 15 then
				ItemId = 70023
			elseif r <= 20 then
				ItemId = 61082
			elseif r <= 25 then
				sign = 1
				ItemId = 61083
			elseif r <= 30 then
				sign = 1
				ItemId = 41402
			elseif r <= 35 then
				ItemId = RandTable({60013,60023,60033,60043,60053,60063,60073,60083})
			elseif r <= 50 then
				sign = 1
				ItemId = RandTable({53000,53038})
			end
			
			
			if ItemId ~= 0 then
				member:GetItems():AddItemForScript(ItemId,1)
				ShowMessage(string.format("\#W获得物品%s", GetItemName(ItemId)), member)
				if sign == 0 then
					if math.random(1,2) == 1 then
						script:Rumor(string.format("%s \#O积极参与中国梦幻群侠龙舟大赛，接引人奖励其\#B%s\#O一个。",member:GetCharNameLink(),GetItemName(ItemId)),false)
					else
						script:Rumor(string.format("%s \#O中国梦幻群侠龙舟大赛赛表现神勇，接引人被其表现所折服，决定奖励其\#B%s\#O一个。",member:GetCharNameLink(),GetItemName(ItemId)),false)
					end
				end
			end
		end--]]
	end
	
	ItemSayParty("放下了一个小小荷灯，愿各位中国梦幻玩家梦想成真！请速速前往下关挑战吧")
end

function Item80087:CanUse(user, target)
end

-- BattleUse 是用战斗中使用該物品時 call 的
function Item80087:BattleUse(user, target)
end

-- 必需在脚本最後将物品表加入系统中
AddItemTable(Item80087)
