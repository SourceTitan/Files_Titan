local function SHAR(data)
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = disable_web_page_preview,clear_draft_ = 0,entities_ = {},parse_mode_ = {ID = "TextParseModeMarkdown"},},}, dl_cb, nil)
end
local msg = data.message_
local text = msg.content_.text_
if is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creatorr(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) or is_ownerr(msg.chat_id_,msg.sender_user_id_) and ChekAdd(msg.chat_id_) == true then
if text == 'تفعيل تنبيه الاشعار' then
send(msg.chat_id_, msg.id_, 1, '🔖┇ تم تفعيل التنبيه عل شعار  !', 1, 'md')
database:set('Titan:'..bot_id..'SH:BOT'..msg.chat_id_,true)
return false
end
if text == 'تعطيل تنبيه الاشعار' then
send(msg.chat_id_, msg.id_, 1, '📮┇ تم تعطيل التنبيه عل شعار  !', 1, 'md')
database:del('Titan:'..bot_id..'SH:BOT'..msg.chat_id_)
return false
end
if text and text:match("^وضع الشعار (.*)$") then
local SHGP = text:match("^وضع الشعار (.*)$")
database:set('Titan:'..bot_id..'SH:BOT:GP'..msg.chat_id_,SHGP)
send(msg.chat_id_, msg.id_, 1, '📮┇تم حفظ شعار المجموعه \n', 1, 'md')
end
end
if text and database:get('Titan:'..bot_id..'SH:BOT'..msg.chat_id_) and not is_devabas(msg) and not is_sudo(msg) then
if tonumber(database:get('Titan:'..bot_id..'SH:NUM'..msg.chat_id_..msg.sender_user_id_) or 0) > 3 then
chat_kick(msg.chat_id_, msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '📮┇ تم طردك من المجموعة لعدم احترام قوانين المجموعة', 1, 'md')
database:del('Titan:'..bot_id..'SH:NUM'..msg.chat_id_..msg.sender_user_id_)
else
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
local last_ = data.last_name_ or ''
local first_ = data.first_name_ or ''
local taha = (first_..''..last_)
local taha1 = (database:get('Titan:'..bot_id..'SH:BOT:GP'..msg.chat_id_) or '')
if string.find(taha,taha1) == nil then
local taha = tonumber((database:get('Titan:'..bot_id..'SH:NUM'..msg.chat_id_..msg.sender_user_id_) or 0))
if taha == 1 then
send(msg.chat_id_, msg.id_, 1, '\n♨┇ عليك وضع شعار المجموعه لديك {3} محاولات وعند انتهاء المحاولات سيتم طردك الشعار {`'..taha1..'`}',1, 'md')
elseif taha == 2 then
send(msg.chat_id_, msg.id_, 1, '\n♨┇ عليك وضع شعار المجموعه لديك {2} محاولات وعند انتهاء المحاولات سيتم طردك الشعار {`'..taha1..'`}',1, 'md')
elseif taha == 3 then
send(msg.chat_id_, msg.id_, 1, '\n♨┇ عليك وضع شعار المجموعه لديك اخر محاولات لوضع الشعار {`'..taha1..'`}',1, 'md')
end
database:incrby('Titan:'..bot_id..'SH:NUM'..msg.chat_id_..msg.sender_user_id_,1)
end
end,nil)  
return false
end
end
end
return {keko_Titan = SHAR,}
