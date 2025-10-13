local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Add snippets for lua filetype
ls.add_snippets("lua", {
    s("fn", {
        t("function "), i(1, "name"), t("("), i(2, "args"), t(")"),
        t({"", "  "}), i(0),
        t({"", "end"})
    }),
    s("local", {
        t("local "), i(1, "var"), t(" = "), i(0)
    }),
    s("req", {
        t("local "), i(1, "module"), t(" = require('"), i(2, "module"), t("')")
    }),
    ls.parser.parse_snippet('expand', '--- this is expanded')
})

-- Add snippets for all filetypes
ls.add_snippets("all", {
    s("todo", {
        t("-- TODO: "), i(0)
    }),
    s("fixme", {
        t("-- FIXME: "), i(0)
    }),
    ls.parser.parse_snippet('expand', '--- this is expanded')
})
