--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]

local function keko_Titan(data)
JSON = (loadfile  "./libs/dkjson.lua")()
local msg = data.message_
URL = require('socket.url')
text = msg.content_.text_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
HTTPS = require("ssl.https")
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_keko[1])
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
function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('Titan:'..bot_id..'admins:', user_id)  
local owner = database:sismember('Titan:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('Titan:'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local keko_add_sudo = redis:get('Titan:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
function is_creator(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creator = database:sismember('Titan:'..bot_id..'creator:'..chat_id, user_id) 
local admin = database:sismember('Titan:'..bot_id..'admins:', user_id)
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('Titan:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
function is_admin(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false 
local admin = database:sismember('Titan:'..bot_id..'mods:'..chat_id, user_id)  
if admin then var = true end
return var
end

if text then 
local keko_text = nil
if is_creator(msg) then 
keko_text = database:get("Titan:re:cre:n"..bot_id..msg.chat_id_..text)
elseif is_owner(msg) then 
keko_text = database:get("Titan:re:ow:n"..bot_id..msg.chat_id_..text)
elseif is_admin(msg) then 
keko_text = database:get("Titan:re:ad:n"..bot_id..msg.chat_id_..text)
elseif (not is_admin(msg) and not is_owner(msg) and not is_creator(msg)) then 
keko_text = database:get("Titan:re:admin:n"..bot_id..msg.chat_id_..text)
end
if keko_text then 
send(msg.chat_id_, msg.id_, 1, keko_text, 1, 'md')
end
if is_creator(msg) then 
if text == "اضف رد للمنشئ" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"cr")
return "keko"
elseif text == "اضف رد للمدير" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"ow")
return "keko"
elseif text == "اضف رد للادمن" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"admin")
return "keko"
elseif text == "اضف رد للعضو" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"md")
return "keko"
end
if text == "حذف رد للمنشئ" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"cr")
return "keko"
elseif text == "حذف رد للمدير" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"ow")
return "keko"
elseif text == "حذف رد للادمن" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"admin")
return "keko"
elseif text == "حذف رد للعضو" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"md")
return "keko"
end
end
if database:get("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_) then 
local Titan_s = database:get("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
if Titan_s == "cr" then 
database:del("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد المنشئ", 1, 'md')
database:del("Titan:re:cre:n"..bot_id..msg.chat_id_..text)
elseif Titan_s == "ow" then 
database:del("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد المدير", 1, 'md')
database:del("Titan:re:ow:n"..bot_id..msg.chat_id_..text)
elseif Titan_s == "admin" then 
database:del("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد الادمن", 1, 'md')
database:del("Titan:re:ad:n"..bot_id..msg.chat_id_..text)
elseif Titan_s == "md" then 
database:del("Titan:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد العضو", 1, 'md')
database:del("Titan:re:admin:n"..bot_id..msg.chat_id_..text)  
end
end
if database:get("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_) then 
local Titan_s = database:get("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
if Titan_s == "cr" then 
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"cr2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "keko"
elseif Titan_s == "ow" then
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"ow2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "keko" 
elseif Titan_s == "admin" then
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"admin2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "keko" 
elseif Titan_s == "md" then
database:set("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"md2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "keko" 
end
if Titan_s == "cr2" then 
database:set("Titan:re:cre:n"..bot_id..msg.chat_id_..(database:get("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد المنشئ", 1, 'md')
database:del("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "keko"
elseif Titan_s == "ow2" then
database:set("Titan:re:ow:n"..bot_id..msg.chat_id_..(database:get("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد المدير", 1, 'md')
database:del("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "keko" 
elseif Titan_s == "admin2" then
database:set("Titan:re:ad:n"..bot_id..msg.chat_id_..(database:get("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد الادمن", 1, 'md')
database:del("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "keko" 
elseif Titan_s == "md2" then
database:set("Titan:re:admin:n"..bot_id..msg.chat_id_..(database:get("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("Titan:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد العضو", 1, 'md')
database:del("Titan:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "keko" 
end

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
