--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]

local function keko_Titan(data)
URL = require('socket.url')
msg = data.message_
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
if (text and text == 'نقل الكروبات' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local oldgp = database:smembers("bot:groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل الكروبات القديمه\nعدد الكروبات القديمه  :"..#oldgp, 1, 'html')
	for i=1, #oldgp do
		if not database:sismember( 'Titan:'..bot_id.."groups",oldgp[i]) then
    database:sadd( 'Titan:'..bot_id.."groups",oldgp[i])
    end
  end
	send(msg.chat_id_, msg.id_, 1, "تم نقل الكروبات", 1, 'html')
end

if (text and text == 'نقل الادمنيه' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل ادمنيه", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:mods:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'mods:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل الادمنيه", 1, 'html')
end

if (text and text == 'نقل المدراء' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المدراء", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:owners:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'owners:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المدراء", 1, 'html')
end

if (text and text == 'نقل المنشئين' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المنشئين", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:creator:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'creator:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المنشئين", 1, 'html')
end

if (text and text == 'نقل المميزين' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المميزين", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:vipgp:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'vipgp:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المميزين", 1, 'html')
end

if (text and text == 'نقل المطورين' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
send(msg.chat_id_, msg.id_, 1, "جاري نقل نقل المطورين", 1, 'html')
local list = redis:smembers('dev'..bot_id)
for k,v in pairs(list) do
redis:set('Titan:'..bot_id..'sudoo'..v..'', 'yes')
redis:sadd('Titan:'..bot_id..'dev', v)
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المطورين", 1, 'html')
end

if (text and text == 'نقل المكتومين' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المكتومين", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:muted:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'muted:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المكتومين", 1, 'html')
end

if (text and text == 'نقل المحظورين' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المحظورين", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:banned:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'banned:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المحظورين", 1, 'html')
end

if (text and text == 'نقل المكتومين عام' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المكتومين", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:gmuted:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'gmuted:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المكتومين", 1, 'html')
end

if (text and text == 'نقل المحظورين عام' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل المحظورين عام ", 1, 'html')
for i=1, #gps do
local list = database:smembers('bot:gbanned:'..gps[i])
for k,v in pairs(list) do
if not database:sismember('Titan:'..bot_id..'mods:'..gps[i],v) then
database:sadd('Titan:'..bot_id..'gbanned:'..gps[i],v)
end
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل المحظورين", 1, 'html')
end

if (text and text == 'نقل القفولات' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل القفولات", 1, 'html')
for i=1, #gps do
if database:get('bot:hashtag:mute'..gps[i]) then
database:set("lock_tag:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:cmd:mute'..gps[i]) then
database:set("lock_sarha:Titan"..gps[i]..bot_id,"ok")
end
if database:get('editmsg'..gps[i]) then
database:set("lock_edit:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:gifs:mute'..gps[i]) then
database:set("lock_gif:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:inline:mute'..gps[i]) then
database:set("lock_inline:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:document:mute'..gps[i]) then
database:set("lock_files:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:markdown:mute'..gps[i]) then
database:set("lock_mark:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:photo:mute'..gps[i]) then
database:set("lock_photo:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:sticker:mute'..gps[i]) then
database:set("lock_stecker:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:video:mute'..gps[i]) then
database:set("lock_video:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:text:mute'..gps[i]) then
database:set("lock_chat:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:pin:mute'..gps[i]) then
database:set("lock_pin:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:music:mute'..gps[i]) then
database:set("lock_audeo:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:voice:mute'..gps[i]) then
database:set("lock_voice:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:links:mute'..gps[i]) then
database:set("lock_link:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:tgservice:mute'..gps[i]) then
database:set("lock_new:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:bots:ban'..gps[i]) then
database:set("lock_botAndBan:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:bots:mute'..gps[i]) then
database:set("lock_bot:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:contact:mute'..gps[i]) then
database:set("lock_contact:Titan"..gps[i]..bot_id,"ok")
end	
if database:get('bot:english:mute'..gps[i]) then
database:set("lock_en:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:arabic:mute'..gps[i]) then
database:set("lock_ar:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:forward:mute'..gps[i]) then
database:set("lock_fwd:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:note:mute'..gps[i]) then
database:set("lock_note:Titan"..gps[i]..bot_id,"ok")
end
if database:get('bot:tag:mute'..gps[i]) then
database:set("lock_username:Titan"..gps[i]..bot_id,"ok")
end	  

end
send(msg.chat_id_, msg.id_, 1, "تم نقل القفولات", 1, 'html')
end

if (text and text == 'نقل ردود المدراء' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل ردود المدراء", 1, 'html')
for i=1, #gps do
local list = redis:smembers('kekore'..bot_id..''..gps[i]..'')
for k,v in pairs(list) do
local keko = redis:get('keko'..v..''..bot_id..''..gps[i]..'')
redis:set('Titan:'..bot_id..'keko'..v..''..gps[i]..'', keko)
redis:sadd('Titan:'..bot_id..'kekore'..gps[i]..'', v)
end
end
send(msg.chat_id_, msg.id_, 1, "تم نقل ردود المدراء", 1, 'html')
end

if (text and text == 'نقل ردود المطور' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
local gps = database:smembers( 'Titan:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, "جاري نقل ردود المطور", 1, 'html')
local list = redis:smembers('kekoresudo'..bot_id)
for k,v in pairs(list) do
local keko = redis:get('keko'..v..''..bot_id)
redis:set('Titan:'..bot_id..'keko'..v..'', keko)
redis:sadd('Titan:'..bot_id..'kekoresudo', v)
end
send(msg.chat_id_, msg.id_, 1, "تم نقل ردود المطور", 1, 'html')
end

if (text and text == 'اوامر النقل' and tonumber(msg.sender_user_id_) == tonumber(sudo_add)) then 
text = [[
نقل الكروبات
نقل الادمنيه
نقل المدراء
نقل المنشئين
نقل المميزين
نقل المكتومين
نقل المحظورين
نقل المكتومين عام
نقل المحظورين عام
نقل القفولات
نقل ردود المدراء
نقل ردود المطور
نقل المطورين
]]
send(msg.chat_id_, msg.id_, 1,text, 1, 'html')
end
    end
    return {
        keko_Titan = keko_Titan,
    }
    
    --[[
     BY : TitanTEAM
     Channel Files : https://t.me/TitanFiles
    ]]
    