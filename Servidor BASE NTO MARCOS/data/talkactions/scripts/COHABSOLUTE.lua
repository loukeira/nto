-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- //

function onSay(cid, words, param)

 if getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER then
  if getPlayerStorageValue(cid, COH_PUSHSTOR) < os.time() then
   if getGlobalStorageValue(COH_STATUS) == getPlayerGuildName(cid) then
    if isInArea(getThingPos(cid), COH_AREA[1], COH_AREA[2]) then
     if #getMembersOnline(getPlayerGuildId(cid)) > 0 then
      for index, creature in ipairs(getMembersOnline(getPlayerGuildId(cid))) do
       if (getTileInfo(getThingPos(creature)).protection ~= true) then
        return doPlayerSendCancel(cid, "[CoH] Os membros devem estar em área PZ.")
       end
       doTeleportThing(creature, getThingPos(cid))
      end
      setPlayerStorageValue(cid, COH_PUSHSTOR, os.time() + COH_PUSHTIME) 
      doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "[Guild Vs Guild] Você teleportou seus membros, comando pode ser usado a cada "..tostring(COH_PUSHTIME / 60).." minuto(s).")
     else
      doPlayerSendCancel(cid, "[Gvg] Para executar isso, sua guild deve ter 2 ou mais membros online.") 
     end
    else
     doPlayerSendCancel(cid, "[Gvg] Você deve estar no castelo.")
    end
   else
    doPlayerSendCancel(cid, "[Gvg] Sua guild não é dona do castelo.")
   end
  else
   doPlayerSendCancel(cid, "[Gvg] Você deve aguardar "..tostring(math.ceil((getPlayerStorageValue(cid, COH_PUSHSTOR) - os.time()) / 60)).." minuto(s) para usar este comando.")
  end
 else
  doPlayerSendCancel(cid, "[Gvg] Você deve ser líder de uma guild para executar este comando.")
 end
 return true
end

function getMembersOnline(id)
 local mbr = {}

 for index, creature in ipairs(getPlayersOnline()) do
  if getPlayerGuildId(creature) == id then
   if getCreatureSkullType(creature) < 3 then
    table.insert(mbr, creature)
   end
  end                      
 end
 return mbr or #mbr
end