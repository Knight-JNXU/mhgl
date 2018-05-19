
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00273 = {							-- 孙小红
	npc_id = 273,						-- NPC ID
	name = GetNpcName(273),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00273:Talk(bProcess) 
  local  mp = player:GetFaction()  --门派接口,检测玩家门派
	local job = player:GetJob()  -- 角色类型
	local sex = player:GetSex()  -- 角色性别
	local  lv = player:GetLevel() -- 检查角色等级
	local flag = player:GetQuests():GetFlag(273) --控制玩家是否免费洗点
    NpcAsk("年轻人没有门派可不行,看你骨骼惊奇,选一个适合自己的门派拜师吧~#P\r35级以上100级以内可以找我免费重置一次属性点喔！")
      SetAnswer(1,"龙宫")
      SetAnswer(2,"天宫")
      SetAnswer(15,"凌波城")	  
      SetAnswer(3,"普陀山")
      SetAnswer(4,"五庄观")
      SetAnswer(5,"方寸山")
      SetAnswer(6,"大唐官府")
      SetAnswer(7,"化生寺")
      SetAnswer(8,"大唐官府")
      SetAnswer(9,"女儿村")
      SetAnswer(10,"方寸山")
      SetAnswer(11,"地府") 
      SetAnswer(12,"魔王寨")
      SetAnswer(13,"狮驼岭")
      SetAnswer(14,"盘丝洞")
    SetAnswer(25,"离开")
    WaitAnswer(25)
    if GetAnswer() == 1 then
      player:JumpMap(21,42,204)
    elseif GetAnswer() == 2 then
      player:JumpMap(13,120,326)
    elseif GetAnswer() == 3 then
      player:JumpMap(26,17,56)
    elseif GetAnswer() == 4 then
      player:JumpMap(15,21,125)
    elseif GetAnswer() == 5 then
      player:JumpMap(29,63,118)
    elseif GetAnswer() == 6 then
      player:JumpMap(27,67,180)
    elseif GetAnswer() == 7 then
      player:JumpMap(28,14,200)
    elseif GetAnswer() == 8 then
      player:JumpMap(28,14,200)
    elseif GetAnswer() == 9 then
      player:JumpMap(10,11,123)
    elseif GetAnswer() == 10 then
      player:JumpMap(29,63,118)
    elseif GetAnswer() == 11 then
      player:JumpMap(20,41,206)
    elseif GetAnswer() == 12 then
      player:JumpMap(18,46,75)
    elseif GetAnswer() == 13 then
      player:JumpMap(17,46,220)
    elseif GetAnswer() == 14 then
      player:JumpMap(16,108,81)
    elseif GetAnswer() == 15 then
      player:JumpMap(501,12,201)	  
    end
  else
    NpcAsk("你选择你需要做的事情#P\r35级以上100级以内可以找我免费重置一次属性点喔！")
    if mp ~= 0 then
      SetAnswer(1,"回门派")
    end
    if lv >=35 and lv < 100 and flag == 0 then
      SetAnswer(2,"重置属性点")
    end
    SetAnswer(3,"离开")
    WaitAnswer(3)
    if GetAnswer() == 1 then
      if lv >= 255 then
        NpcSay("我还有很多事情要忙,还是请你自己回去吧~")
        return
      end
      NpcSay("别节约了那点魔法了,还是请多用用师傅教你的技能回去吧~")
    elseif GetAnswer() == 2 then
      player:ResetCharLevel(lv)
      player:GetQuests():SetFlag(273, 1)
      NpcSay("已经帮你重置属性点,请谨慎分配~")
    end
  end

    


-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00273)
