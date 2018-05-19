--MOB万能解毒术

function skill5296CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5296Use(Atk, Target, battle, skillLv)
	
	
	local buffid = {1000,1001,1002,1003,1004,1005,3098,3099};--对应skillid	
	local i = 1;
	
	while buffid[i] ~= nil do			
		Target:RemoveBuff(buffid[i]);				
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end 