
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00538 = {							-- 孙小红
	npc_id = 538,						-- NPC ID
	name = GetNpcName(538),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00538:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"朕切切思思，无昼无夜，只求夫人早日回我身边。",
            "佳人彩云里，欲见远隔天。想思无因见，怅望凉风前。昭阳宫还在，可那些欢声笑语，都去了哪里？",
            "听说那蓬莱仙岛有长生不老之地，真想等夫人归来以后一起去找寻找寻。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00538)
