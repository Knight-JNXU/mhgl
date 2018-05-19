--beifang
--狼山商人

Npc800005 = {							                               -- 狼山商人
	npc_id = 726,						                               -- NPC ID
	name = GetNpcName(726),				                               -- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc800005:Talk(bProcess)	
	NpcAsk( "欢迎进入#PKJ#W一年一度的堆雪人活动开始啦,快在地图上收集雪块堆雪人吧~！！！")		
--SetAnswer(1, "送我进去")
	SetAnswer(2, "我在逛逛")
	WaitAnswer(2)	
	if GetAnswer() == 1 then
	  if player:GetLevel() < 10 then
	    NpcSay("等级低于10级不能进入")
	    return
	  end
	  player:JumpMap(252,30,50)
	end
end












AddNpcTable(Npc800005)
