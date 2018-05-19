--wangzl
Preload("Quest63521.lua")


Npc300512 = {							
	npc_id = 300512,				--战斗雪人明雷
	name = GetNpcName(300512),	
}


function Npc300512:Talk(bProcess)
  local wDay = LuaI.GetRealWDay()
  local hour = LuaI.GetRealHour()
  local rDay = LuaI.GetRealHour()
  local rYear = LuaI.GetRealYear()
  local rMonth = LuaI.GetRealMonth()
	local q = player:GetQuests():GetQuest(63521) 
	local getTime = os.date("%d");
  
  
  NpcAsk("欢迎参加门派闯关竞赛活动,活动每日举行一次。你是否已经叫齐伙伴准备闯关了?\r#P活动时间为每天晚间20:00-21:00")
  if hour >= 20 and hour < 21 then
    SetAnswer(1,"准备好了,请告诉我们第一关的挑战点")
  end
  SetAnswer(2,"我要查询一下自己的活动积分")
  SetAnswer(3,"我要增加召唤兽寿命")
  SetAnswer(4,"我是来领取奖励的")
  SetAnswer(5,"我要了解下门派闯关活动")
  SetAnswer(6,"删除任务")
  SetAnswer(7,"我只是来瞧瞧热闹")
  WaitAnswer(7)
	if GetAnswer() == 1 then 
   	if player:GetQuests():HasQuest(63521) then
   	  local q = player:GetQuests():GetQuest(63521)
   	  if q:IsFailed() then 
   	    NpcSay("任务已失败，请删除任务后在领取~")
   	  else
   	    NpcSay("快去寻找伙伴一起闯关吧。")
   	  end
   	  return false
   	else
   	  Quest63521:Take()
   	end
  elseif GetAnswer() == 6 then
    player:GetQuests():RemoveQuest(63521)
  end
end
    


  





AddNpcTable(Npc300512)
