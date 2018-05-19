

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00378 = {							-- 杵官王
	npc_id = 378,						-- NPC ID
	name = GetNpcName(378),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00378:Talk(bProcess) 
  NpcAsk("我是负责所有商店的总管，你看我这身后这么多商店够热闹吧。（使用F9键可以屏蔽玩家，alt+H可以屏蔽摊位）")
--  SetAnswer(1,"我来买些东西")
  --SetAnswer(2,"我要进入我的商店")
--  SetAnswer(3,"我想申请开个店-请勿将商店打烊!")
 -- SetAnswer(4,"购买店铺")
 -- SetAnswer(5,"我想买间商店")
 -- SetAnswer(6,"设置店面营业方式")
  SetAnswer(7,"我最怕人多的地方，还是先走为妙")
  WaitAnswer(7)
  if GetAnswer() == 3 then
  --  Npcsay("创建店铺以后请将自己的店铺开张,不然将无法管理自己的店铺！")
    player:OpenCreateBusinessGuildUi()--商会注册接口
  elseif GetAnswer() == 1 then
    player:OpenBusinessGuildListUi()
  elseif GetAnswer() == 4 and bProcess then
    script:SetSaying(true)
    player:OpenSellGuildListUi()
  end
end
    










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00378)
