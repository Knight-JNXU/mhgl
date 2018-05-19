
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00462 = {							-- 孙小红
	npc_id = 462,						-- NPC ID
	name = GetNpcName(462),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00462:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"天上一日，人间一年。下界许久没什么大动静，我待在这都快生锈了。",
            "作为三坛海会大神，率领天兵去降服那猴子，却屡战屡败，真是惭愧!",
            "居然把火尖枪输给那个看门的小神，那可是师傅送我的枪啊，我有何颜面去见师傅和父亲。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00462)
