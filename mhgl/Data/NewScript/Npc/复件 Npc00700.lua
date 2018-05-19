
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00700 = {							-- 孙小红
	npc_id = 700,						-- NPC ID
	name = GetNpcName(700),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00700:Talk(bProcess) 
  local QSlv = player:GetSkillLv(376)
  local LYlv = player:GetSkillLv(377)
  local FSlv = player:GetSkillLv(378)
  local FKlv = player:GetSkillLv(378)
  local QSMoney = 10000 * QSlv * 2 * 0.9
  local QSEXP = QSlv * 1000000
  local FSEXP = FSlv * 1000000
  local LYMoney = 10000 * LYlv * 2 * 0.6
  local LYEXP = LYlv * 1000000
  local FKEXP = FKlv * 1000000
  local LV = player:GetLevel()
  NpcAsk("如果您是一位无帮派人士,也可以在我这里不消耗帮贡来学习。但最高只能提升至150级,但会消耗大量经验、金钱、和人气哦。")
  SetAnswer(1,"我是来学习的")
  SetAnswer(2,"我是无帮派人士,也想学习一下")
  SetAnswer(3,"随便看看")
  WaitAnswer(3)
  if GetAnswer() == 1 then
    NpcAsk("需要学习什么技能?")
    SetAnswer(1,"攻击修炼")
	SetAnswer(2,"防御修炼")
	SetAnswer(4,"法术修炼")
	SetAnswer(5,"法抗修炼")
    SetAnswer(3,"离开")
    WaitAnswer(3)
    if GetAnswer() == 1 then
	if QSlv >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if QSlv < 1 then
	 QSMoney = 525000
	 QSEXP= 1000000
	 end
	 if QSlv == 1 then
		QSMoney=735000
		elseif QSlv == 2 then
		QSMoney = 1015000
		elseif QSlv == 3 then
		QSMoney = 1365000
		elseif QSlv == 4 then
		QSMoney = 1785000
		elseif QSlv == 5 then
		QSMoney = 2275000
		elseif QSlv == 6 then
		QSMoney = 2835000
		elseif QSlv == 7 then
		QSMoney = 3465000
		elseif QSlv == 8 then
		QSMoney = 4165000
		elseif QSlv == 9 then
		QSMoney = 4935000
		end
      NpcAsk(string.format("学习攻击修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,QSEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if QSlv >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
		
        if player:GetMoney() < QSMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",QSMoney))
          return
        end
        if player:GetExp() < QSEXP then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",QSEXP))
          return
        end
        if player:HasSkill(376) then
          player:ChangeSkillLv(376,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-QSEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(376)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-QSEXP)
          NpcSay("学习成功")
        end
      end
    end
  if GetAnswer() == 2 then
	if player:GetSkillLv(377) >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(377) < 1  then
	 QSMoney = 525000
	 LYEXP= 1000000
	 end
	 if player:GetSkillLv(377) == 1 then
		QSMoney=735000
		elseif player:GetSkillLv(377) == 2 then
		QSMoney = 1015000
		elseif player:GetSkillLv(377) == 3 then
		QSMoney = 1365000
		elseif player:GetSkillLv(377) == 4 then
		QSMoney = 1785000
		elseif player:GetSkillLv(377) == 5 then
		QSMoney = 2275000
		elseif player:GetSkillLv(377) == 6 then
		QSMoney = 2835000
		elseif player:GetSkillLv(377) == 7 then
		QSMoney = 3465000
		elseif player:GetSkillLv(377) == 8 then
		QSMoney = 4165000
		elseif player:GetSkillLv(377) == 9 then
		QSMoney = 4935000
		end
      NpcAsk(string.format("学习攻击修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(377) >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
		
        if player:GetMoney() < QSMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",QSMoney))
          return
        end
        if player:GetExp() < LYEXP then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",LYEXP))
          return
        end
        if player:HasSkill(377) then
          player:ChangeSkillLv(377,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(377)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        end
      end
    end
   if GetAnswer() == 4 then
	if player:GetSkillLv(378) >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(378) < 1  then
	 QSMoney = 525000
	 FSEXP= 1000000
	 end
	 if player:GetSkillLv(378) == 1 then
		QSMoney=735000
		elseif player:GetSkillLv(378) == 2 then
		QSMoney = 1015000
		elseif player:GetSkillLv(378) == 3 then
		QSMoney = 1365000
		elseif player:GetSkillLv(378) == 4 then
		QSMoney = 1785000
		elseif player:GetSkillLv(378) == 5 then
		QSMoney = 2275000
		elseif player:GetSkillLv(378) == 6 then
		QSMoney = 2835000
		elseif player:GetSkillLv(378) == 7 then
		QSMoney = 3465000
		elseif player:GetSkillLv(378) == 8 then
		QSMoney = 4165000
		elseif player:GetSkillLv(378) == 9 then
		QSMoney = 4935000
		end
      NpcAsk(string.format("学习攻击修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,FSEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(378) >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
		
        if player:GetMoney() < QSMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",QSMoney))
          return
        end
        if player:GetExp() < FSEXP then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",FSEXP))
          return
        end
        if player:HasSkill(378) then
          player:ChangeSkillLv(378,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-FSEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(378)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-FSEXP)
          NpcSay("学习成功")
        end
      end
    end
   if GetAnswer() == 5 then
	if player:GetSkillLv(379) >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(379) < 1  then
	 QSMoney = 525000
	 FKEXP= 1000000
	 end
	 if player:GetSkillLv(379) == 1 then
		QSMoney=735000
		elseif player:GetSkillLv(379) == 2 then
		QSMoney = 1015000
		elseif player:GetSkillLv(379) == 3 then
		QSMoney = 1365000
		elseif player:GetSkillLv(379) == 4 then
		QSMoney = 1785000
		elseif player:GetSkillLv(379) == 5 then
		QSMoney = 2275000
		elseif player:GetSkillLv(379) == 6 then
		QSMoney = 2835000
		elseif player:GetSkillLv(379) == 7 then
		QSMoney = 3465000
		elseif player:GetSkillLv(379) == 8 then
		QSMoney = 4165000
		elseif player:GetSkillLv(379) == 9 then
		QSMoney = 4935000
		end
      NpcAsk(string.format("学习攻击修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,FKEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(379) >= 10 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
		
        if player:GetMoney() < QSMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",QSMoney))
          return
        end
        if player:GetExp() < FKEXP then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",FKEXP))
          return
        end
        if player:HasSkill(379) then
          player:ChangeSkillLv(379,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-FKEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(379)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-FKEXP)
          NpcSay("学习成功")
        end
      end
    end
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
AddNpcTable(Npc00700)
