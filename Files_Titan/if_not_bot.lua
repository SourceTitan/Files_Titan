--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]
local function keko_Titan(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
HTTPS = require("ssl.https")
JSON = (loadfile  "./libs/dkjson.lua")()
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_keko[1])
msg = data.message_
bot=dofile('./libs/utils.lua')
text = msg.content_.text_
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
sudo_users = {sudo_add,bot_id}
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local keko_add_sudo = redis:get('Titan:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if keko_add_sudo then var = true end return var
end
if (text and text == "تفعيل كشف البوتات" and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل عمليه كشف البوتات عند التفعيل ", 1, 'html')
database:set("Titan:get_admin_bot:"..bot_id,"ok")
end 
if (text and text == "تعطيل كشف البوتات" and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
send(msg.chat_id_, msg.id_, 1, "🔓┇تم تعطيل خاصيه كشف البوتات عند التفعيل", 1, 'html')
database:del("Titan:get_admin_bot:"..bot_id)
end 
local stop2 = nil
if (text and database:get("Titan:get_admin_bot:"..bot_id) and is_sudo(msg) and text == "تفعيل") then
function cb(t1,t2)
for i=1,#t2.members_ do 
if t2.members_[i].status_.ID == "ChatMemberStatusEditor" then 
id = t2.members_[i].user_id_
if id ~= bot_id then 
function keko_ts(y1,y2)
if y2.username_ and not stop2 then 
send(msg.chat_id_, msg.id_, 1,"👤┇عزيزي المطور تم الغاء عمليه التفعيل\n📊┇بسبب كشف بوت حمايه\n\n🔖┇البوت { ["..y2.first_name_.."](t.me/"..y2.username_..") }\n\n🗳┇قم بتنزيل البوت او طرده وعاده عمليه التفعيل", 1, 'md')
database:srem("thsake:gog"..bot_id, msg.chat_id_)
database:del('Titan:'..bot_id.."charge:"..msg.chat_id_)
stop2 = "ok"
return "stop"
end
end
getUser(id, keko_ts)
end
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
end
return {
keko_Titan = keko_Titan,
}
--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]
