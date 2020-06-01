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
local msg = data.message_
text = msg.content_.text_
if text then 
function keko(extra,result,success)
if result.id_ then 
local keko2 = database:get('Titan:'..bot_id.."keko:name"..result.id_)
if not result.first_name_ then 
if keko2 then 
send(msg.chat_id_, msg.id_, 1, "يولد هذا غير اسمه لك ها كلب "..keko2, 1, 'html')
database:del('Titan:'..bot_id.."keko:name"..result.id_) 
end
end
if result.first_name_ then 
if keko2 and keko2 ~= result.first_name_ then 
local keko_text = {
"اسمك الجديد { "..result.first_name_.." }\n القديم ليش غيرته 🌚😹",
  "اسمك الجديد { "..result.first_name_.." }\n مو حلو رجعه القديم ☹️👌",
  "ليش غيرت اسمك { "..result.first_name_.." }\n قطيت احد حبي ؟ 🌚😹",
  "اسمك الجديد يخبل ضلعي 🤭😹{ "..result.first_name_.." }", 
}
keko3 = math.random(#keko_text)
send(msg.chat_id_, msg.id_, 1, keko_text[keko3], 1, 'html')
end  
database:set('Titan:'..bot_id.."keko:name"..result.id_, result.first_name_) 
end
end
end
getUser(msg.sender_user_id_, keko)
end
end
return {
	keko_Titan = keko_Titan,
}
--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]
