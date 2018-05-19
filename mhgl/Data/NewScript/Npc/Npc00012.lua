
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00350 = {							-- 点修时事通
	npc_id = 350,						-- NPC ID
	name = GetNpcName(350),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00350 对话方法，bProcess 为脚本处理阶段
function Npc00350:Talk(bProcess) 
  local QSlv = player:GetSkillLv(376)
  local LYlv = player:GetSkillLv(377)
  local FSlv = player:GetSkillLv(378)
  local FKlv = player:GetSkillLv(379)
  local QSls = player:GetSkillLv(382)
  local FSls = player:GetSkillLv(384)
  local LYls = player:GetSkillLv(383)
  local FKls = player:GetSkillLv(385)
  local QSMoney = 100000 * QSlv * 2 * 0.9
  local QSEXP = QSlv * 1000000
  local FSEXP = FSlv * 1000000
  local FSEXP = QSls * 1000000
  local FSEXP = FSls * 1000000
  local LYMoney = 10000 * LYlv * 2 * 0.6
  local LYEXP = LYlv * 1000000
  local FKEXP = FKlv * 1000000
  local FKEXP = LYls * 1000000
  local FKEXP = FKls * 1000000
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
	SetAnswer(6,"同伴物理强化修炼")
	SetAnswer(7,"同伴物理抗性修炼")
	SetAnswer(8,"同伴法术强化修炼")
	SetAnswer(9,"同伴法术抗性修炼")
    SetAnswer(3,"离开")
    WaitAnswer(3)
    if GetAnswer() == 1 then
	if QSlv >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if QSlv < 1 then
	 QSMoney = 500000
	 QSEXP= 1000000
	 end
	 if QSlv == 1 then
		QSMoney=1
		elseif QSlv == 2 then
		QSMoney =1
		elseif QSlv == 3 then
		QSMoney = 1
		elseif QSlv == 4 then
		QSMoney = 1
		elseif QSlv == 5 then
		QSMoney = 1
		elseif QSlv == 6 then
		QSMoney = 1
		elseif QSlv == 7 then
		QSMoney = 1
		elseif QSlv == 8 then
		QSMoney = 1
		elseif QSlv == 9 then
		QSMoney = 1
		elseif QSlv == 10 then
		QSMoney = 500000
		elseif QSlv == 11 then
		QSMoney = 500000
		elseif QSlv == 12 then
		QSMoney = 500000
		elseif QSlv == 13 then
		QSMoney = 500000
		elseif QSlv == 14 then
		QSMoney = 500000
		elseif QSlv == 15 then
		QSMoney = 500000
		elseif QSlv == 16 then
		QSMoney = 500000
		elseif QSlv == 17 then
		QSMoney = 500000
		elseif QSlv == 18 then
		QSMoney = 500000
		elseif QSlv == 19 then
		QSMoney = 500000
		elseif QSlv == 20 then
		QSMoney = 500000
		elseif QSlv == 21 then
		QSMoney = 500000
		elseif QSlv == 22 then
		QSMoney = 500000
		elseif QSlv == 23 then
		QSMoney = 500000
		elseif QSlv == 24 then
		QSMoney = 500000
		elseif QSlv == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习攻击修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,QSEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if QSlv >= 25 then
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
	if player:GetSkillLv(377) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(377) < 1  then
	 QSMoney = 500000
	 LYEXP= 1000000
	 end
	 if player:GetSkillLv(377) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(377) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(377) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(377) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(377) == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习防御修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(377) >= 25 then
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
	if player:GetSkillLv(378) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(378) < 1  then
	 QSMoney = 500000
	 FSEXP= 1000000
	 end
	 if player:GetSkillLv(378) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(378) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(378) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(378) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(378) == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习法术修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,FSEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(378) >= 25 then
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
	if player:GetSkillLv(379) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(379) < 1  then
	 QSMoney = 500000
	 FKEXP= 1000000
	 end
	 if player:GetSkillLv(379) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(379) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(379) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(379) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(379) == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习法抗修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,FKEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(379) >= 25 then
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
	if GetAnswer() == 6 then
	if player:GetSkillLv(382) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(382) < 1  then
	 QSMoney = 500000
	 LYEXP= 1000000
	 end
	 if player:GetSkillLv(382) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(382) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(382) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(382) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(382) == 25 then
		QSMoney = 500000
		
		end
      NpcAsk(string.format("学习同伴物理强化修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(382) >= 25 then
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
        if player:HasSkill(382) then
          player:ChangeSkillLv(382,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(382)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        end
      end
    end
	if GetAnswer() == 8 then
	if player:GetSkillLv(384) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(384) < 1  then
	 QSMoney = 500000
	 LYEXP= 1000000
	 end
	 if player:GetSkillLv(384) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(384) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(384) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(384) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(384) == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习同伴法术强化修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(384) >= 25 then
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
        if player:HasSkill(384) then
          player:ChangeSkillLv(384,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(384)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        end
      end
    end
		if GetAnswer() == 7 then
	if player:GetSkillLv(383) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(383) < 1  then
	 QSMoney = 500000
	 LYEXP= 1000000
	 end
	 if player:GetSkillLv(383) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(383) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(383) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(383) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(383) == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习同伴物理抗性修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(383) >= 25 then
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
        if player:HasSkill(383) then
          player:ChangeSkillLv(383,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(383)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        end
      end
    end
	if GetAnswer() == 9 then
	if player:GetSkillLv(385) >= 25 then
          NpcSay("我已经没什么可以交你的了，剩下的去找个帮派学习吧")
          return
        end
     if player:GetSkillLv(385) < 1  then
	 QSMoney = 500000
	 LYEXP= 1000000
	 end
	 if player:GetSkillLv(385) == 1 then
		QSMoney=1
		elseif player:GetSkillLv(385) == 2 then
		QSMoney =1
		elseif player:GetSkillLv(385) == 3 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 4 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 5 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 6 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 7 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 8 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 9 then
		QSMoney = 1
		elseif player:GetSkillLv(385) == 10 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 11 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 12 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 13 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 14 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 15 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 16 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 17 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 18 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 19 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 20 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 21 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 22 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 23 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 24 then
		QSMoney = 500000
		elseif player:GetSkillLv(385) == 25 then
		QSMoney = 500000
		end
      NpcAsk(string.format("学习同伴物理抗性修炼需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(9,"算了") 
      WaitAnswer(9)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if player:GetSkillLv(385) >= 25 then
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
        if player:HasSkill(385) then
          player:ChangeSkillLv(385,1)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(385)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-LYEXP)
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
AddNpcTable(Npc00350)
