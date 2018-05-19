Preload("Quest63525.lua")
Bat000522 = {npc_id = 522,name = GetNpcName(522),addMob = true,BossDead = false,kill = false,weizhi = 0,catch = false,r = math.random(1,16)}
function Bat000522:OnInit()
	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)		
	local base_lv = player:GetLevel() 
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(517, 1, 50)
	battle:AddMob(517, 1, 50)
	battle:AddMob(517, 1, 50)	
	battle:AddMob(517, 1, 50)	
	battle:AddMob(517, 1, 50)	
	battle:AddMob(517, 1, 50)	
	battle:AddMob(517, 1, 50)	
	battle:AddMob(517, 1, 50)	
	battle:AddMob(517, 1, 50)
end

function Bat000522:OnPreTurn(turn)
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


function Bat000522:OnPostTurn(turn)
end
			  
			  
function Bat000522:OnFinish(turn, result)
local flag = player:GetQuests():GetFlag(60230)
  local leader = battle:GetCharacter(0)
  if not leader:IsDead() then
	  for i = 0, battle:GetCharacterCount() - 1 do
	    local actor = battle:GetCharacter(i)
			local member = actor:GetOwner()
		  if member then
				Quest63525:ReturnInBat(member)
				local A = math.random(1,1500)
                 if A <= 1500 then
				   player:GetQuests():SetFlag(60230, flag + 2) 
			       ShowError("#W获得副本积分2点") 
        end
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
function Bat000522:OnEscape(turn, actor)
end

AddBattleTable(Bat000522)
