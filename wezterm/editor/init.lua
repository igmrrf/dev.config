local module = {}
local keys = require("editor.keys")

function module.apply_to_config(config)
	config.font_size = 13
	config.keys = keys
end
return module
