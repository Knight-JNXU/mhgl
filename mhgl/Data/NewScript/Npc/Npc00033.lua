-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Npc00033.out 
Npc00033 = {							-- 杵官王
	npc_id = 033,						-- NPC ID
	name = GetNpcName(033),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00033:Talk(bProcess) 
  NpcAsk("我可以送你去#R傲来国#W,你要不要去呢?")
  SetAnswer(1,"是的,我要去")
  --SetAnswer(3,"去神秘之地")
  SetAnswer(2,"我还要逛逛")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if player:GetLevel() < 10 then
      NpcSay("低于10级,不敢传送")
      return
    end
    player:JumpMap(7,103,355)
  else
    NpcAsk("少侠后会有期！")
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
  if GetAnswer() == 3 then
    player:JumpMap(260,77,279)
  end
end
    










AddNpcTable(Npc00033)

