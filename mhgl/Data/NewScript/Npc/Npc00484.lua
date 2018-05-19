
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00484 = {							-- 杵官王
	npc_id = 484,						-- NPC ID
	name = GetNpcName(484),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00484:Talk(bProcess) 
  local item = {
  {itemid = 40000, itemname = "高级反击"}, 
  {itemid = 40001, itemname = "高级反震"}, 
  {itemid = 40004, itemname = "高级飞行"},
  {itemid = 40005, itemname = "高级夜战"},
  {itemid = 40006, itemname = "高级隐身"},
  {itemid = 40007, itemname = "高级感知"},
  {itemid = 40008, itemname = "高级再生"},
  {itemid = 40009, itemname = "高级冥想"},
  {itemid = 40010, itemname = "高级慧根"},
  {itemid = 40012, itemname = "高级幸运"},
  {itemid = 40013, itemname = "高级神迹"},
  {itemid = 40015, itemname = "高级永恒"},
  {itemid = 40016, itemname = "高级敏捷"},
  {itemid = 40018, itemname = "高级防御"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40021, itemname = "高级驱鬼"},
  {itemid = 40022, itemname = "高级鬼魂术"},
  {itemid = 40025, itemname = "高级精神集中"},
  {itemid = 40026, itemname = "高级否定信仰"},
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
  {itemid = 40015, itemname = "高级永恒"},
  {itemid = 40016, itemname = "高级敏捷"},
  {itemid = 40018, itemname = "高级防御"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40021, itemname = "高级驱鬼"},
  {itemid = 40022, itemname = "高级鬼魂术"},
  {itemid = 40025, itemname = "高级精神集中"},
  {itemid = 40026, itemname = "高级否定信仰"},
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
  {itemid = 40015, itemname = "高级永恒"},
  {itemid = 40016, itemname = "高级敏捷"},
  {itemid = 40018, itemname = "高级防御"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40021, itemname = "高级驱鬼"},
  {itemid = 40022, itemname = "高级鬼魂术"},
  {itemid = 40025, itemname = "高级精神集中"},
  {itemid = 40026, itemname = "高级否定信仰"}}
  local itemB = {
  {itemid = 40002, itemname = "高级吸血"},
  {itemid = 40003, itemname = "高级连击"},
  {itemid = 40011, itemname = "高级必杀"},
  {itemid = 40014, itemname = "高级招架"},
  {itemid = 40017, itemname = "高级强力"},
  {itemid = 40019, itemname = "高级偷袭"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40023, itemname = "高级魔之心"},
  {itemid = 40024, itemname = "高级神佑复生"},
  {itemid = 40027, itemname = "高级法术连击"},
  {itemid = 40028, itemname = "高级法术暴击"},
  {itemid = 40029, itemname = "高级法术波动"},
  {itemid = 40014, itemname = "高级招架"},
  {itemid = 40017, itemname = "高级强力"},
  {itemid = 40018, itemname = "高级防御"},
  {itemid = 40020, itemname = "高级毒"},
  {itemid = 40021, itemname = "高级驱鬼"},
  {itemid = 40022, itemname = "高级鬼魂术"},
  {itemid = 40025, itemname = "高级精神集中"},
  {itemid = 40026, itemname = "高级否定信仰"}}
  local tssj = {
  {itemid = 40043, itemname = "善恶有报"}, 
  {itemid = 40044, itemname = "惊心一剑"}, 
  {itemid = 40054, itemname = "嗜血追击"}, 
  {itemid = 40045, itemname = "夜舞倾城"},  
  {itemid = 40046, itemname = "死亡禁锢"},
   {itemid = 40055, itemname = "灵能激发"}, 
  {itemid = 40045, itemname = "嗜血追击"},  
  {itemid = 40047, itemname = "上古灵符"},
  {itemid = 40049, itemname = "八凶法阵"}, 
  {itemid = 60198, itemname = "力劈华山"},  
  {itemid = 40050, itemname = "壁垒击破"},
  {itemid = 40045, itemname = "嗜血追击"},
  {itemid = 40056, itemname = "法力陷阱"},  
  {itemid = 40045, itemname = "嗜血追击"},  
  {itemid = 40052, itemname = "翻江倒海"},
  {itemid = 60198, itemname = "力劈华山"}, 
  {itemid = 40045, itemname = "嗜血追击"},  
  {itemid = 40053, itemname = "釜底抽薪"}, 
  {itemid = 40045, itemname = "嗜血追击"},  
  {itemid = 60198, itemname = "力劈华山"},
  {itemid = 60199, itemname = "须弥真言"},
  {itemid = 40048, itemname = "剑荡四方"}}

  local A = math.random(1,120)
  local flag = player:GetQuests():GetFlag(484) ---抽奖积分
  
    --if player:GetChar_id() == 1 then
    --  A = 1
   -- end
  
  NpcAsk("来瞧一瞧，看一看！老夫有几个新鲜玩意，想不想来看看？ !")
  SetAnswer(1,"我来看看有什么新鲜玩意儿")  
  SetAnswer(2,"没兴趣")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    NpcAsk("我这里出售一些高级别的东西,不过价格是很贵的,你需要看看吗?")
    SetAnswer(1,"我来买一些高级魔兽要诀")
    SetAnswer(2,"积分抽奖")
    SetAnswer(3,"抽奖券抽奖")
    SetAnswer(4,"闪人")
    WaitAnswer(4)
    if GetAnswer() == 1 then
      NpcAsk("购买高级魔兽要诀是需要银两#Y300万#W,少侠确定要进行购买吗?")
      SetAnswer(1,"购买")
      SetAnswer(2,"算了")
      WaitAnswer(2)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetMoney() < 2000000 then
          NpcSay("少侠银两不够200万,怎么能购买呢?")
          return
        end
        if player:GetItems():GetFreeSlot(0) < 1 then	   
          NpcSay("请注意背包是否已满！")
          return
        end
        if A == 5 then
          local r = RandTable(tssj)  
          ShowMessage(string.format("#W获得[%s]",r.itemname))
          player:GetItems():AddItem(r.itemid, 1)
          script:Rumor(string.format(" %s #O在#P新鲜人#O购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), true)--false)
          player:ChangeMoney(-2000000)
          player:GetQuests():SetFlag(484,flag+1)
          ShowMessage("#W获得抽奖积分1点")
        elseif A <= 20 then
          local r = RandTable(itemB)  
          ShowMessage(string.format("#W获得[%s]",r.itemname))
          player:GetItems():AddItem(r.itemid, 1)
          script:Rumor(string.format(" %s #O在#P新鲜人#O购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), false)
          player:ChangeMoney(-3000000)
          player:GetQuests():SetFlag(484,flag+1)
          ShowMessage("#W获得抽奖积分1点")
        elseif A <= 120 then
          local r = RandTable(item)  
          ShowMessage(string.format("#W获得[%s]",r.itemname))
          player:GetItems():AddItem(r.itemid, 1)
          script:Rumor(string.format(" %s #O在#P新鲜人#O购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), false)
          player:ChangeMoney(-3000000)
          player:GetQuests():SetFlag(484,flag+1)
          ShowMessage("#W获得抽奖积分1点")
        end
      end
    elseif GetAnswer() == 2 then
      NpcAsk(string.format("少侠要用积分进行抽奖吗？少侠当前拥有抽奖积分#P%s#W点\r#Y积分抽奖只会抽出主动魔兽要诀技能",flag))
      SetAnswer(1,"抽奖") 
      SetAnswer(2,"算了")
      WaitAnswer(2)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetItems():GetFreeSlot(0) < 1 then	   
          NpcSay("请注意背包是否已满！")
          return
        end
        if flag < 200 then
          NpcSay("少侠抽奖积分不足200点,不能够进行抽奖！")
          return
        end
        local r = RandTable(tssj)  
        ShowMessage(string.format("#W获得[%s]",r.itemname))
        player:GetItems():AddItem(r.itemid, 1)
        script:Rumor(string.format(" %s #O在#P新鲜人#O用抽奖积分进行购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), true)--false)
        player:GetQuests():SetFlag(484,flag - 200)
      end
    elseif GetAnswer() == 3 then
      NpcAsk(string.format("少侠要用抽奖券进行抽奖吗？",flag))
      SetAnswer(1,"抽奖") 
      SetAnswer(2,"算了")
      WaitAnswer(2)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetItems():GetFreeSlot(0) < 1 then	   
          NpcSay("请注意背包是否已满！")
          return
        end
        if player:GetItems():GetItemCount(80091) < 1 then	    
          NpcSay("没有抽奖券，搁着跟我俩扯犊子呢？滚蛋！")
          return
        end
        player:GetItems():RemoveItem(80091,1)
		local A = math.random(1,200);
        if A == 1 then
          local r = RandTable(tssj)  
          ShowMessage(string.format("#W获得[%s]",r.itemname))
          player:GetItems():AddItem(r.itemid, 1)
          script:Rumor(string.format(" %s #O在#P新鲜人#O购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), true)--false)
      --    player:ChangeMoney(-3000000)
      --    player:GetQuests():SetFlag(484,flag+1)
      --    ShowMessage("#W获得抽奖积分1点")
        elseif A < 20 then
          local r = RandTable(itemB)  
          ShowMessage(string.format("#W获得[%s]",r.itemname))
          player:GetItems():AddItem(r.itemid, 1)
          script:Rumor(string.format(" %s #O在#P新鲜人#O购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), false)
       --   player:ChangeMoney(-3000000)
      --    player:GetQuests():SetFlag(484,flag+1)
        --  ShowMessage("#W获得抽奖积分1点")
        elseif A < 201 then
          local r = RandTable(item)  
		  -- if player:GetChar_id() == 33 then
		     -- r.itemid = 60199
		     -- r.itemname = "须弥真言"
		  -- end
          ShowMessage(string.format("#W获得[%s]",r.itemname))
          player:GetItems():AddItem(r.itemid, 1)
          script:Rumor(string.format(" %s #O在#P新鲜人#O购买了一本魔兽要诀,仔细一看怀中,这不是正是一本梦寐以求的#Y[%s]#O吗！", player:GetCharNameLink(), r.itemname), false)
        end
      end
    end
  end
end








         
      
      
      
      
      
      


























-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00484)
