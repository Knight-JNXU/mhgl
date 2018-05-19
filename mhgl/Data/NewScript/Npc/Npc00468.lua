
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00468 = {							-- 孙小红
	npc_id = 468,						-- NPC ID
	name = GetNpcName(468),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00468:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"仙魔两界向来水火不容，说什么神仙妖魔自由恋爱，哼，除非神仙都死光了。",
            "猴子被佛祖降服以后，天界的日子总算太平了。",
            "蟠桃园的桃子长势喜人，今年又可以开一场盛大的蟠桃宴会了。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00468)
