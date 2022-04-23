RegisterServerEvent('addtodb')
AddEventHandler('addtodb',function(prize)

id = ExtractIdentifiers()
print(prize)
TriggerEvent('sqlcheck',os.time(),id,prize,source)

end)

function ExtractIdentifiers() --Function to get the license 

    for k,v in pairs(GetPlayerIdentifiers(source))do
      --print(v)
          
        if string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
          local identifier = string.gsub(license, 'license:', '')
        -- print(identifier)
          return identifier
        end
      end
      
  end

RegisterServerEvent('sqlcheck')
AddEventHandler('sqlcheck',function(time,id,prize,source)
    print(prize)
    
MySQL.query('SELECT time FROM luckyspin WHERE id = ?',{id},function(result)
if #result == 0 then
    TriggerEvent('sqlinsert',time,id,prize,source) 
elseif tonumber(result[1].time) + 900 < time  then 
    TriggerEvent('chattrigger',source,"You got your price "..prize)
 
    MySQL.Async.execute('UPDATE luckyspin  SET time = ? , prize = ? WHERE id = ?',{time,prize,id})
else TriggerEvent('chattrigger',source,"Time has not passed")
end



end)

end)


RegisterServerEvent('chattrigger')
AddEventHandler('chattrigger',function(source,text)
    TriggerClientEvent('chatmsg',source,text)
    print(source)
end)

RegisterServerEvent('sqlinsert')
AddEventHandler('sqlinsert',function(time,id,prize,source)
    TriggerEvent('chattrigger',source,"You got your price "..prize)
MySQL.query('INSERT INTO luckyspin (id,prize,time) VALUES (?,?,?)' , {id,prize,time},

function(result)
--Add the prize you want to give to the player

end)    

end)


