Preload("Quest26001.lua")
Preload("Quest26002.lua")
Preload("Quest26003.lua")
Preload("Quest26004.lua")
Preload("Quest69203.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00086 = {							-- 孙小红
	npc_id = 86,						-- NPC ID
	name = GetNpcName(86),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00086:Talk(bProcess)
	local quest26001 = player:GetQuests():GetQuest(26001) 
	local quest26002 = player:GetQuests():GetQuest(26002)
	local quest26003 = player:GetQuests():GetQuest(26003)
	local quest26004 = player:GetQuests():GetQuest(26004)
	local quest69207 = player:GetQuests():GetQuest(69207)






  NpcAsk("我的事情太多,忙不过来,请优先选择一件你最想做的事情吧。(如果你想做的事情不在列表中,请选择“#Y我要做其他事情#W”)")
  SetAnswer(1,"西凉女国剧情")
  SetAnswer(2,"学习技能")
  SetAnswer(3,"我要做其他事情")
	if (HasQuest(26001) and quest26001:GetEndNpcId() == self.npc_id) or
		(HasQuest(26002) and quest26002:GetEndNpcId() == self.npc_id) or
		(HasQuest(26003) and quest26003:GetEndNpcId() == self.npc_id) or
		(HasQuest(26004) and quest26004:GetEndNpcId() == self.npc_id) then
		SetAnswer(4, "任务链")
	end
	if player:GetQuests():HasQuest(69203) and player:GetQuests():GetQuest(69203):GetTargetNpcId(1) == self.npc_id then	
		SetAnswer(5,"中国梦幻游泳大赛")
	end
  SetAnswer(6,"我点错了")
  WaitAnswer(6)
  if GetAnswer() == 4 then
		if HasQuest(26001) then
			Quest26001:Return()
		elseif HasQuest(26002) then
			Quest26002:Return()
		elseif HasQuest(26003) then
			Quest26003:Return()
		elseif HasQuest(26004) then
			Quest26004:Return()
		end
	elseif GetAnswer() == 2 then
    NpcAsk("你确定要花费200万银子和200万经验来学习变化之术吗?")
    SetAnswer(1,"银两学习") 
    SetAnswer(2,"储备金学习") 
    SetAnswer(3,"离开") 
    WaitAnswer(3)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 2000000 then
        NpcSay("少侠银两不足200万,不能进行学习")
        return
      end
      if player:GetExp() < 2000000 then
        NpcSay("少侠经验不足200万,不能进行学习")
        return
      end
      if player:GetSkillLv(9778) >= 10 then
        NpcSay("变化之术最高技能只能到达10级")
        return
      end
      if player:HasSkill(9778) then
        player:ChangeSkillLv(9778,1)
        player:ChangeMoney(-2000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      else
        player:AddSkill(9778)
        player:ChangeMoney(-2000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      end
    elseif GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      if player:GetSMoney() < 2000000 then
        NpcSay("少侠银两不足200万,不能进行学习")
        return
      end
      if player:GetExp() < 2000000 then
        NpcSay("少侠经验不足200万,不能进行学习")
        return
      end
      if player:GetSkillLv(9778) >= 10 then
        NpcSay("变化之术最高技能只能到达10级")
        return
      end
      if player:HasSkill(9778) then
        player:ChangeSkillLv(9778,1)
        player:ChangeSMoney(-2000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      else
        player:AddSkill(9778)
        player:ChangeSMoney(-2000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      end
    end
	elseif GetAnswer() == 5 then
		NpcSayParty("诸位大侠大汗淋漓，为何走得如此匆忙？")
		ISay("我们正在参与中国梦幻游泳大赛，有个接引人叫我们来问候下你的。")
		NpcSayParty("原来是这样啊，那既然你们找到我，就坐下来喝杯茶，歇一歇吧。")
		ISay("别别，我们正在赶时间呢，就要到终点了，下次吧。")
		NpcSayParty("哎，既然各位大侠有要事在身，那我们也不强求了。")
		if bProcess then
			script:SetSaying(true)
			Quest69203:Take()
		end
  end
end

-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00086)
