Preload("Inst00001.lua")
Preload("Inst00002.lua")


-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00300 = {							-- 杵官王
	npc_id = 300,						-- NPC ID
	name = GetNpcName(300),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00300:Talk(bProcess)
  local guild = player:GetGuild()
  local guildPos = player:GetGuildPos()
  NpcAsk("我就是所有帮派的总管，你找我有什么事吗？")
  SetAnswer(1,"我要回自己帮派！ ")
  SetAnswer(2,"新手帮派 ")
  SetAnswer(3,"加入帮派 ")
  SetAnswer(4,"新建帮派 (自立门户)")
  if guildPos == 1 then
     SetAnswer(9,"建立山庄 (帮主使用)")
  end
  SetAnswer(5,"我们要解散同盟关系 ")
  SetAnswer(6,"我们要同盟 ")
  SetAnswer(7,"帮派评价 ")
  SetAnswer(8,"响应帮派 ")
  SetAnswer(10,"没事啦 ")
  WaitAnswer(10)
  if GetAnswer() == 1 then 
		if  player:HasGuild() == false then
			NpcSay("需要加入拥有山庄的帮派才可以进入帮派。" )
			return
		end
		local Guild_uid = player:GetGuild():GetGuild_uid();
		if party then	
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				if  member:HasGuild() == false then
					NpcSay("帮派暂不对外开放，请不要携带不是和你相同帮派的玩家进入。" )
					return
				end
				if member:GetGuild():GetGuild_uid() ~= Guild_uid then
					NpcSay("帮派暂不对外开放，请不要携带不是和你相同帮派的玩家进入。")
					return
				end
			end
		end	
		if player:GetGuild():GetManorScale() == 0 then
			NpcSay("你所在的帮派没有建立山庄。" )
			return
		end
	
	
		if player:GetGuild():GetManorScale() == 1 then
			if bProcess then
				script:SetSaying(true)
				local allow, err = CanEnterInstance(Inst00001)
				if allow then
					ShowMessage("进入帮派")
					EnterInstance(Inst00001, 149,66, 180)
				else
					NpcSay(string.format("%s，不能进入 InstTest1。", err))
				end
			end
		
		elseif player:GetGuild():GetManorScale() == 2 then
			if bProcess then
				script:SetSaying(true)
				local allow, err = CanEnterInstance(Inst00001)
				if allow then
					ShowMessage("进入帮派")
					EnterInstance(Inst00001, 149,66, 180)
				else
					NpcSay(string.format("%s，不能进入 InstTest1。", err))
				end
			end

		elseif player:GetGuild():GetManorScale() == 3 then
			if bProcess then
				script:SetSaying(true)
				local allow, err = CanEnterInstance(Inst00001)
				if allow then
					ShowMessage("进入帮派")
					EnterInstance(Inst00001, 149,66, 180)
				else
					NpcSay(string.format("%s，不能进入 InstTest1。", err))
				end
			end
	
		elseif player:GetGuild():GetManorScale() == 4 then
			if bProcess then
				script:SetSaying(true)
				local allow, err = CanEnterInstance(Inst00001)
				if allow then
					ShowMessage("进入帮派")
					EnterInstance(Inst00001, 149,66, 180)
				else
					NpcSay(string.format("%s，不能进入 InstTest1。", err))
				end
			end
	
		elseif player:GetGuild():GetManorScale() == 5 then
			if bProcess then
				script:SetSaying(true)
				local allow, err = CanEnterInstance(Inst00001)
				if allow then
					ShowMessage("进入帮派")
					EnterInstance(Inst00001, 149,66, 180)
				else
					NpcSay(string.format("%s，不能进入 InstTest1。", err))
				end
			end
	  end
	
	elseif GetAnswer() == 3 and IsProcess() then
	  player:OpenGuildApplyMenu()
  elseif GetAnswer() == 4 then
    if player:HasGuild() then
      NpcSay("阁下已是有帮之人，做人岂能忘本？")
      return
    end
    if player:GetLevel() < 20 then
      NpcSay("开帮需要人物等级>=20级")
      return
    end
    if player:GetMoney() < 3000000 then
      NpcSay("开帮需要消耗3000000银两，你身上的钱不够啊~")
      return
    end
    player:RemoveGuildApply()
    local ans = AskString("请输入帮派名称", "")
    local guild = player:GetGuild();
    local guildPos = player:GetGuildPos();
    if bProcess and player:CreateGuild(ans) then
      player:ChangeMoneyForScript(-3000000, 13006)
      guild:SetNewManorScale(1)
    end
  elseif GetAnswer() == 9 then
    if guild == nil and guildPos == 1 then
      NpcSay("必须为帮主才有资格建立山庄。")
      return
    end
    if player:GetGuild():GetManorScale() ~= 0 then
      NpcSay("提升更高的山庄规模去找你们的山庄总管吧。")
      return
    end
    if bProcess then
      guild:SetNewManorScale(1)
    end
  end
end
          
        
      
      

    














-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00300)
