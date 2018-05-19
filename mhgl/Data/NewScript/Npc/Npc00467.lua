
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00467 = {							-- 孙小红
	npc_id = 467,						-- NPC ID
	name = GetNpcName(467),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00467:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"那个什么九头虫献上来得宝贝还真不错。",
            "自从那猴子跟了唐三藏取经，好久都没消息了，也不知道现在行至何处？",
            "做皇帝难，作玉皇大帝更难啊。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00467)
