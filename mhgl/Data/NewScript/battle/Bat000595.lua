--[[
灭青任务，耳朵负责
]]

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
Preload("Quest30400.lua")
--595
Bat000595 = {addMob = true,kill = false,weizhi = 0,catch = false,r = math.random(1, 3)
}

-- 战斗开始之前
function Bat000595:OnInit()
  local MobId = {215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249}
  local i = 1
  local o = math.random(3,5)
  for i = 0, o do
    battle:AddMob(RandTable(MobId), i + 1)
  end
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000595:OnPreTurn(turn)
	-- 在第一回合开始的时候
	battle:DisableCmd(LuaI.BATCMD_HELP)
	if  self.addMob == false then
		local actorCount = battle:GetActorCount();				
		for i = 0, actorCount - 1 do
			local actor = battle:GetActor(i);							
			if (actor ~= nil and (actor:IsPlayer() or actor:IsParnter())) then
				actor:AddBuff(3102,1,0,0,120,100);
			end					
		end
	end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000595:OnPostTurn(turn)
    if battle:GetTeamExist(0) == 0 then
	    if math.random(1, 4000) == 1 then
	        if self.addMob then
				local r = math.random(1, 3)
				self.addMob = false -- 新增完成 把 flag 改為 false, 這樣就可以避免不停重覆新增mob, 達到只會新增一次的效果
				if self.r == 1 then
					battle:AddMob(1, 0)
					battle:BatSay("\#Y[心眉大师]:\#W阿弥陀佛，檀越又为武林贡献了。", 0, true, 52, 255)
				elseif self.r == 2 then
					battle:AddMob(1, 0)
					battle:BatSay("\#Y[江轻霞]:\#W几位身手不错，我仰慕多时了。", 0, true, 160, 255)
				else
					battle:AddMob(1, 0)
					battle:BatSay("\#Y[白玉京]:\#W与青龙会为敌的人就是我的朋友，带上我一起剿灭青龙会吧。", 0, true, 300281, 255)
				end
				battle:SetForceEnd(false)	--------强制延长一回合
			end
		end
  end
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000595:OnFinish(turn, result)
	if result == LuaI.END_WIN then
		for i = 1, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
            if actor:GetOwner() then
				if not actor:IsDead() then
					Quest30400:Return(actor:GetOwner(),partnerAlive)
				else
					Quest30400:PlayerWinButDied(actor:GetOwner())
				end
            end
		end
		
		local leader = battle:GetCharacter(0)
		local partner = leader:GetCurPartner()
        local partnerAlive = partner and not partner:IsDead() or false
        if leader:GetOwner() then
			if not leader:IsDead() then
				Quest30400:leaderReturn(leader:GetOwner(),partnerAlive)
			else
				Quest30400:PlayerWinButDied(leader:GetOwner())
			end
		end
		
		local actorCount = battle:GetActorCount();				
			for i = 0, actorCount - 1 do
				local actor = battle:GetActor(i);
				if (actor ~= nil and actor:IsMob() and not actor:IsParnter() and actor:IsBuffExist(3101)) then
					self.kill = true;
					self.weizhi = actor:FindBuff(3101):GetBuffValue2();		
					
				end
				
				if (actor ~= nil and actor:IsPlayer() and actor:IsBuffExist(4000)) then
					self.catch = true;
					self.weizhi = actor:FindBuff(4000):GetBuffValue2();						
				end
				
			end	
									
		if self.kill then
			--local killername = battle:GetActor(self.weizhi):GetOwner():GetName()
			local killername = battle:GetActor(self.weizhi):GetOwner():GetCharNameLink()
			if self.r == 1 then
				script:Rumor(string.format("\#A心眉大师\#O对着 %s \#O合十念道：施主放下屠刀，立地成佛……话音未落就被 %s \#O一招击倒。#039",killername,killername), false)
			elseif self.r == 2 then
				script:Rumor(string.format("\#A江轻霞\#O临死前望着 %s \#O低吟道：轻轻的我走了正如我轻轻的来……#026",killername), false)
			else
				script:Rumor(string.format("\#A白玉京\#O被 %s \#O击中要害，倒下之前疑惑的问道：莫非你是青龙会的卧底？#048",killername), false)
			end
		end	
		
		if self.catch then
			--local catcher = battle:GetActor(self.weizhi):GetOwner():GetName()
			local catcher = battle:GetActor(self.weizhi):GetOwner():GetCharNameLink()
			if self.r == 1 then
				script:Rumor(string.format("看来 %s \#O宅心仁厚，竟说服\#A心眉大师\#O与之一起云游四海。#042",catcher), false)
			elseif self.r == 2 then
				script:Rumor(string.format("能够成功说服\#A江轻霞\#O追随其左右， %s \#O的魅力还真是不一般。#093",catcher), false)
			else
				script:Rumor(string.format("\#A白玉京\#O对着 %s \#O一抱拳说道：阁下为正义四处剿灭青龙会之举值得我辈学习，从今往后我也愿助阁下一臂之力。#102",catcher), false)
			end
		end
		if npc then
			npc: Destroy()
		end
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000595)
