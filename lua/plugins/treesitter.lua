return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- The new branch uses this clean API to ensure parsers are installed
        require("nvim-treesitter").install({
            "c",
            "java",
            "cpp",
            "python",
            "lua",
            "markdown",
            "markdown_inline",
            "json"
        })
        vim.treesitter.language.register('json', { 'jsonc' })
    end
}
