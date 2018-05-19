Npc00005 = {npc_id = 5,name = GetNpcName(5),}

function Npc00005:Talk(bProcess)
 --[[
 local A = 1 
 local B = 2
 if A == 1 and B == 2 then
   NpcSay("11")
 else
   NpcSay("22")
  end
end
 --]]
 
  NpcAsk("初入梦幻的朋友可以找#Y建业守护使者#W领取任务。什么？！你已经领取了新手任务想要取消？你确定么？取消后可不能在领取了。")
  SetAnswer(1,"确定")
  SetAnswer(2,"取消")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    NpcSay("乖乖的去跑主线吧,目前就一个商人的鬼魂,别偷懒")
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00005)
