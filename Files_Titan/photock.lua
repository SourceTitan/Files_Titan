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
  function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
    tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = from_background,
  reply_markup_ = reply_markup,
  input_message_content_ = {
  ID = "InputMessagePhoto",
  photo_ = getInputFile(photo),
  added_sticker_file_ids_ = {},
  width_ = 0,
  height_ = 0,
  caption_ = caption
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
local keko2 = database:get('Titan:'..bot_id.."keko:photo"..result.id_)
if not result.profile_photo_ then 
if keko2 then 
send(msg.chat_id_, msg.id_, 1, "حذف كل صوره الحلو 😂👌🏻", 1, 'html')
database:del('Titan:'..bot_id.."keko:photo"..result.id_) 
end
end
if result.profile_photo_ then 
if keko2 and keko2 ~= result.profile_photo_.big_.persistent_id_ then 
local keko_text = {
  "شكو غيرت صورتك  يا حلو ",
  "منور طالع حلو عل صوره جديده",
  "ها شو غيرت صورتك 🤔😹",
  "شكو غيرت صورتك شنو قطيت وحده جديده 😹😹🌚",
  "شو غيرت صورتك شنو تعاركت ويه الحب ؟😹🌞",
  "شكو غيرت الصوره شسالفه ؟؟ 🤔🌞",
}
keko3 = math.random(#keko_text)
send(msg.chat_id_, msg.id_, 1, keko_text[keko3], 1, 'html')
end  
database:set('Titan:'..bot_id.."keko:photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
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
