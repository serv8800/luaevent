local event = {}

function event.new(self)
	local ev = {}

	setmetatable(ev, self)

	self.__index = self

	self.__call = self.call

	return ev
end

function event.register(self, source, f)
	table.insert(self, {source, f})

	return #self
end

function event.unregister(self, idx)
	table.remove(self, idx)
end

function event.call(tb, ...)
	for _, t in ipairs(tb) do
		local source = t[1]
		local f = t[2]

		f(source, ...)
	end
end

return event
