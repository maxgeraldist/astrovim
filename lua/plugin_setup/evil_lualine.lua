-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine");

-- Cache lsp once per attach/detach, instead of checking every redraw
local lsp_name_cache = {};

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id);
        if client then
            lsp_name_cache[args.buf] = client.name;
        end;
    end,
});

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
        lsp_name_cache[args.buf] = nil;
    end,
});

local function lsp_name()
    local buf = vim.api.nvim_get_current_buf();
    return lsp_name_cache[buf] or "No Active LSP";
end;

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
};

local mode_color = {
    n = colors.red,
    i = colors.green,
    v = colors.blue,
    [""] = colors.blue,
    V = colors.blue,
    c = colors.magenta,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [""] = colors.orange,
    ic = colors.yellow,
    R = colors.violet,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
    t = colors.red,
};

local function mode_color_fn()
    local m = vim.api.nvim_get_mode().mode;
    return { fg = mode_color[m] or colors.red };
end;
local conditions = {
    buffer_not_empty = function()
        local name = vim.api.nvim_buf_get_name(0);
        return name ~= "";
    end,
    hide_in_width = function()
        return vim.api.nvim_win_get_width(0) > 80;
    end,
};

-- Config
local config = {
    options = {
        component_separators = "",
        section_separators = "",
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks of statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
};

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component);
end;

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component);
end;

ins_left({
    function()
        return "▊";
    end,
    color = { fg = colors.blue },      -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
});

ins_left({
    -- mode component
    function()
        return "";
    end,
    color = mode_color_fn,
    padding = { right = 1 },
});

ins_left({
    -- filesize component
    "filesize",
    cond = conditions.buffer_not_empty,
});

ins_left({ "location" });

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } });

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
    on_click = function()
        vim.cmd("OpenDiagnostics");
    end,
});

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
    function()
        return "%=";
    end,
});

ins_left({
    -- Lsp server name .
    function()
        return lsp_name();
    end,
    icon = " LSP:",
    color = { fg = "#ffffff", gui = "bold" },
});

-- Add components to right sections
ins_right({
    "o:encoding",       -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = "bold" },
});

ins_right({
    "fileformat",
    fmt = string.upper,
    icons_enabled = true,
    color = { fg = colors.green, gui = "bold" },
});

ins_right({
    "branch",
    icon = "",
    color = { fg = colors.violet, gui = "bold" },
});

ins_right({
    "diff",
    -- Is it me or the symbol for modified is really weird
    symbols = { added = " ", modified = "󰝤 ", removed = " " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
});

ins_right({
    function()
        return "▊";
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
});

lualine.setup(config);
