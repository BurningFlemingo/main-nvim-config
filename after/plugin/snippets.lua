local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

ls.setup({
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = true
})
