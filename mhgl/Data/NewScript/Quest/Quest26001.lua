-- 定义任务表 : 任务表是个 lua table, 名称要与脚本名称相同
Quest26001 = {
	quest_id = 26001,							-- 任务 ID
	type_id = 26,								-- 大类 ID
	type_name = "江湖历练",
	round_info = {max_round = 300,limit_type = 2}, 
	name = "替人寻物",							-- 任务名称
	tips = "任务物品可以通过在满经验的野外练级场景打怪或者与其他玩家交易获得，也可以使用商城道具“江湖行”完成当前任务",
	feature = { "nocancel"},			-- 任务特性
}
function Quest26001:Take()
	if not HasQuest(26001) then
		local npcList = {}
			npcList = {
			    {npc_id = 34,   map_id = 2},--东海湾
			    {npc_id = 28,   map_id = 2},
			    {npc_id = 49,   map_id = 6},--江南野外
			    {npc_id = 65,   map_id = 7},--傲来国
			    {npc_id = 85,   map_id = 8},--花果山
			    {npc_id = 86,   map_id = 8},
			    {npc_id = 80,   map_id = 10},--女儿村
			    {npc_id = 81,   map_id = 10},
			    {npc_id = 82,   map_id = 10},
			    {npc_id = 79,   map_id = 10},
			    {npc_id = 100,   map_id = 11},--北俱芦洲
			    {npc_id = 98,   map_id = 11},
			    {npc_id = 96,   map_id = 11},
			    {npc_id = 101,   map_id = 11},
			    {npc_id = 97,   map_id = 11},
			    {npc_id = 99,   map_id = 11},
			    {npc_id = 109,   map_id = 12},--长寿村郊外
			    {npc_id = 111,   map_id = 12},
			    {npc_id = 110,   map_id = 12},
			    {npc_id = 108,   map_id = 12},
			    {npc_id = 121,   map_id = 13},--天宫
			    {npc_id = 122,   map_id = 13},
			    {npc_id = 124,   map_id = 13},
			    {npc_id = 158,   map_id = 14},--大唐境外
			    {npc_id = 127,   map_id = 14},
			    {npc_id = 157,   map_id = 14},
			    {npc_id = 133,   map_id = 14},
			    {npc_id = 153,   map_id = 14},
			    {npc_id = 134,   map_id = 14},
			    {npc_id = 132,   map_id = 14},
			    {npc_id = 131,   map_id = 14},
			    {npc_id = 161,   map_id = 14},
			    {npc_id = 136,   map_id = 14},
			    {npc_id = 137,   map_id = 14},
			    {npc_id = 135,   map_id = 14},
			    {npc_id = 160,   map_id = 14},
			    {npc_id = 138,   map_id = 14},
			    {npc_id = 145,   map_id = 14},
			    {npc_id = 141,   map_id = 14},
			    {npc_id = 144,   map_id = 14},
			    {npc_id = 147,   map_id = 14},
			    {npc_id = 146,   map_id = 14},
			    {npc_id = 151,   map_id = 14},
			    {npc_id = 148,   map_id = 14},
			    {npc_id = 149,   map_id = 14},
			    {npc_id = 197,   map_id = 19},--大唐国境
			    {npc_id = 188,   map_id = 19},
			    {npc_id = 195,   map_id = 19},
			    {npc_id = 204,   map_id = 20},--地府
			    {npc_id = 202,   map_id = 20},
			    {npc_id = 203,   map_id = 20},
			    {npc_id = 209,   map_id = 21},--龙宫
			    {npc_id = 216,   map_id = 21},
			    {npc_id = 213,   map_id = 21},
			    {npc_id = 210,   map_id = 21},
			    {npc_id = 230,   map_id = 26},--普陀山
			    {npc_id = 227,   map_id = 26},
			    {npc_id = 228,   map_id = 26},
			    {npc_id = 235,   map_id = 28},--化生寺
			    {npc_id = 238,   map_id = 28},
			    {npc_id = 239,   map_id = 28},
			    {npc_id = 241,   map_id = 29},--方寸山
			    {npc_id = 242,   map_id = 29},
			    {npc_id = 488,   map_id = 84},--朱紫国
			    {npc_id = 489,   map_id = 84},
			    {npc_id = 550,   map_id = 108},--长寿村
			    {npc_id = 567,   map_id = 108},
			    {npc_id = 560,   map_id = 108},
			    {npc_id = 561,   map_id = 108},
			    {npc_id = 564,   map_id = 108},
			    {npc_id = 565,   map_id = 108}}
	
	
	
	
	
	
		for m = 1, 1000 do
			local npcId = npc and npc:GetNpc_id() or 0		
			local r = RandTable(npcList)				-- 随机从 table 中取一个 object
			local npcName = GetNpcName(r.npc_id)
			local ItemList7080 = {}
			local ItemList5060 = {}
			local ItemListOther = {}
			local RandNum = math.random(1,100)

			  ItemList7080 = {
			  {item_id = 20452},--金蛇信
			  {item_id = 20453},--丈八点钢矛
			  {item_id = 20461},--阴风扇
			  {item_id = 20462},--风云雷电
			  {item_id = 20470},--水晶棒
			  {item_id = 20471},--日月光华
			  {item_id = 20479},--华光刺
			  {item_id = 20480},--龙鳞刺
			  {item_id = 20488},--狂魔镰
			  {item_id = 30489},--恶龙之齿
			  {item_id = 20497},--巨灵神锤
			  {item_id = 20498},--天崩地裂
			  {item_id = 20506},--子母双月
			  {item_id = 20507},--斜月狼牙
			  {item_id = 20515},--缚神绫
			  {item_id = 20516},--九天仙绫
			  {item_id = 20524},--北斗七星剑
			  {item_id = 20525},--碧玉剑
			  {item_id = 20533},--龙鳞宝刀
			  {item_id = 20534},--黑炎魔刀
			  {item_id = 20542},--墨玉双剑
			  {item_id = 20543},--梅花双剑
			  {item_id = 20551},--乾坤帽
			  {item_id = 20552},--黑魔冠
			  {item_id = 20560},--魔女发冠
			  {item_id = 20561},--七彩花环
			  {item_id = 20569},--龙骨甲
			  {item_id = 20570},--死亡斗篷
			  {item_id = 20578},--流云素裙
			  {item_id = 20579},--七宝天衣
			  {item_id = 20591},--兽王腰带
			  {item_id = 20592},--百窜云
			  {item_id = 20593},--八卦锻带
			  {item_id = 20594},--圣王坠
			  {item_id = 20602},--九州履
			  {item_id = 20603},--万里追云履
			  {item_id = 20614},--八卦坠
			  {item_id = 20615},--碧水青龙
			  {item_id = 20616},--鬼牙攫魂
			  {item_id = 20617},--万里卷云
			  {item_id = 20618}}--疾风之铃
			 
			 ItemList5060 = {{item_id = 20450},--墨杆金钩
			  {item_id = 20451},--玄铁矛
			  {item_id = 20459},--劈水扇
			  {item_id = 20460},--神火扇
			  {item_id = 20468},--幽路引魂
			  {item_id = 20469},--满天星
			  {item_id = 20477},--玄冰刺
			  {item_id = 20478},--青刚刺
			  {item_id = 20486},--黄金钺
			  {item_id = 20487},--乌金鬼头镰
			  {item_id = 20495},--破甲战锤
			  {item_id = 20496},--震天锤
			  {item_id = 20504},--赤炎环
			  {item_id = 20505},--蛇形月
			  {item_id = 20513},--云龙绸带
			  {item_id = 20514},--七彩罗刹
			  {item_id = 20522},--黄金剑
			  {item_id = 20523},--游龙剑
			  {item_id = 20531},--破天宝刀
			  {item_id = 20532},--狼牙刀
			  {item_id = 20540},--鱼骨双剑
			  {item_id = 20541},--赤焰双剑
			  {item_id = 20549},--羊角盔
			  {item_id = 20550},--水晶帽
			  {item_id = 20558},--媚狐头饰
			  {item_id = 20559},--玉女发冠
			  {item_id = 20567},--钢甲
			  {item_id = 20568},--夜魔披风
			  {item_id = 20576},--金缕羽衣
			  {item_id = 20577},--霓裳羽衣
			  {item_id = 20588},--魔童大牙
			  {item_id = 20589},--攫魂铃
			  {item_id = 20590},--双魂引
			  {item_id = 20600},--绿靴
			  {item_id = 20601},--追星踏月
			  {item_id = 20612},--高速之星
			  {item_id = 20613}}--风月宝链
			 
			 ItemListOther = {
			  {item_id = 30011},--康乃馨
			  {item_id = 30014},--牡丹
			  {item_id = 30015},--百合
			  {item_id = 30016},--竖琴
			  {item_id = 30019},--编钟
			  {item_id = 30020},--木鱼
			  {item_id = 30021},--琵琶
			  {item_id = 30022},--唢呐
			  {item_id = 20023},--笛子
			  {item_id = 10074},--顺逆神针
	    	{item_id = 10027},--小还丹
	    	{item_id = 10028},--千年保心丹
	    	{item_id = 10029},--风水混元丹
	    	{item_id = 10030},--金香玉
	    	{item_id = 10047},--蛇蝎美人
	    	{item_id = 10048},--定神香
	    	{item_id = 10049},--九转还魂丹
	    	{item_id = 10050},--十香返生丸
	    	{item_id = 10051},--红雪散
	    	{item_id = 10052},--五龙丹
	    	{item_id = 10008},--佛光舍利子
	    	{item_id = 30008},--玫瑰花
	    	{item_id = 30011},--康乃馨
	    	{item_id = 30014},--牡丹
	    	{item_id = 30015},--百合
	    	{item_id = 30016},--竖琴
	    	{item_id = 30017},--箫
	    	{item_id = 30018},--钹
	    	{item_id = 30019},--编钟
	    	{item_id = 30020},--木鱼
	    	{item_id = 30021},--琵琶
	    	{item_id = 30022},--唢呐
	    	{item_id = 30023},--笛子
	    	{item_id = 10073},--魔睛子
	    	{item_id = 10072},--寸阴若梦
	    	{item_id = 10071},--回龙摄魂镖
	    	{item_id = 10070},--含沙射影
	    	{item_id = 10069},--孔雀翎
	    	{item_id = 10068},--无影神针
	    	{item_id = 10067},--铁蒺藜
	    	{item_id = 10066},--飞蝗石
	    	{item_id = 10065}}--飞刀
			 
			  local R = RandTable(ItemList7080)	
			  if RandNum < 5 then
			     R = RandTable(ItemList5060)
			  elseif RandNum < 10 then
			     R = RandTable(ItemListOther)
			  end
			  local ItemName = GetItemName(R.item_id)	
			  if r.npc_id ~= npcId then	
				  self.target_item = {R}	
				  self.descript = string.format("替%s找到\#P%s\#W送去。",npcName,ItemName)
				  self.end_npc = { npc_id = r.npc_id, map_id = r.map_id }
				  NpcSay({string.format("听说%s最近在收集\#P%s\#W，你若能找到就替我送过去吧。",npcName,ItemName),
						string.format("%s前几日丢失了\#P%s\#W，你去帮忙找找吧。",npcName,ItemName)})
				  player:GetQuests():SetFlag(26001,0)
				  player:GetQuests():SetFlag(16,0)
				  AddQuest(self)
				  return
			  end
		  end
	else
		NpcSay("先把手里的事办完了再说吧。")
	end
end

function Quest26001:TakeAgain()
	local qtype = player:GetQuests():GetType(self.type_id)
	local quest26005 = player:GetQuests():GetQuest(26005) 
	local Item = quest26005:GetTargetItemId(1)
	local num = quest26005:GetTargetItemMax(1)
	local npcId = quest26005:GetEndNpcId()
	local round = qtype:GetRound()
	local mapId = quest26005:GetEndMapId()
	local npcName = GetNpcName(npcId)
	local ItemName = GetItemName(Item)	
	
	player:GetQuests():RemoveQuest(26005) 
	self.target_item = {{item_id = Item,count = num}}
	self.descript = string.format("替%s找到\#P%s",npcName,ItemName)
	self.end_npc = { npc_id = npcId, map_id = mapId }
	AddQuest(self)
	qtype:SetRound(round)
	player:GetQuests():GetQuest(26001):UpdateData()
end

function Quest26001:Init()
    local qtype = player:GetQuests():GetType(self.type_id)
	qtype:SetRound(0)
	player:GetQuests():GetQuest(26001):UpdateData()
end

function Quest26001:Return()
	if player:GetQuests():GetQuest(26001):IsFailed() then
		NpcSay("任务已失败，可在陆萧然处删除任务。")
		return
	end
	local qtype = player:GetQuests():GetType(self.type_id)
	if qtype == nil then return false end
	local round = qtype:GetRound()
	local quest = player:GetQuests():GetQuest(self.quest_id)
	local freeSlot = player:GetItems():GetFreeSlot(0)
	local rexp = math.random(9500,10500)/10000
	local lv = player:GetLevel()
	local Exp = 0
	local buff = player:HasBuff(218) and 2 or 1
	if player:HasBuff(219) then
		buff = 3
	end
	local EPH =(4 * lv + 10) * 6.6 * 70 
	Exp = math.floor(EPH * buff) * 5
	Exp = Exp + (Exp*round/200)
	--允许交打造和绑定
	--ItemData = GetItemCsvData(UInt32 item_id); 取武器在csv里的字段数据
	--ItemData.reqLv == 90 之类的 可以用作提交 90~140 同名武器装备等方法
	local TargetItem = quest:GetTargetItemId(1)
	local TargetItemName = GetItemName(TargetItem)
	local TargetItemCount = quest:GetTargetItemMax(1)
	local Find = 0
	if not player:GetItems():HasItem(TargetItem) then -- 如果包内没有目标任务道具时，检测是否有相同物品
	   for x = 10110, 10525 do
		  if GetItemName(x) == TargetItemName and player:GetItems():HasItem(x) then
		     quest:SetTargetItem(1,x,TargetItemCount,0,0,0,0)
			 Find = 1
			 break
		  end
	   end
	   if Find == 0 then
	      for x = 20261, 20444 do
		    if GetItemName(x) == TargetItemName and player:GetItems():HasItem(x) then
		       quest:SetTargetItem(1,x,TargetItemCount,0,0,0,0)
			   Find = 1
			   break
		    end
	      end
	   end
	end
	
	
	
	local i = math.random(1,2)
	if  not QuestCompleted(self) then
		local quest26001 = player:GetQuests():GetQuest(26001) 
		local Item = quest26001:GetTargetItemId(1)
		local A = player:GetGoodness()
		if player:GetItems():HasItem(61282) or A > 100 then
			NpcAsk(string.format("你确定使用一个“江湖行”,或使用“善恶点”来完成当前任务吗? \r少侠当前的善恶点为:#P%s",A))
			SetAnswer(1, "使用“江湖行”")
			SetAnswer(2, "使用“善恶点”")
			SetAnswer(3, "离开")
			WaitAnswer(3)
			if GetAnswer() == 2 then
				if IsProcess() then	
					script:SetSaying(true)
					if A < 100 then
					  NpcSay(string.format("少侠当前的善恶点为#P%s#W,完成任务需要消耗100点任务点,当前点数不足~！",A))
					  return
					end
					player:ChangeGoodnessForScript(-100, 44)
					if round == 50  then
						if player:GetItems():GetFreeSlot(0) < 1 then
							NpcSay(string.format("请整理你的当前包裹，至少预留1个位置。"))
							return 
						end
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600032})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					
					  end
					elseif round == 100  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600016})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
		
					  end
					elseif round == 150  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600017})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					elseif round == 200  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600033})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					elseif round == 250  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600033})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					elseif round == 300  then
						if lv >=90 and lv <= 201 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({600017})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					 
					  end
					end
					local p = math.random(1,50)
					local pp = math.random(1,100)
					local itemN = 1
					if p < 3 then
					  item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091})
					  if pp == 98 then
					     item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091,92001,92002,92003,92004,92005})
					  end
					  if item > 15005 and item < 15010 then
					     itemN = math.random(1,3)
					  end
					  if item == 80053 then
					     itemN = math.random(1,3)
					  end
					  name = GetItemName(item)
					  ShowError(string.format("\#W获得%s",name))
					  script:Rumor(string.format("\#W%s\#O在跑环过程中，意外获得了NPC奖励的\#B%d\#O个\#B%s\。", player:GetName(),itemN, name), false)	
					  player:GetItems():AddItem(item, itemN)
					end
					
					player:ChangeExp(Exp)
					local money = lv * 100 * 0.7 * math.random(2,3)
					player:ChangeMoney(money,303)
					ShowError(string.format("\#W获得经验值%d",Exp))
					ShowError(string.format("\#W获得银两%d",money))
					player:GetItems():RemoveItem(quest:GetTargetItemId(1),quest:GetTargetItemMax(1))
					local QuestFlagA = player:GetQuests():GetFlag(55201) -- 任务链计数 BB进阶专用
	                player:GetQuests():SetFlag(55201, QuestFlagA + 1) -- 任务链计数 BB进阶专用
					NpcSay("有劳了。")
					RemoveQuest(self)
					if round >= 300  then
						NpcSay("辛苦了，所有的事情都忙完了。")
			      player:GetQuests():RemoveQuest(26001)
			      qtype:SetRound(0)
						return
					end
					local i = math.random(1,2)
					if i == 1 then 
					  Quest26001:Take()
					elseif i == 2 then 
					  Quest26002:Take()
					end
				end
			elseif GetAnswer() == 1 then
				if IsProcess() then	
					script:SetSaying(true)
					if player:GetItems():GetItemCount(61282) < 1 then
					  NpcSay("少侠身上没有江湖行！")
					  return
					end
					player:GetItems():RemoveItem(61282)
					if round == 50  then
						if player:GetItems():GetFreeSlot(0) < 1 then
							NpcSay(string.format("请整理你的当前包裹，至少预留1个位置。"))
							return 
						end
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					elseif round == 100  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					elseif round == 150  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					elseif round == 200  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					elseif round == 250  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					elseif round == 300  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					end
					local p = math.random(1,50)
					local pp = math.random(1,100)
					local itemN = 1
					if p < 3 then
					  item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091})
					  if pp == 98 then
					     item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091,92001,92002,92003,92004,92005})
					  end
					  if item > 15005 and item < 15010 then
					     itemN = math.random(1,3)
					  end
					  if item == 80053 then
					     itemN = math.random(1,3)
					  end
					  name = GetItemName(item)
					  ShowError(string.format("\#W获得%s",name))
					  script:Rumor(string.format("\#W%s\#O在跑环过程中，意外获得了NPC奖励的\#B%d\#O个\#B%s\。", player:GetName(),itemN, name), false)	
					  player:GetItems():AddItem(item, itemN)
					end
					
			        player:ChangeExp(Exp)
			        local money = lv * 100 * 0.7 * math.random(2,3)
			        player:ChangeMoney(money,303)
			        ShowError(string.format("\#W获得经验值%d",Exp))
			        ShowError(string.format("\#W获得银两%d",money))
					player:GetItems():RemoveItem(quest:GetTargetItemId(1),quest:GetTargetItemMax(1))
					local QuestFlagA = player:GetQuests():GetFlag(55201) -- 任务链计数 BB进阶专用
	                player:GetQuests():SetFlag(55201, QuestFlagA + 1) -- 任务链计数 BB进阶专用
					NpcSay("有劳了。")
					RemoveQuest(self)
					if round >= 300  then
						NpcSay("辛苦了，所有的事情都忙完了。")
			      player:GetQuests():RemoveQuest(26001)
			      qtype:SetRound(0)
						return
					end
					local i = math.random(1,2)
					if i == 1 then 
					  Quest26001:Take()
					elseif i == 2 then 
					  Quest26002:Take()
					end
				end
			end
		else
			NpcSay(string.format("在哪才有\#P%s\#W这东西呢，你知道吗？",GetItemName(Item)))
		end
	else
		if IsProcess() then	
			script:SetSaying(true)
			if round == 50 then
				if player:GetItems():GetFreeSlot(0) < 1 then
					NpcSay(string.format("请整理你的当前包裹，至少预留1个位置。"))
					return 
				end
				local i = math.random(1,5)
				if lv >=90 and lv <= 99 then
				  if i == 1 then
				    item = 600031
				    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
			      elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
					      name = "百炼精铁"
					      player:GetItems():AddItem(item, 1)
					      ShowError(string.format("\#W获得%s",name))
					  elseif i == 2 then
						   item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						   name = GetItemName(item)
						   player:GetItems():AddItem(item, 1)
					  ShowError(string.format("\#W获得%s",name))
					end
				end
					elseif round == 100  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					elseif round == 150  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
			
			
			
			
					elseif round == 200  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
			
			
			
			
					elseif round == 250  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
			
			
					elseif round == 300  then
						if lv >=90 and lv <= 99 then
						  if i == 1 then
						    item = 600031
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20078,20094,20110,20126,20142,20158,20174,20190,20206,20222,20238,60309,60034,60050,60067,60083,60099,60115,60309})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 100 and lv <= 109 then
					    if i == 1 then
						    item = 20255
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60035,60051,60068,60084,60100,60116})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 110 and lv <= 119 then
					    if i == 1 then
						    item = 20256
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60311,60036,60052,60069,60085,60101,60117,60311})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 120 and lv <= 129 then
					    if i == 1 then
						    item = 20257
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20081,20097,20113,20129,20145,20161,20177,20193,20209,20225,20241,60312,60037,60053,60070,60086,60102,60118,60312})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 130 and lv <= 139 then
					    if i == 1 then
						    item = 20258
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20082,20098,20114,20130,20146,20162,20178,20194,20210,20226,20242,60313,60038,60054,60071,60087,60103,60119,60313})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 140 and lv <= 149 then
					    if i == 1 then
						    item = 20259
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20083,20099,20115,20131,20147,20163,20179,20195,20211,20227,20243,60314,60039,60055,60072,60088,60104,60120,60314})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  elseif lv >= 150 then
					    if i == 1 then
						    item = 20260
						    name = "百炼精铁"
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	elseif i == 2 then
						    item = RandTable({20084,20100,20116,20132,20148,20164,20180,20196,20212,20228,20244,60315,60040,60056,60073,60089,60105,60121,60315})
						    name = GetItemName(item)
						    player:GetItems():AddItem(item, 1)
					  	  ShowError(string.format("\#W获得%s",name))
					  	end
					  end
					end
					local p = math.random(1,50)
					local pp = math.random(1,100)
					local itemN = 1
					if p < 3 then
					  item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091})
					  if pp == 98 then
					     item = RandTable({30001,20001,15006,15007,15008,15009,60136,60134,80053,80091,92001,92002,92003,92004,92005})
					  end
					  if item > 15005 and item < 15010 then
					     itemN = math.random(1,3)
					  end
					  if item == 80053 then
					     itemN = math.random(1,3)
					  end
					  name = GetItemName(item)
					  ShowError(string.format("\#W获得%s",name))
					  script:Rumor(string.format("\#W%s\#O在跑环过程中，意外获得了NPC奖励的\#B%d\#O个\#B%s\。", player:GetName(),itemN, name), false)	
					  player:GetItems():AddItem(item, itemN)
					end
					
			player:ChangeExp(Exp)
			local money = lv * 100 * 0.7 * math.random(2,3)
			player:ChangeMoney(money,303)
			ShowError(string.format("\#W获得经验值%d",Exp))
			ShowError(string.format("\#W获得银两%d",money))
			player:GetItems():RemoveItem(quest:GetTargetItemId(1),quest:GetTargetItemMax(1))
			local QuestFlagA = player:GetQuests():GetFlag(55201) -- 任务链计数 BB进阶专用
	        player:GetQuests():SetFlag(55201, QuestFlagA + 1) -- 任务链计数 BB进阶专用
			NpcSay("有劳了。")
			RemoveQuest(self)
			if round >= 300  then
				NpcSay("辛苦了，所有的事情都忙完了。")
			  player:GetQuests():RemoveQuest(26001)
			  qtype:SetRound(0)
				return
			end
			local i = math.random(1,2)
			if i == 1 then
			  Quest26001:Take()
			elseif i == 2 then
			  Quest26002:Take()
			end			
		end
	end
end

-- 必需在脚本最后将任务表加入系统中
AddQuestTable(Quest26001)