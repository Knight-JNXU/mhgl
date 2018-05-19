--MOB万能解封术

function skill5297CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill5297Use(Atk, Target, battle, skillLv)
	
	
	local buffid = {1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 
					1116, 1117, 1118, 1119, 1120, 1121, 1400, 1403, 1404, 1405, 1406, 1407, 1408, 1409, 1410, 3096}; --对应skillid
	
	local i = 1;
	while buffid[i] ~= nil do
		
		Target:RemoveBuff(buffid[i]);
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end 