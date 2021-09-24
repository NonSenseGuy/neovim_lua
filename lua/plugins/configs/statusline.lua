local theme = require("theme")
local colors = theme.colors

local gl = require("galaxyline")
local gls = gl.section

local condition = require("galaxyline.condition")

local get_filename = function()
  local parentFolder = vim.fn.expand("%:h:t")
  local filename = vim.fn.expand("%:t")

  if parentFolder ~= "." then
    filename = parentFolder .. "/" .. filename
  end

  return filename
end

local file_readonly = function(readonly_icon)
  local icon = readonly_icon or ""
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ""
end

local current_file_name_provider = function()
  local file = get_filename()
  if vim.fn.empty(file) == 1 then
    return ""
  end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  local icon = ""
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. " " .. icon .. "  "
    end
  end
  return file .. " "
end

gl.short_line_list = { "NvimTree" }

gls.left[1] = {
  StartBorder = {
    provider = function()
      return "▊"
    end,
    highlight = { colors.cyan, colors.bgAlt }
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        i = 'INSERT',
        c = 'COMMAND',
        V = 'V-LINE',
        [''] = 'V-BLOCK',
        v = 'VISUAL',
        R = 'REPLACE',
      }

      local mode = alias[vim.fn.mode()]

      if mode == nil then
        return "  TERM "
      else
        return "  " .. mode .. " "
      end
    end,
    separator = "",
    separator_highlight = { colors.bgAlt, colors.bgAlt },
    highlight = { colors.fg, colors.bgAlt }
  }
}

gls.left[3] = {
  Separator = {
    provider = function()
      return " "
    end,
    highlight = { colors.bg, colors.bg }
  }
}

gls.left[4] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.buffer_not_empty,
    separator = " ",
    -- separator_highlight = { colors.bgAlt, colors.bgAlt },
    highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg }
  }
}

gls.left[5] = {
  FileName = {
    provider = current_file_name_provider,
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg }
  }
}

gls.left[6] = {
  Separator = {
    provider = function()
      return " "
    end,
    highlight = { colors.bg, colors.bg }
  }
}

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 30 then
    return true
  end
  return false
end

gls.right[1] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = " ",
    highlight = { colors.yellow, colors.bg }
  }
}

gls.right[2] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = { colors.red, colors.bg }
  }
}

gls.right[3] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = { colors.red, colors.bg }
  }
}


gls.right[4] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = { colors.yellow, colors.bg }
  }
}

gls.right[5] = {
  GitBranch = {
    provider = "GitBranch",
    separator = ' ',
    icon = "  ",
    condition = function ()
      local git_dir = condition.check_git_workspace()
      local buff_empty = condition.buffer_not_empty()
      if git_dir and buff_empty then
        return true
      else
        return false
      end
    end,
    highlight = { colors.fg, colors.bg }
  }
}

gls.right[6] = {
  LineColumn = {
    provider = "LineColumn",
    condition = condition.buffer_not_empty,
    separator = " ",
    separator_highlight = { colors.bg, colors.bg },
    highlight = { colors.fg, colors.bg }
  }
}

gls.right[7] = {
  EndBorder = {
    provider = function()
      return "▊"
    end,
    highlight = { colors.cyan, colors.bg }
  }
}
