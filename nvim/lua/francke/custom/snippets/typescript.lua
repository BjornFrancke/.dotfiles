local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Add snippets for typescript filetype
ls.add_snippets("typescript", {
    s("cl", {
        t("console.log("), i(0), t(");")
    }),
    s("fn", {
        t("function "), i(1, "name"), t("("), i(2, "args"), t(") {"),
        t({"", "  "}), i(0),
        t({"", "}"})
    }),
    s("af", {
        t("const "), i(1, "name"), t(" = ("), i(2, "args"), t(") => {"),
        t({"", "  "}), i(0),
        t({"", "};"})
    }),
    s("const", {
        t("const "), i(1, "name"), t(" = "), i(0), t(";")
    }),
    s("let", {
        t("let "), i(1, "name"), t(" = "), i(0), t(";")
    })
})

-- Add snippets for javascript filetype as well
ls.add_snippets("javascript", {
    s("cl", {
        t("console.log("), i(0), t(");")
    }),
    s("fn", {
        t("function "), i(1, "name"), t("("), i(2, "args"), t(") {"),
        t({"", "  "}), i(0),
        t({"", "}"})
    }),
    s("af", {
        t("const "), i(1, "name"), t(" = ("), i(2, "args"), t(") => {"),
        t({"", "  "}), i(0),
        t({"", "};"})
    }),
    s("const", {
        t("const "), i(1, "name"), t(" = "), i(0), t(";")
    }),
    s("let", {
        t("let "), i(1, "name"), t(" = "), i(0), t(";")
    })
})
