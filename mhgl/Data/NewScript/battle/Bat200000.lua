Preload("Quest63532.lua")
Bat000200000 = {npc_id = 200000,name = GetNpcName(200000),addMob = true,BossDead = false,kill = false,weizhi = 0,catch = false,r = math.random(1,16)}
function Bat000200000:OnInit()
	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)		
	local base_lv = player:GetLevel() 
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
       battle:AddMob(431, 1, 255)
	battle:AddMob(431, 1, 255)
	battle:AddMob(431, 1, 255)
	battle:AddMob(431, 1, 255)
	battle:AddMob(2031, 1, 255)	
	battle:AddMob(2032, 1, 255)	
	battle:AddMob(2033, 1, 255)	
	battle:AddMob(2034, 1, 255)	
	battle:AddMob(2035, 1, 255)	
	battle:AddMob(2036, 10, 255)	
	battle:AddMob(2037, 11, 255)
	battle:AddMob(2038, 12, 255)	
	battle:AddMob(2040, 13, 255)	
	battle:AddMob(2036, 14, 255)
end

function Bat000200000:OnPreTurn(turn)
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


function Bat000200000:OnPostTurn(turn)
end
			  
			  
function Bat000200000:OnFinish(turn, result)
local flag = player:GetQuests():GetFlag(60230)
  local leader = battle:GetCharacter(0)
  if not leader:IsDead() then
	  for i = 0, battle:GetCharacterCount() - 1 do
	    local actor = battle:GetCharacter(i)
			local member = actor:GetOwner()
		  if member then
				Quest63532:ReturnInBat(member)
        local q = math.random(100,250)
        local money = member:GetLevel() * q
        local a = math.random(18000,20000)
        local Exp = member:GetLevel() * a
        member:ChangeExp(Exp)
        member:ChangeMoney(money)
        ShowError(string.format("#W战斗胜利,获得经验%s",Exp))
        ShowError(string.format("#W战斗胜利,获得银两%s",money))
      end
    end
  end
end

-- 必需在脚本最後将战斗表加入系统中
function Bat000200000:OnEscape(turn, actor)
end

AddBattleTable(Bat000200000)
