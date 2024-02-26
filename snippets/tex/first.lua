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

local tex_utils = {}

tex_utils.in_mathzone = function() -- math context detection
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
	return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
	local is_inside = vim.fn['vimtex#env#is_inside'](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
	return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function() -- itemize environment detection
	return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
	return tex_utils.in_env('tikzpicture')
end

-- f(function(_, snip) return snip.captures[1] end)
-- used to capture the first (because of the 1) character in a snippet trigger
-- a snippet deletes the trigger and replaces, if a regex is in the trigger
-- itll delete the regexed thing, for example, a whitespace, so this is used

-- regex chart
-- . 	all characters
-- %d 	digits
-- %a 	letters (uppercase and lowercase)
-- %w 	alphanumeric characters
-- %s 	white space characters

return {
	-- mathzone snippets
	s(
		{ trig = "ff", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\frac{<>}{<>}]],
			{
				i(1), i(2) }
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "bf", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\mathbf{<>}]],
			{
				i(1) }
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "ss", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\,]],
			{}
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "sum", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\sum_{<>}^{<>}]],
			{
				i(1),
				i(2)
			}
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "dint", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\int_{<>}^{<>}]],
			{
				i(1),
				i(2)
			}
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "ee", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\qty(<>)]],
			{
				i(1)
			}
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "ii", snippetType = "autosnippet"},
		{
			t("\\qty["),
			i(1),
			t("]")
		},
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "ee", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[\qty{<>}]],
			{
				i(1)
			}
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "li", snippetType = "autosnippet"},
		fmta(
			[[\lim_{<>\to<>}]],
			{
				i(1),
				i(2),
			}
		),
		{ condition = tex_utils.in_mathzone }
	),

	s(
		{ trig = "([%a%)%]%}])%.", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[<>_{<>}]],
			{
				f(function(_, snip) return snip.captures[1] end),
				i(1)
			}
		),
		{ condition = tex_utils.in_mathzone }
	),

	-- text snippets
	-- math (times two) but small :pensive:
	s(
		{ trig = "([^%w])mm", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[<>\(<>\)]],
			{
				f(function(_, snip) return snip.captures[1] end),
				i(1) }
		)
	),
	-- math (times two) BUT LOUD
	s(
		{ trig = "([^%w])MM", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[<>\[<>\] ]],
			{
				f(function(_, snip) return snip.captures[1] end),
				i(1) }
		)
	),
	-- new equation
	s(
		{ trig = "([^%w])NE", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[<>\begin{equation}<>\end{equation}]],
			{
				f(function(_, snip) return snip.captures[1] end),
				i(1)
			}
		)
	),

	-- environment (times two)
	s(
		{ trig = "\\beg", regTrig = true, snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
			\begin{<>}
			<>
			\end{<>}
			]],
			{
				i(1),
				i(2),
				rep(1)
			}
		)
	),
	s(
		{ trig = ";a", snippetType = "autosnippet" },
		{ t("\\alpha") }
	),
	s(
		{ trig = ";b", snippetType = "autosnippet" },
		{ t("\\beta") }
	),
	s(
		{ trig = ";t", snippetType = "autosnippet" },
		{ t("\\theta") }
	),
}
