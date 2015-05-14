local event = require "event"

local ev = event:new()

local callbacks = {}

function callbacks.on_event(_, ...)
	print("on event", ...)
end

ev:register(callbacks, callbacks.on_event)

local param = "test param"
ev(param)
