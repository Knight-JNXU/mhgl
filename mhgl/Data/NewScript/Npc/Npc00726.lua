--beifang
--狼山商人

Npc00726 = {							                               -- 狼山商人
	npc_id = 726,						                               -- NPC ID
	name = GetNpcName(726),				                               -- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00726:Talk(bProcess)	
	NpcAsk( "我是帮派车夫,少侠可需要老夫送你去长安么？。")		
	SetAnswer(1, "去长安")
	SetAnswer(2, "离开")
	WaitAnswer(2)	
	if GetAnswer() == 1 then
	  player:JumpMap(34,240,34)
	end
end












AddNpcTable(Npc00726)
