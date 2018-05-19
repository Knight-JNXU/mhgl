
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00700 = {							-- 孙小红
	npc_id = 700,						-- NPC ID
	name = GetNpcName(700),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00700:Talk(bProcess) 
  local QSlv = player:GetSkillLv(355)
  local LYlv = player:GetSkillLv(365)
  local MXlv = player:GetSkillLv(356)
  local QSMoney = 15000 * QSlv * 2 * 0.9
  local QSEXP = QSMoney * 8
  local LYMoney = 100 * LYlv * 2 * 0.6
  local LYEXP = LYMoney * 8
  local MXMoney = 10000 * MXlv * 2 * 0.9
  local MXEXP = MXMoney * 8  
  local LV = player:GetLevel()
  NpcAsk("如果您是一位无帮派人士,也可以在我这里不消耗帮贡来学习。但最高只能提升至150级,但会消耗大量经验、金钱、和人气哦。")
  SetAnswer(1,"我是来学习的")
  SetAnswer(2,"我是无帮派人士,也想学习一下")
  SetAnswer(3,"随便看看")
  WaitAnswer(3)
  if GetAnswer() == 1 then
    NpcAsk("需要学习什么技能?")
    SetAnswer(1,"强身术")
	SetAnswer(2,"炼药术")
	SetAnswer(3,"冥想术")	
    SetAnswer(13,"离开")
    WaitAnswer(13)
    if GetAnswer() == 1 then
      NpcAsk(string.format("学习强身术需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",QSMoney,QSEXP))
      SetAnswer(1,"学习") 
      SetAnswer(2,"算了") 
      WaitAnswer(2)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if QSlv >= LV then
          NpcSay("强身术等级最高不能超过自身等级")
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
        if player:HasSkill(355) then
          player:ChangeSkillLv(355,10)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-QSEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(355)
          player:ChangeMoney(-QSMoney)
          player:ChangeExp(-QSEXP)
          NpcSay("学习成功")
        end
      end
    end
    if GetAnswer() == 2 then
      NpcAsk(string.format("学习炼药术需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",LYMoney,LYEXP))
      SetAnswer(1,"学习") 
      SetAnswer(2,"算了") 
      WaitAnswer(2)
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if LYlv >= LV then
          NpcSay("炼药术等级最高不能超过自身等级")
          return
        end
        if player:GetMoney() < LYMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",LYMoney))
          return
        end
        if player:GetExp() < LYEXP then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",LYEXP))
          return
        end
        if player:HasSkill(365) then
          player:ChangeSkillLv(365,10)
          player:ChangeMoney(-LYMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(365)
          player:ChangeMoney(-LYMoney)
          player:ChangeExp(-LYEXP)
          NpcSay("学习成功")
        end
      end
   end
     if GetAnswer() == 3 then
      NpcAsk(string.format("学习冥想术需要#P%s#W银两,#P%s#W经验,你确定要学习吗?",MXMoney,MXEXP))
      SetAnswer(1,"学习") 
      SetAnswer(2,"算了") 
      WaitAnswer(2)  
      if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
        if MXlv >= LV then
          NpcSay("冥想术等级最高不能超过自身等级")
          return
        end
        if player:GetMoney() < MXMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",MXMoney))
          return
        end
        if player:GetExp() < MXEXP then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",MXEXP))
          return
        end
        if player:HasSkill(356) then
          player:ChangeSkillLv(356,10)
          player:ChangeMoney(-MXMoney)
          player:ChangeExp(-MXEXP)
          NpcSay("学习成功")
        else  
          player:AddSkill(356)
          player:ChangeMoney(-MXMoney)
          player:ChangeExp(-MXEXP)
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
