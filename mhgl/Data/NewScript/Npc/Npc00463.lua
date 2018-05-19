
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00463 = {							-- 孙小红
	npc_id = 463,						-- NPC ID
	name = GetNpcName(463),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00463:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 10) then
    NpcAsk("(少侠要锻造法宝的话找我就对了，我给爷爷少了上千年的炉子，帮你做个法宝还不是手到擒来，熄火的时间你自己掌握哦。")
    SetAnswer(1,"我要合成法宝")
    SetAnswer(2,"取消法宝任务")
    SetAnswer(3,"增加法宝灵气")
    SetAnswer(4,"法宝介绍")
    SetAnswer(5,"我只是路过这看能不能拣到两件法宝")
    WaitAnswer(5)
    if GetAnswer() == 1 then
      NpcSay("1")
    end
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end


   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00463)
