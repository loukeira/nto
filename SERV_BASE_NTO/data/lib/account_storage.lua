function getAccountStorageValue(accid, key)
local value = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = " .. accid .. " and `key` = " .. key .. " LIMIT 1;")
if(value:getID() ~= -1) then
return value:getDataInt("value")
else
return -1
end
value:free()
end

function setAccountStorageValue(accid, key, value)
local getvalue = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = " .. accid .. " and `key` = " .. key .. " LIMIT 1;")
if(getvalue:getID() ~= -1) then
db.executeQuery("UPDATE `account_storage` SET `value` = " .. accid .. " WHERE `key`=" .. key .. " LIMIT 1');")
getvalue:free()
return 1
else
db.executeQuery("INSERT INTO `account_storage` (`account_id`, `key`, `value`) VALUES (" .. accid .. ", " .. key .. ", '"..value.."');")
return 1
end
end﻿