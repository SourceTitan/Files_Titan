--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]
local function keko_Titan(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
https = require("ssl.https")
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_keko[1])
JSON = (loadfile  "./libs/dkjson.lua")()
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = {ID = "TextParseModeMarkdown"}
  tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
  },
  }, dl_cb, nil)
  end
  
function getUser(user_id, cb)
  tdcli_function ({
ID = "GetUser",
user_id_ = user_id
  }, cb, nil)
end
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local keko_add_sudo = redis:get('Titan:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if keko_add_sudo then var = true end 
if sudo_add == msg.sender_user_id_ then var = true end
return var
end
local msg = data.message_
text = msg.content_.text_

 if database:get('idTitan:'..bot_id.."keko:re"..text) and msg.reply_to_message_id_ == 0 then
  local keko_info = nil
  function keko333(extra,result,success)
  keko_info = '@'..(result.username_ or 'لا يوجد')..''
  local function getpro(extra, result, success)
  local user_msgs = database:get('Titan:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
  local edit = database:get('Titan:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
  local add = (tonumber(database:get('Titan:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
  if result.photos_[0] then
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get('Titan:'..bot_id..'id:mute'..msg.chat_id_) then
  if not database:get('Titan:'..bot_id..'id:photo'..msg.chat_id_) then
   
  local Titan_new_text = database:get('idTitan:'..bot_id.."keko:re"..text)
  local Titan_new_text = Titan_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#stast',(t or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#add',(add or 'لا يوجد'))
  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,Titan_new_text,msg.id_,msg.id_.."")
  ---
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end

   local Titan_new_text = database:get('idTitan:'..bot_id.."keko:re"..text)
  local Titan_new_text = Titan_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#stast',(t or 'لا يوجد'))   
  local Titan_new_text = Titan_new_text:gsub('#add',(add or 'لا يوجد'))
  send(msg.chat_id_, msg.id_, 1, Titan_new_text, 1, 'html')
  
  end
  else
  end
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get('Titan:'..bot_id..'id:mute'..msg.chat_id_) then
  if not database:get('Titan:'..bot_id..'id:photo'..msg.chat_id_) then
  
  local Titan_new_text = database:get('idTitan:'..bot_id.."keko:re"..text)
  local Titan_new_text = Titan_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#stast',(t or 'لا يوجد'))   
  local Titan_new_text = Titan_new_text:gsub('#add',(add or 'لا يوجد'))
  send(msg.chat_id_, msg.id_, 1, Titan_new_text, 1, 'html')

  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  
  local Titan_new_text = database:get('idTitan:'..bot_id.."keko:re"..text)
  local Titan_new_text = Titan_new_text:gsub('#username',(keko_info or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local Titan_new_text = Titan_new_text:gsub('#stast',(t or 'لا يوجد'))   
  local Titan_new_text = Titan_new_text:gsub('#add',(add or 'لا يوجد'))
  send(msg.chat_id_, msg.id_, 1, Titan_new_text, 1, 'html')  
 
  end
  else
  end
     end
     end
     tdcli_function ({
  ID = "GetUserProfilePhotos",
  user_id_ = msg.sender_user_id_,
  offset_ = 0,
  limit_ = 1
    }, getpro, nil)
  end
  getUser(msg.sender_user_id_, keko333)
  end

if text == "مسح ردود الايدي" and is_sudo(msg) then
local list = redis:smembers("idTitan"..bot_id.."rd:rp")
for k,v in pairs(list) do
database:del('idTitan:'..bot_id.."keko:re"..v)
database:srem("idTitan"..bot_id.."rd:rp",v)
  end
 send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود الايدي ` 🗑", 1, 'md')
    end
if  text == "ردود الايدي" and is_creator(msg) then
    local list = database:smembers("idTitan"..bot_id.."rd:rp")
    text = "💾┇قائمة ردود الايدي ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
  text = text.."*|"..k.."|*~⪼("..v..")\n"
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد ردود الايدي"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
  
if (text and text == 'اضف رد ايدي' and  is_creator(msg) ) then 
  send(msg.chat_id_, msg.id_, 1, '📜┇الان ارسل الكلمه', 1, 'md')
database:set('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_,"yes")
  return false
end  
if text then 
local keko = database:get('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
if keko == 'yes' then 
local t = [[
☑┇ ارسل الان النص
☑┇ يمكنك اضافه :
- #username > اسم المستخدم
- #msgs > عدد رسائل المستخدم
- #id > ايدي المستخدم
- #stast > موقع المستخدم 
- #edit > عدد السحكات
- #add > عدد الجهات
]]
  send(msg.chat_id_, msg.id_, 1, t, 1, 'md')
database:set('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_,"yes2")
database:set('idTitan:'..bot_id.. msg.chat_id_.."keko:add2"..msg.sender_user_id_, text)
  return false
end
end
if text then 
  local keko = database:get('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
  if keko == 'yes2' then 
    send(msg.chat_id_, msg.id_, 1, "☑️┇تم الحفظ", 1, 'md')
database:del('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
local keko = database:get('idTitan:'..bot_id.. msg.chat_id_.."keko:add2"..msg.sender_user_id_)
database:set('idTitan:'..bot_id.."keko:re"..keko,text)
database:del('idTitan:'..bot_id.. msg.chat_id_.."keko:add2"..msg.sender_user_id_)
database:sadd("idTitan"..bot_id.."rd:rp",keko)
    return false
  end
  end
    if (text and text == 'حذف رد ايدي' and is_creator(msg) ) then
      send(msg.chat_id_, msg.id_, 1, '📜┇الان ارسل الكلمه', 1, 'md')
      database:set('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_,"yes3")
      return false
    end  
    if text then 
    local keko = database:get('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
if (keko and keko == 'yes3') then 
send(msg.chat_id_, msg.id_, 1, "☑️┇تم الحذف", 1, 'md')
database:del('idTitan:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
database:del('idTitan:'..bot_id.. "keko:re"..text)
database:srem("idTitan"..bot_id.."rd:rp",text)
      return false
    end
    end
end
return {
	keko_Titan = keko_Titan,
}
--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]
