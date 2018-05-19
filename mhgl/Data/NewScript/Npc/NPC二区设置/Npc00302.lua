Preload("Quest55101.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00302 = {							-- 杵官王
	npc_id = 302,						-- NPC ID
	name = GetNpcName(302),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
ItemRandFlag = 0 -- 声明一个全局变量
function Npc00302:Talk(bProcess) 
  local quest55101 = player:GetQuests():GetQuest(55101)
  NpcAsk("#O少侠想做什么呢？#A想来试试手气吗？#P你一定会得到你想要的装备！")
  if HasQuest(55101) and (quest55101:GetTargetNpcId(1) == self.npc_id or quest55101:GetTargetNpcId(2) == self.npc_id) then
    SetAnswer(1,"建设任务")
  end
  SetAnswer(2,"我来赌环装")
  SetAnswer(3,"我只是路过")
  WaitAnswer(3)
  if GetAnswer() == 1 then
    ISay("本帮山庄建设中，还请阁下多多帮忙。")
    NpcSay("没问题，回复你们总管就说包在我身上了。")
    if quest55101:GetTargetNpcId(1) == self.npc_id then
      quest55101:FindTargetNPC(1)
    else
      quest55101:FindTargetNPC(2)
    end
    quest55101:UpdateData()
  elseif GetAnswer() == 2 then
    NpcAsk("#O少侠想试试手气吗？！快来试试吧，你一定会获得你想要装备！")
	SetAnswer(1,"试试手气（70~80环装）8w/件")
	SetAnswer(2,"试试手气（50~60环装）8w/件")
	SetAnswer(3,"试试手气（50~80环装）5w/件")
	SetAnswer(4,"我只是路过")
    WaitAnswer(4)
	if GetAnswer() == 1 then
	   GetRandomEq(bProcess,1)
	elseif GetAnswer() == 2 then
	   GetRandomEq(bProcess,2)
	elseif GetAnswer() == 3 then
	   GetRandomEq(bProcess,3)
	end
  end
end

function GetRandomEq(bProcess,EqType)
   if ItemRandFlag == 1 then  --通过全局变量 防止二次执行
      return
   end
   local ItemList7080 = {}
   local ItemList5060 = {}
   local ItemList5080 = {}
   if EqType == 1 then
      if player:GetMoney() < 80000 then
        NpcSay("#A赌70-80环装每次需要8万银子，少侠的钱袋子好像空了喔！")
        return
      end
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
   elseif EqType == 2 then
      if player:GetMoney() < 80000 then
        NpcSay("#A赌50-60环装每次需要8万银子，少侠的钱袋子好像空了喔！")
        return
      end
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
   elseif EqType == 3 then
      if player:GetMoney() < 50000 then
        NpcSay("#A赌50-80环装每次需要5万银子，少侠的钱袋子好像空了喔！")
        return
      end
      ItemList5080 = {
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
			  {item_id = 20618},--疾风之铃
			  {item_id = 20450},--墨杆金钩
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
   end
   local R
   local ItemID = 0
   local Money = 0
   if EqType == 1 then
      R = RandTable(ItemList7080)
	  Money = 80000
   elseif EqType == 2 then
      R = RandTable(ItemList5060)
	  Money = 80000
   elseif EqType == 3 then
      R = RandTable(ItemList5080)
	  Money = 50000
   end
   local ItemName = GetItemName(R.item_id)
   player:ChangeMoney(-Money)
   player:GetItems():AddItem(R.item_id,1)
   ItemRandFlag = 1 -- 修改全局变量标志
   NpcSay(string.format("#A恭喜少侠获得了一件\#Y[%s]#A！真是好运连连啊！",ItemName))
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00302)
