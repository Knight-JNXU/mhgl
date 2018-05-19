

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc800016 = {							-- 杵官王
	npc_id = 800016,						-- NPC ID
	name = GetNpcName(800016),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc800016:Talk(bProcess) 
 if npc then
    local TotalRound610 = 0
    local type610 = player:GetQuests():GetType(9999)
	local flag = player:GetQuests():GetFlag(24567)
    if type610 ~= nil then
      TotalRound610 = type610:GetTotalRound()
    end
  NpcAsk("我是唐王任命专门负责处理副本冒险相关事宜的官员，这方面有什么业务直接找我好了。")
  SetAnswer(1,"我想创建副本")
  WaitAnswer(5)
   if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
	if party then
      NpcSay("请一个一个来,不要组队~！")
      return false
    end
	 if TotalRound610 >= 1 then
          ShowHint("每天只能进入一次")
          return
        end
		if bProcess then
          if type610 == nil then
            player:GetQuests():SetRoundInfo(9999, 1, 1, 1)
            type610 = player:GetQuests():GetType(9999)
            type610:ChangeTotalRound(1)
          else
            type610:ChangeTotalRound(1)
          end
		   player:GetQuests():SetFlag(24567, flag + 1)
           player:JumpMap(2016,102,77)  --预设的地图 刷新怪物 
	    end
    end
end
	end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc800016)

