-- simple lua AI script
--AI脚本例子

function Hello()
	
	print("Lua: Battle Service Hello World")
	
	LuaI.HelloWorld()

end


-- simple random attack enemy

function AIAction(battle, mob)

--[[
	local actorCount = battle:GetActorCount()

print(string.format("Lua AIAction: mob_id %d, mob index %d" .. 

", actorCount %d", mob:GetMob_id(), mob:GetIndex(), actorCount))

local r = math.random(1, actorCount - 1)
	
local index = mob:GetIndex()
	
for i = 0, actorCount - 1 do
		
local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
		if (actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			print(string.format("Lua InputCommand: attack target %d", 
				actor:GetIndex()))
			mob:InputCommand(LuaI.BATCMD_ATTACK, actor:GetIndex(), 0, 0)
			break
		
end
	
end
]]--
	----------------------------------------------
	
	local actorCount = battle:GetActorCount();
	local actorList = {};
	local actorListCount = 0;
	
	for i = 0, actorCount - 1 do
		
		local actor = battle:GetActor(i);
		
		if (actor:GetTeam() ~= mob:GetTeam() and actor:IsValidTarget()) then
			table.insert(actorList, actor:GetIndex());
			actorListCount = actorListCount + 1;
			
		end
		
	end
	
	local R = math.random(1, actorListCount);
	
	mob:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);

end


function LoseMind(battle, char)
	
	local actorCount = battle:GetActorCount();
	local r = math.random(1, actorCount - 1);
	local index = char:GetIndex();
	local flag = 0;
	
	for i = 0, actorCount - 1 do
		
		local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
		if (actor:GetTeam() == char:GetTeam() and actor:IsValidTarget()) then	
			
			if actor:GetIndex() ~= char:GetIndex() then
				
				flag = 1;
				
				local randomSkill = char:GetRandomSkill();
				
				if randomSkill == 0 then
					char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				else
					
					char:InputCommand(LuaI.BATCMD_SKILL, actor:GetIndex(), randomSkill, 0);
				end
				
			break
			
			end
			
		end
		
	end
	
	if flag == 0 then
		
		char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
		
	end

end


function Confusion(battle, char)
	
	local actorCount = battle:GetActorCount();
	local r = math.random(1, actorCount - 1);
	local index = char:GetIndex();
	local flag = 0;
	
	for i = 0, actorCount - 1 do
		
		local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
		if (actor:GetTeam() == char:GetTeam() and actor:IsValidTarget()) then
			
			if actor:GetIndex() ~= char:GetIndex() then
				
				flag = 1;
				char:InputCommand(LuaI.BATCMD_ATTACK, actor:GetIndex(), 0, 0);
				char:IgnoreTeam(true);
				break
			end
		end
	end
	
	if flag == 0 then
		char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);	
	end
end

function Deviation(battle, char)
	
	local actorCount = battle:GetActorCount();
	local r = math.random(1, actorCount - 1);
	local index = char:GetIndex();
	
	for i = 0, actorCount - 1 do
		
		local actor = battle:GetActor(math.fmod((index + r + i) , actorCount));
		if (actor:GetTeam() ~= char:GetTeam() and actor:IsValidTarget()) then
			
			if actor:GetIndex() ~= char:GetIndex() then
				char:InputCommand(LuaI.BATCMD_ATTACK, actor:GetIndex(), 0, 0);
				char:IgnoreTeam(true);
				break
			end
		end
	end
end
