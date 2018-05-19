
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00574 = {							-- 孙小红
	npc_id = 574,						-- NPC ID
	name = GetNpcName(574),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00574:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"长寿村人杰地灵，是个修身养性的好地方。最近有人看到寿星南极仙翁经常在村里出现，好像在寻找什么东西，难道是落了什么宝贝在我们这？",
            "村子北面就是方寸山，哪里是菩提祖师的修道之所。向南出了存可以找驿站老板传送至北俱，土地公公能送你到大唐境外，天将能接你上天庭。不过他们3个可不站在一起，自己出村去找找吧。",
            "这里是远近闻名的长寿村，任务链的领取点地点在长寿村，找村子左下的“陆萧然”领取。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00574)
