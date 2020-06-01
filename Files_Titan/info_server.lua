--[[
BY : TitanTEAM
Channel Files : https://t.me/TitanFiles
]]
local function keko_Titan(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
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
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then 
if (msg.content_.text_ == 'stats server' or msg.content_.text_ == 'معلومات السيرفر') then 
  local text2 = 'Info Server : \n'
  local TitanTEAM = database:info()
  text2 = text2..'1 - *Uptime Days* : `'..TitanTEAM.server.uptime_in_days..'('..TitanTEAM.server.uptime_in_seconds..' seconds)`\n'
  text2 = text2..'2 - *Commands Processed* : `'..TitanTEAM.stats.total_commands_processed..'`\n'
  text2 = text2..'3 - *Expired Keys* : `'..TitanTEAM.stats.expired_keys..'`\n'
  text2 = text2..'4 - *Ops/sec* : `'..TitanTEAM.stats.instantaneous_ops_per_sec..'`\n'
  send(msg.chat_id_, msg.id_, 1, text2, 1, 'md')
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