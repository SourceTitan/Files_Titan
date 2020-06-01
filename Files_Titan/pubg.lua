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
  -----------------------
  if (text and text == 'تفعيل وضع حسابي') and (is_owner(msg) or is_creatorbasic(msg)) then
if not database:get('Titan:'..bot_id..'pubgacuount'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔓┇حسابي مفعله بالفعل  !', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔓┇تم تفعيل  وضع حسابي 🎮', 1, 'md')
database:del('Titan:'..bot_id..'pubgacuount'..msg.chat_id_)
end
end
if (text and text == 'تعطيل وضع حسابي')   and (is_owner(msg) or is_creatorbasic(msg)) then
if database:get('Titan:'..bot_id..'pubgacuount'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔓┇حسابي معطل بالفعل  !', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔐┇تم تعطيل  وضع حسابي 🎮', 1, 'md')
database:set('Titan:'..bot_id..'pubgacuount'..msg.chat_id_,true)
end
end
 -----------------------
  if not database:get('Titan:'..bot_id..'pubgacuount'..msg.chat_id_) then
if (text and text == 'وضع حسابي') then
send(msg.chat_id_, msg.id_, 1, '🕹※ الان ارسل اسم حسابك ', 1, 'html')
redis:set('Titan:'..bot_id..'n1'..msg.sender_user_id_..'','yes')
return false end 
local keko2 = redis:get('Titan:'..bot_id..'n1'..msg.sender_user_id_)
if keko2 == 'yes' then
if text:match("^(.*)$") then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️※ تم حفظ الاسم ✓\n🕹※ الان ارسل ايدي حسابك', 1, 'html')
redis:set('Titan:'..bot_id..'n1'..msg.sender_user_id_..'','no')
redis:set('Titan:'..bot_id..'name_acount'..msg.sender_user_id_, text)
redis:set('Titan:'..bot_id..'n2'..msg.sender_user_id_ ,'yes')
return false end
end 
local keko2 = redis:get('Titan:'..bot_id..'n2'..msg.sender_user_id_)
if keko2 == 'yes' then
if text:match("^(%d+)$") then
redis:set('Titan:'..bot_id..'idacount'..msg.sender_user_id_, text)
redis:set('Titan:'..bot_id..'n2'..msg.sender_user_id_, 'no')
local aa = [[
🙋🏻‍♂️※ تم حفض الايدي ✓
🕹※ الان ارسل تقيمك
ارسل تقيمك كمثال ⚜️: 
دايموند 1
بلاتينيوم 3
كراون 2
ايس 
كونكرير 
]]
send(msg.chat_id_, msg.id_, 1, aa , 1, 'html')
redis:set('Titan:'..bot_id..'n3'..msg.sender_user_id_, 'yes')
return false 
else 
send(msg.chat_id_, msg.id_, 1, '🕹※ هناك خطاء في الايدي حاول مره اخرئ', 1, 'html')
return false end
end
local keko2 = redis:get('Titan:'..bot_id..'n3'..msg.sender_user_id_)
if keko2 == 'yes' then
if text:match("^برونز (%d+)$") or text:match("^كولد (%d+)$") or text:match("^بلاتينيوم (%d+)$") or text:match("^دايموند (%d+)$") or text:match("^كراون (%d+)$") or text:match("^ايس$") or text:match("^كونكرير$") then
redis:set('Titan:'..bot_id..'n3'..msg.sender_user_id_, 'no')
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️※ تم حفض تقيمك ✓\n🕹※ تم حفض حسابك ✓', 1, 'html')
redis:set('Titan:'..bot_id..'acctear'..msg.sender_user_id_, text)
return false 
else 
send(msg.chat_id_, msg.id_, 1, '🕹※ هناك خطاء في التقيم حاول مره اخرئ', 1, 'html')
return false end
end
if (text and text == 'مسح حسابي')then
redis:del('Titan:'..bot_id..'idacount'..msg.sender_user_id_)
redis:del('Titan:'..bot_id..'acctear'..msg.sender_user_id_)
redis:del('Titan:'..bot_id..'name_acount'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,"🎟 ※ تم مسح حسابك", 1, 'md')
end
if (text and text == 'حسابي')then
if redis:get('Titan:'..bot_id..'idacount'..msg.sender_user_id_)then
local n = redis:get('Titan:'..bot_id..'idacount'..msg.sender_user_id_)
local nn = redis:get('Titan:'..bot_id..'acctear'..msg.sender_user_id_)
local nnn = redis:get('Titan:'..bot_id..'name_acount'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,"🎟 ※ ايدي حسابك ✓ (`"..n.."`)\n🗳 ※ اسم حسابك ✓ (`"..nnn.."`)\n💌 ※ تقيمك ✓("..nn..")", 1, 'md')
else 
send(msg.chat_id_, msg.id_, 1, '🕹※ لم يتم حفظ حسابك في البوت', 1, 'html')
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
