--wangzl


Npc300437 = {							
	npc_id = 300437,				--雪人四
	name = GetNpcName(300437),	
}


function Npc300437:Talk(bProcess)
	if LuaI.GetRealYear() == 2016 and LuaI.GetRealMonth() == 10 and LuaI.GetRealDay() > 8 then
		NpcSay("\\r堆呀堆，堆雪人，圆圆脸儿胖墩墩。\\r大雪人，真神气，冰天雪地笑眯眯。\\r不怕冷，不怕冻，我们一起做游戏。")
		NpcSay("元旦活动要结束了，我也要走了，咱们明年再见啦！")	
	else
		NpcSay("\\r堆呀堆，堆雪人，圆圆脸儿胖墩墩。\\r大雪人，真神气，冰天雪地笑眯眯。\\r不怕冷，不怕冻，我们一起做游戏。")
		NpcSay("看我神气吧，哈哈，想要堆雪人，明天上午八点再来吧！")	
	end
end

AddNpcTable(Npc300437)
