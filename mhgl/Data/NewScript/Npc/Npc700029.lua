Npc00767 = {npc_id = 767, name = GetNpcName(767)}
  local Skill64400 = player:GetSkillLv(64400)--外功强化修炼
  local Skill64410 = player:GetSkillLv(64410)--外功抗性修炼
  local Skill64420 = player:GetSkillLv(64420)--内功强化修炼
  local Skill64430 = player:GetSkillLv(64430)--内功抗性修炼
  local Skill64440 = player:GetSkillLv(64440)--同伴外功强化修炼
  local Skill64442 = player:GetSkillLv(64442)  
  local Skill64444 = player:GetSkillLv(64444)
  local Skill64446 = player:GetSkillLv(64446)  
  local Skill64450 = player:GetSkillLv(64450)--同伴外功抗性修炼
  local Skill64460 = player:GetSkillLv(64460)--同伴内功强化修炼
  local Skill64470 = player:GetSkillLv(64470)--同伴内功抗性修炼
  local Skill64480 = player:GetSkillLv(64480)
  local Skill64490 = player:GetSkillLv(64490)
  local Skill64492 = player:GetSkillLv(64492) 
  local Skill64494 = player:GetSkillLv(64494) 
  local Skill64496 = player:GetSkillLv(64496)  
  local Skill64500 = player:GetSkillLv(64500)
  local Skill64510 = player:GetSkillLv(64510)
  local Skill64520 = player:GetSkillLv(64520)
  local Skill64530 = player:GetSkillLv(64530)
  local Skill64540 = player:GetSkillLv(64540)
  local Skill64542 = player:GetSkillLv(64542)  
  local Skill64544 = player:GetSkillLv(64544)  
  local Skill64546 = player:GetSkillLv(64546)  
  local Skill64550 = player:GetSkillLv(64550)  
  local Skill64560 = player:GetSkillLv(64560) 
  local Skill64570 = player:GetSkillLv(64570) 
  local Skill64580 = player:GetSkillLv(64580) 
  local Skill64590 = player:GetSkillLv(64590) 
  local Skill64592 = player:GetSkillLv(64592) 
  local Skill64594 = player:GetSkillLv(64594)
  local Skill64596 = player:GetSkillLv(64596)
  local Skill64600 = player:GetSkillLv(64600) 
  local Skill64610 = player:GetSkillLv(64610) 
  local Skill64620 = player:GetSkillLv(64620) 
  local Skill64630 = player:GetSkillLv(64630) 
  local Skill64640 = player:GetSkillLv(64640)
  local Skill64642 = player:GetSkillLv(64642)  
  local Skill64644 = player:GetSkillLv(64644)
  local Skill64646 = player:GetSkillLv(64646)
Npc00767.Talk = function(self, bProcess)
  NpcAsk("#Y要达到我这个境界并不容易，你还需要多多修炼！\\r#R打通奇经八脉第一层需要#R一个乾元丹，无级别限制。\\r打通奇经八脉第二层需要两个乾元丹和人物109级。\\r打通奇经八脉第三层需要三个乾元丹和人物119级。\\r打通奇经八脉第四层需要四个乾元丹和人物129级\\r打通奇经八脉第五层需要五个乾元丹和人物139级\\r打通奇经八脉第六层需要六个乾元丹和人物149级\\r打通奇经八脉第七层需要七个乾元丹和人物155级\\r打通奇经八脉第八层需要八个乾元丹和人物165级。")
  SetAnswer(1, "奇经八脉修练")
  --SetAnswer(2, "设定山庄修练")
  --SetAnswer(3, "奇经八脉说明")
  SetAnswer(4, "离开")
  WaitAnswer(4)
  if GetAnswer() == 1 then
    NpcAsk("人物奇经八脉目前只提供以下五条，\\r#E每人同时打通一条经脉或者多条经脉，请量力而行。")
    --SetAnswer(1, "使用帮贡进行修炼")
    SetAnswer(2, "任脉")
    SetAnswer(3, "督脉")
    SetAnswer(4, "冲脉")
    SetAnswer(5, "带脉")
    SetAnswer(6, "阴跷脉")
	--SetAnswer(10, "修炼丹修炼简介")
    SetAnswer(111, "离开")
    WaitAnswer(111)
    if GetAnswer() == 1 and bProcess then
      player:OpenManorTrainPanel(1)
    else
      if GetAnswer() == 2 then
        NpcAsk("任脉增加物理攻击属性。请一级一级来，不要跳级打通奇经八脉！请选择：")
        SetAnswer(11, "打通会阴")
        SetAnswer(12, "打通曲骨")
        SetAnswer(13, "打通中极")
        SetAnswer(14, "打通关元")
        SetAnswer(15, "打通阴交")
        SetAnswer(16, "打通廉泉")
        SetAnswer(17, "打通承浆")	
        SetAnswer(18, "打通上脘")		
        SetAnswer(19, "离开")
        WaitAnswer(19)
        if GetAnswer() == 11 then
		  if bProcess then
            script:SetSaying(true)			
            if Skill64400 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 1 then
                player:AddSkill(64400)
                player:GetItems():RemoveItem(402850, 1)
				ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G1#W个#R乾元丹")---1
              end            
            elseif  Skill64400 <= 1 then 
                 ShowHint("您目前的奇经八脉#R会阴#W已经打通，无需再来")		    
				 end
          end
		else
        if GetAnswer() == 12 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 109 then
		ShowHint("你都没有#R109级#W，")
				return 
end		
	   if Skill64400 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64410 <= 0 then   
			
              if player:GetItems():GetItemCount(402850) >= 2 then
                player:AddSkill(64410)
                player:GetItems():RemoveItem(402850, 2)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G2#W个#R乾元丹")---
              end           
            elseif  Skill64410 <= 1 then 
            ShowHint("您目前的奇经八脉#R曲骨#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 13 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 119 then
		ShowHint("你都没有#R119级#W，")
				return 
end	
	   if Skill64410 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64420 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 3 then
                player:AddSkill(64420)
                player:GetItems():RemoveItem(402850, 3)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G3#W个#R乾元丹")---
              end           
            elseif  Skill64420 <= 1 then 
            ShowHint("您目前的奇经八脉#R中极#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 14 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 129 then
		ShowHint("你都没有#R129级#W，")
				return 
end
	   if Skill64420 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64430 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 4 then
                player:AddSkill(64430)
                player:GetItems():RemoveItem(402850, 4)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G4#W个#R乾元丹")---
              end           
            elseif  Skill64430 <= 1 then 
            ShowHint("您目前的奇经八脉#R关元#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 15 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 139 then
		ShowHint("你都没有#R139级#W，")
				return 
end	
	   if Skill64430 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64440 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 5 then
                player:AddSkill(64440)
                player:GetItems():RemoveItem(402850, 5)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G5#W个#R乾元丹")---
              end           
            elseif  Skill64440 <= 1 then 
            ShowHint("您目前的奇经八脉#R阴交#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 16 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 149 then
		ShowHint("你都没有#R149级#W，")
				return 
end	
	   if Skill64440 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64442 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 6 then
                player:AddSkill(64442)
                player:GetItems():RemoveItem(402850, 6)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G6#W个#R乾元丹")---
              end           
            elseif  Skill64442 <= 1 then 
            ShowHint("您目前的奇经八脉#R廉泉#W已经打通，无需再来")		
				 end
          end
		          else
        if GetAnswer() == 17 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 155 then
		ShowHint("你都没有#R155级#W，")
				return 
end	
	   if Skill64442 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64444 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 7 then
                player:AddSkill(64444)
                player:GetItems():RemoveItem(402850, 7)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G7#W个#R乾元丹")---
              end           
            elseif  Skill64444 <= 1 then 
            ShowHint("您目前的奇经八脉#R承浆#W已经打通，无需再来")		
				 end
	  
     end
		          else
        if GetAnswer() == 18 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 165 then
		ShowHint("你都没有#R165级#W，")
				return 
end	
	   if Skill64444 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64446 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 8 then
                player:AddSkill(64446)
                player:GetItems():RemoveItem(402850, 8)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G8#W个#R乾元丹")---
              end           
            elseif  Skill64446 <= 1 then 
            ShowHint("您目前的奇经八脉#R上脘#W已经打通，无需再来")		
				 end
          end	
end		  
 end
 end	
end
end
end
end
end
end	  
      if GetAnswer() == 3 then
        NpcAsk("督脉增加灵力属性。请一级一级来，不要跳级打通奇经八脉！请选择：")
        SetAnswer(21, "打通长强")
        SetAnswer(22, "打通陶道")
        SetAnswer(23, "打通大椎")
        SetAnswer(24, "打通哑门")
        SetAnswer(25, "打通风府")
        SetAnswer(26, "打通脑户")
        SetAnswer(27, "打通百会")
        SetAnswer(28, "打通神庭")		
        SetAnswer(29, "离开")
        WaitAnswer(29)
        if GetAnswer() == 21 then
		  if bProcess then
            script:SetSaying(true)			
            if Skill64450 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 1 then
                player:AddSkill(64450)
                player:GetItems():RemoveItem(402850, 1)
				ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G1#W个#R乾元丹")---1
              end            
            elseif  Skill64450 <= 1 then 
                 ShowHint("您目前的奇经八脉#R长强#W已经打通，无需再来")		    
				 end
          end
		else
        if GetAnswer() == 22 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 109 then
		ShowHint("你都没有#R109级#W，")
				return 
end		
	   if Skill64450 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64460 <= 0 then   
			
              if player:GetItems():GetItemCount(402850) >= 2 then
                player:AddSkill(64460)
                player:GetItems():RemoveItem(402850, 2)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G2#W个#R乾元丹")---
              end           
            elseif  Skill64460 <= 1 then 
            ShowHint("您目前的奇经八脉#R陶道#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 23 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 119 then
		ShowHint("你都没有#R119级#W，")
				return 
end	
	   if Skill64460 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64470 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 3 then
                player:AddSkill(64470)
                player:GetItems():RemoveItem(402850, 3)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G3#W个#R乾元丹")---
              end           
            elseif  Skill64470 <= 1 then 
            ShowHint("您目前的奇经八脉#R大椎#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 24 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 129 then
		ShowHint("你都没有#R129级#W，")
				return 
end
	   if Skill64470 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64480 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 4 then
                player:AddSkill(64480)
                player:GetItems():RemoveItem(402850, 4)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G4#W个#R乾元丹")---
              end           
            elseif  Skill64480 <= 1 then 
            ShowHint("您目前的奇经八脉#R哑门#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 25 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 139 then
		ShowHint("你都没有#R139级#W，")
				return 
end		
	   if Skill64480 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64490 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 5 then
                player:AddSkill(64490)
                player:GetItems():RemoveItem(402850, 5)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G5#W个#R乾元丹")---
              end           
            elseif  Skill64490 <= 1 then 
            ShowHint("您目前的奇经八脉#R风府#W已经打通，无需再来")	
				 end
          end
        else
        if GetAnswer() == 26 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 149 then
		ShowHint("你都没有#R149级#W，")
				return 
end		
	   if Skill64490 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64492 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 6 then
                player:AddSkill(64492)
                player:GetItems():RemoveItem(402850, 6)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G6#W个#R乾元丹")---
              end           
            elseif  Skill64492 <= 1 then 
            ShowHint("您目前的奇经八脉#R脑户#W已经打通，无需再来")	
				 end
          end
        else
        if GetAnswer() == 27 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 155 then
		ShowHint("你都没有#R155级#W，")
				return 
end		
	   if Skill64492 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64494 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 7 then
                player:AddSkill(64494)
                player:GetItems():RemoveItem(402850, 7)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G7#W个#R乾元丹")---
              end           
            elseif  Skill64494 <= 1 then 
            ShowHint("您目前的奇经八脉#R百会#W已经打通，无需再来")
				 end
          end
        else
        if GetAnswer() == 28 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 165 then
		ShowHint("你都没有#R165级#W，")
				return 
end		
	   if Skill64494 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64496 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 8 then
                player:AddSkill(64496)
                player:GetItems():RemoveItem(402850, 8)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G8#W个#R乾元丹")---
              end           
            elseif  Skill64496 <= 1 then 
            ShowHint("您目前的奇经八脉#R神庭#W已经打通，无需再来")					
				 end
          end
		  end
		  end
		  end
		  end
		  end
	end	
	end	
	end	
	end		
      if GetAnswer() == 4 then
        NpcAsk("冲脉增加防御属性。请一级一级来，不要跳级打通奇经八脉！请选择：")
        SetAnswer(31, "打通横骨")
        SetAnswer(32, "打通大赫")
        SetAnswer(33, "打通气穴")
        SetAnswer(34, "打通四满")
        SetAnswer(35, "打通中注")
        SetAnswer(36, "打通商曲")
        SetAnswer(37, "打通石关")
        SetAnswer(38, "打通阴都")		
        SetAnswer(39, "离开")
        WaitAnswer(39)
        if GetAnswer() == 31 then
		  if bProcess then
            script:SetSaying(true)			
            if Skill64500 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 1 then
                player:AddSkill(64500)
                player:GetItems():RemoveItem(402850, 1)
				ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G1#W个#R乾元丹")---1
              end            
            elseif  Skill64500 <= 1 then 
                 ShowHint("您目前的奇经八脉#R横骨#W已经打通，无需再来")		    
				 end
          end
		else
        if GetAnswer() == 32 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 109 then
		ShowHint("你都没有#R109级#W，")
				return 
end			
	   if Skill64500 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64510 <= 0 then   
			
              if player:GetItems():GetItemCount(402850) >= 2 then
                player:AddSkill(64510)
                player:GetItems():RemoveItem(402850, 2)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G2#W个#R乾元丹")---
              end           
            elseif  Skill64510 <= 1 then 
            ShowHint("您目前的奇经八脉#R大赫#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 33 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 119 then
		ShowHint("你都没有#R109级#W，")
				return 
end	
	   if Skill64510 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64520 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 3 then
                player:AddSkill(64520)
                player:GetItems():RemoveItem(402850, 3)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G3#W个#R乾元丹")---
              end           
            elseif  Skill64520 <= 1 then 
            ShowHint("您目前的奇经八脉#R气穴#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 34 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 129 then
		ShowHint("你都没有#R129级#W，")
				return 
end	
	   if Skill64520 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64530 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 4 then
                player:AddSkill(64530)
                player:GetItems():RemoveItem(402850, 4)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G4#W个#R乾元丹")---
              end           
            elseif  Skill64530 <= 1 then 
            ShowHint("您目前的奇经八脉#R四满#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 35 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 139 then
		ShowHint("你都没有#R139级#W，")
				return 
end	
	   if Skill64530 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64540 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 5 then
                player:AddSkill(64540)
                player:GetItems():RemoveItem(402850, 5)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G5#W个#R乾元丹")---
              end           
            elseif  Skill64540 <= 1 then 
            ShowHint("您目前的奇经八脉#R中注#W已经打通，无需再来")	
end
          end
        else
        if GetAnswer() == 36 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 149 then
		ShowHint("你都没有#R149级#W，")
				return 
end	
	   if Skill64540 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64542 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 6 then
                player:AddSkill(64542)
                player:GetItems():RemoveItem(402850, 6)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G6#W个#R乾元丹")---
              end           
            elseif  Skill64542 <= 1 then 
            ShowHint("您目前的奇经八脉#R商曲#W已经打通，无需再来")	
end
          end
        else
        if GetAnswer() == 37 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 155 then
		ShowHint("你都没有#R155级#W，")
				return 
end	
	   if Skill64542 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64544 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 7 then
                player:AddSkill(64544)
                player:GetItems():RemoveItem(402850, 7)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G7#W个#R乾元丹")---
              end           
            elseif  Skill64544 <= 1 then 
            ShowHint("您目前的奇经八脉#R石关#W已经打通，无需再来")		
end
          end
        else
        if GetAnswer() == 38 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 165 then
		ShowHint("你都没有#R165级#W，")
				return 
end	
	   if Skill64544 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64546 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 8 then
                player:AddSkill(64546)
                player:GetItems():RemoveItem(402850, 8)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G8#W个#R乾元丹")---
              end           
            elseif  Skill64546 <= 1 then 
            ShowHint("您目前的奇经八脉#R阴都#W已经打通，无需再来")		
				 end			
				 end			
				 end			
				 end
          end
     end
 end
 end
 end
 end	
 end
      if GetAnswer() == 5 then
        NpcAsk("带脉增加生命上限。请一级一级来，不要跳级打通奇经八脉！请选择：")
        SetAnswer(41, "打通肓俞")
        SetAnswer(42, "打通生血")
        SetAnswer(43, "打通五枢")
        SetAnswer(44, "打通维道")
        SetAnswer(45, "打通不息")
        SetAnswer(46, "打通仆参")
        SetAnswer(47, "打通跗阳")
        SetAnswer(48, "打通居髎")		
        SetAnswer(49, "离开")
        WaitAnswer(49)
        if GetAnswer() == 41 then
		  if bProcess then
            script:SetSaying(true)			
            if Skill64550 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 1 then
                player:AddSkill(64550)
                player:GetItems():RemoveItem(402850, 1)
				ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G1#W个#R乾元丹")---1
              end            
            elseif  Skill64500 <= 1 then 
                 ShowHint("您目前的奇经八脉#R肓俞#W已经打通，无需再来")		    
				 end
          end
		else
        if GetAnswer() == 42 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 109 then
		ShowHint("你都没有#R109级#W，")
				return 
end		
	   if Skill64550 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64560 <= 0 then   
			
              if player:GetItems():GetItemCount(402850) >= 2 then
                player:AddSkill(64560)
                player:GetItems():RemoveItem(402850, 2)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G2#W个#R乾元丹")---
              end           
            elseif  Skill64560 <= 1 then 
            ShowHint("您目前的奇经八脉#R生血#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 43 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 119 then
		ShowHint("你都没有#R119级#W，")
				return 
end		
	   if Skill64560 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64570 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 3 then
                player:AddSkill(64570)
                player:GetItems():RemoveItem(402850, 3)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G3#W个#R乾元丹")---
              end           
            elseif  Skill64570 <= 1 then 
            ShowHint("您目前的奇经八脉#R五枢#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 44 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 129 then
		ShowHint("你都没有#R129级#W，")
				return 
end
	   if Skill64560 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64580 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 4 then
                player:AddSkill(64580)
                player:GetItems():RemoveItem(402850, 4)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G4#W个#R乾元丹")---
              end           
            elseif  Skill64580 <= 1 then 
            ShowHint("您目前的奇经八脉#R维道#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 45 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 139 then
		ShowHint("你都没有#R139级#W，")
				return 
end	
	   if Skill64580 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64590 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 5 then
                player:AddSkill(64590)
                player:GetItems():RemoveItem(402850, 5)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G5#W个#R乾元丹")---
              end           
            elseif  Skill64590 <= 1 then 
            ShowHint("您目前的奇经八脉#R不息#W已经打通，无需再来")
end
          end
        else
        if GetAnswer() == 46 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 149 then
		ShowHint("你都没有#R149级#W，")
				return 
end	
	   if Skill64590 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64592 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 6 then
                player:AddSkill(64592)
                player:GetItems():RemoveItem(402850, 6)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G6#W个#R乾元丹")---
              end           
            elseif  Skill64592 <= 1 then 
            ShowHint("您目前的奇经八脉#R仆参#W已经打通，无需再来")
end
          end
        else
        if GetAnswer() == 47 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 155 then
		ShowHint("你都没有#R155级#W，")
				return 
end	
	   if Skill64592 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64594 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 7 then
                player:AddSkill(64594)
                player:GetItems():RemoveItem(402850, 7)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G7#W个#R乾元丹")---
              end           
            elseif  Skill64594 <= 1 then 
            ShowHint("您目前的奇经八脉#R跗阳#W已经打通，无需再来")
end
          end
        else
        if GetAnswer() == 48 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 165 then
		ShowHint("你都没有#R165级#W，")
				return 
end	
	   if Skill64594 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64596 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 8 then
                player:AddSkill(64596)
                player:GetItems():RemoveItem(402850, 8)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G8#W个#R乾元丹")---
              end           
            elseif  Skill64596 <= 1 then 
            ShowHint("您目前的奇经八脉#R居髎#W已经打通，无需再来")
				 end			
				 end			
				 end			
				 end
          end
     end
 end
end
end
end
end
      if GetAnswer() == 6 then
        NpcAsk("阴跷脉增加速度属性。请一级一级来，不要跳级打通奇经八脉！请选择：")
        SetAnswer(51, "打通筑宾")
        SetAnswer(52, "打通府舍")
        SetAnswer(53, "打通大横")
        SetAnswer(54, "打通期门")
        SetAnswer(55, "打通天突")
        SetAnswer(56, "打通廉泉")
        SetAnswer(57, "打通阳交")
        SetAnswer(58, "打通风池")		
        SetAnswer(59, "离开")
        WaitAnswer(59)
        if GetAnswer() == 51 then
		  if bProcess then
            script:SetSaying(true)			
            if Skill64600 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 1 then
                player:AddSkill(64600)
                player:GetItems():RemoveItem(402850, 1)
				ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G1#W个#R乾元丹")---1
              end            
            elseif  Skill64600 <= 1 then 
                 ShowHint("您目前的奇经八脉#R筑宾#W已经打通，无需再来")		    
				 end
          end
		else
        if GetAnswer() == 52 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 109 then
		ShowHint("你都没有#R109级#W，")
				return 
end		
	   if Skill64600 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64610 <= 0 then   
			
              if player:GetItems():GetItemCount(402850) >= 2 then
                player:AddSkill(64610)
                player:GetItems():RemoveItem(402850, 2)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G2#W个#R乾元丹")---
              end           
            elseif  Skill64610 <= 1 then 
            ShowHint("您目前的奇经八脉#R府舍#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 53 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 119 then
		ShowHint("你都没有#R119级#W，")
				return 
end		
	   if Skill64610 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64620 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 3 then
                player:AddSkill(64620)
                player:GetItems():RemoveItem(402850, 3)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G3#W个#R乾元丹")---
              end           
            elseif  Skill64620 <= 1 then 
            ShowHint("您目前的奇经八脉#R大横#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 54 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 129 then
		ShowHint("你都没有#R129级#W，")
				return 
end	
	   if Skill64620 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64630 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 4 then
                player:AddSkill(64630)
                player:GetItems():RemoveItem(402850, 4)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G4#W个#R乾元丹")---
              end           
            elseif  Skill64630 <= 1 then 
            ShowHint("您目前的奇经八脉#R期门#W已经打通，无需再来")		
				 end
          end
        else
        if GetAnswer() == 55 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 139 then
		ShowHint("你都没有#R139级#W，")
				return 
end		
	   if Skill64630 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64640 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 5 then
                player:AddSkill(64640)
                player:GetItems():RemoveItem(402850, 5)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G5#W个#R乾元丹")---
              end           
            elseif  Skill64640 <= 1 then 
            ShowHint("您目前的奇经八脉#R天突#W已经打通，无需再来")
				 end
          end
        else
        if GetAnswer() == 56 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 149 then
		ShowHint("你都没有#R149级#W，")
				return 
end		
	   if Skill64640 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64642 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 6 then
                player:AddSkill(64642)
                player:GetItems():RemoveItem(402850, 6)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G5#W个#R乾元丹")---
              end           
            elseif  Skill64642 <= 1 then 
            ShowHint("您目前的奇经八脉#R廉泉#W已经打通，无需再来")
			 end
          end
        else
        if GetAnswer() == 57 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 155 then
		ShowHint("你都没有#R155级#W，")
				return 
end		
	   if Skill64642 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64644 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 7 then
                player:AddSkill(64644)
                player:GetItems():RemoveItem(402850, 7)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G7#W个#R乾元丹")---
              end           
            elseif  Skill64644 <= 1 then 
            ShowHint("您目前的奇经八脉#R阳交#W已经打通，无需再来")
			 end
          end
        else
        if GetAnswer() == 58 then
		  if bProcess then
            script:SetSaying(true)
			if player:GetLevel() < 165 then
		ShowHint("你都没有#R165级#W，")
				return 
end		
	   if Skill64644 < 1 then 
		ShowHint("你前面的奇经八脉都没打通，别想跳级#77")
		return false
		end		
            if Skill64646 <= 0 then   
              if player:GetItems():GetItemCount(402850) >= 8 then
                player:AddSkill(64646)
                player:GetItems():RemoveItem(402850, 8)
				 ShowHint("打通成功#36")
              else
                ShowHint("打通此奇经八脉需要:#G8#W个#R乾元丹")---
              end           
            elseif  Skill64646 <= 1 then 
            ShowHint("您目前的奇经八脉#R风池#W已经打通，无需再来")
				 end			
				 end			
				 end
	end
          end
     end
 end
end
end
end

	  else
	    if GetAnswer() == 73 then
          NpcSay("使用#P修炼丹#W提升修为等级，将不消耗帮内资材。可直接将修为提升至顶级")
		  NpcSay("\\r#R◆◆◆◆◆◆◆#O修炼丹提升修为对照#R◆◆◆◆◆◆◆◆\\r#Y1#W级修炼＝#G1#W枚#R◆#Y2#W级修炼＝#G1#W枚#R◆#Y3#W级修炼＝#G1#W枚#R ◆\\r#Y4#W级修炼＝#G1#W枚#R◆#Y5#W级修炼＝#G1#W枚#R◆#Y6#W级修炼＝#G1#W枚#R ◆\\r#Y7#W级修炼＝#G1#W枚#R◆#Y8#W级修炼＝#G1#W枚#R◆#Y9#W级修炼＝#G1#W枚#R◆\\r#Y10#W级修＝#G1#W枚#R◆#Y11#W级修＝#G141#W枚#R◆#Y12#W级修＝#G165#W枚#R◆\\r#Y13#W级修＝#G191#W枚#R◆#Y14#W级修＝#G219#W枚#R◆#Y15#W级修＝#G235#W枚#R◆\\r#Y16#W级修＝#G260#W枚#R◆#Y17#W级修＝#G291#W枚#R◆#Y18#W级修＝#G293#W枚#R◆\\r#Y19#W级修＝#G309#W枚#R◆#Y20#W级修＝#G426#W枚#R◆#Y21#W级修＝#G550#W枚#R◆\\r#Y22#W级修＝#G694#W枚#R◆#Y23#W级修＝#G728#W枚#R◆#Y24#W级修＝#G851#W枚#R◆\\r#Y25#W级修＝#G976#W枚#R◆（目前只能人物外功，人物外功抗性，人物内功人物内功抗性可提升至25级。）")
        end
	  end
	end
  else

      if GetAnswer() == 73 then
        NpcAsk("要达到我这个境界并不容易，打通奇经八脉修炼需要消耗大量的帮贡和帮派资材。")
        SetAnswer(1, "修炼的类型")
        SetAnswer(2, "修炼的作用")
        SetAnswer(3, "如何在山庄内打通奇经八脉修炼")
        SetAnswer(4, "离开")
        WaitAnswer(4)
        if GetAnswer() == 1 then
            NpcSay("“修炼”按用途可分为“外功强化修炼”，“外功抗性修炼”，“内功强化修炼”和“内功抗性修炼”四种；按作用对象的不同可分为“人物强化”和“同伴强化”两种。")
        else
          if GetAnswer() == 2 then
            NpcSay("\\r外功强化修炼——加强人物外功攻击的伤害效果。\\r外功抗性修炼——加强人物抵抗外功攻击的防御效果。\\r内功强化修炼——加强人物内功攻击的伤害效果以及控制性技能的命中效果。\\r内功抗性修炼——是加强人物抵抗内功攻击的防御效果以及抵抗控制性技能的闪避效果。")
            NpcSay("此外，对个别需要注意的门派，在这里特别说明一下。青衣楼的刺客属于外功门派，其技能“气撼九重天”虽属控制性技能，但不受“内功强化修炼”影响，而直接受“外功强化修炼”加强。同理，鬼蜮的刺客，其技能“勾魂摄心大法”也直接受“外功强化修炼”加强。")
          else
            if GetAnswer() == 3 then
                NpcSay("二级修炼房可以同时打通奇经八脉一种修炼，三级修炼房可以同时打通奇经八脉一两种修炼，四级修炼房可以同时打通奇经八脉三种修炼，五级修炼房可以同时打通奇经八脉四种修炼。只要山庄打通奇经八脉了修炼类型就能打通奇经八脉相应的修炼了。")
            end
          end
        end
      end
    end
  end

AddNpcTable(Npc00767)

