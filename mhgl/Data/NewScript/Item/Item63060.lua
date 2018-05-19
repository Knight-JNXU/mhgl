--北方_高级秘籍宝盒

Item63028= {
}

function Item63028:MapUse(target)
	ItemAsk("是否打开高级秘籍宝盒？")
	SetAnswer(1, "打开")
	SetAnswer(2, "暂时不打开")
	WaitAnswer(2)
	
	if GetAnswer() == 1 then
		local FreesLot = player:GetItems():GetFreeSlot(0)
		if FreesLot >= 1 then
			if not item:ReduceCount() then return end									
			--高级武学秘籍
			local ItemListZ = {
  {itemid = 40000, itemname = "高级反击"}, 
  {itemid = 40001, itemname = "高级反震"}, 
  {itemid = 40002, itemname = "高级吸血"},
  {itemid = 40003, itemname = "高级连击"},
  {itemid = 40004, itemname = "高级飞行"},
  {itemid = 40005, itemname = "高级夜战"},
  {itemid = 40006, itemname = "高级隐身"},
  {itemid = 40007, itemname = "高级感知"},
  {itemid = 40008, itemname = "高级再生"},
  {itemid = 40009, itemname = "高级冥想"},
  {itemid = 40010, itemname = "高级慧根"},
  {itemid = 40011, itemname = "高级必杀"},
  {itemid = 40012, itemname = "高级幸运"},
  {itemid = 40013, itemname = "高级神迹"},
  {itemid = 40014, itemname = "高级招架"},
  {itemid = 40015, itemname = "高级永恒"},
  {itemid = 40016, itemname = "高级敏捷"},
  {itemid = 40017, itemname = "高级强力"},
  {itemid = 40018, itemname = "高级防御"},
  {itemid = 40019, itemname = "高级偷袭"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40021, itemname = "高级驱鬼"},
  {itemid = 60204, itemname = "地狱烈火"},
  {itemid = 60205, itemname = "水漫金山"},  
  {itemid = 60206, itemname = "泰山压顶"},
  {itemid = 60207, itemname = "奔雷咒"},	
  {itemid = 40022, itemname = "高级鬼魂术"},
  {itemid = 40023, itemname = "高级魔之心"},
  {itemid = 40024, itemname = "高级神佑复生"},
  {itemid = 40025, itemname = "高级精神集中"},
  {itemid = 40026, itemname = "高级否定信仰"},
  {itemid = 40027, itemname = "高级法术连击"},
  {itemid = 40028, itemname = "高级法术暴击"},
  {itemid = 40029, itemname = "高级法术波动"},
  {itemid = 40000, itemname = "高级反击"}, 
  {itemid = 40001, itemname = "高级反震"}, 
  {itemid = 40004, itemname = "高级飞行"},
  {itemid = 40006, itemname = "高级隐身"},
  {itemid = 40007, itemname = "高级感知"},
  {itemid = 40008, itemname = "高级再生"},
  {itemid = 40009, itemname = "高级冥想"},
  {itemid = 40010, itemname = "高级慧根"},
  {itemid = 40012, itemname = "高级幸运"},
  {itemid = 40013, itemname = "高级神迹"},
  {itemid = 40014, itemname = "高级招架"},
  {itemid = 40015, itemname = "高级永恒"},
  {itemid = 40016, itemname = "高级敏捷"},
  {itemid = 40017, itemname = "高级强力"},
  {itemid = 40018, itemname = "高级防御"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40021, itemname = "高级驱鬼"},
  {itemid = 40022, itemname = "高级鬼魂术"},
  {itemid = 40025, itemname = "高级精神集中"},
  {itemid = 40026, itemname = "高级否定信仰"}}					  		
			local r = RandTable(ItemListZ)
			ShowError(string.format("\#W获得武学秘籍"))
			player:GetItems():AddItem(r.itemid, 1)	
--script:Rumor(string.format(" %s #O打开宝盒仔细一看,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), true)--false)
	
		else
		    ShowHint("请先清理一下你的当前背包，至少预留一个位置")
		end
	end
end

function Item63028:CanUse(user, target)
end

function Item63028:BattleUse(user, target)
end

AddItemTable(Item63028)