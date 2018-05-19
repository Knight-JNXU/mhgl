--自动解封并添加抗封buff

function buff1627Active(buff, Char, Other, Type) 
	
	if Type == TURN_END then		
		if Char:GetHP() ~= 0 then	
			local buffID = {1000, 1001, 1002, 1003, 1004, 1005, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 
							1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 
							1122, 1124, 1126, 1531, 1540, 1541, 7025,
							1123, 1400, 1403, 1404, 1405, 1406, 1407, 1408, 1409, 1410, 3096, 3098, 3099,90001,90002 -1}			
			local i = 1;			
			while buffID[i] > 0 do
				if Char:IsBuffExist(buffID[i]) then
					Char:AddBuff(1628, 0, 0, 0, 2, 100)
				end
				Char:RemoveBuff(buffID[i]);
				i = i + 1;
			end
		end
	end
	
end
