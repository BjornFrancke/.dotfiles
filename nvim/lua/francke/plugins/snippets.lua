return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.4", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
}
