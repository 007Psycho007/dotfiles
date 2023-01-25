local function get_modified(buf)
    if vim.bo[buf].modified then
        return ''
    else
        return ''
    end
end

require('incline').setup {
  debounce_threshold = {
    falling = 50,
    rising = 10
  },
  hide = {
    cursorline = false,
    focused_win = false,
    only_win = true
  },
  highlight = {
    groups = {
      InclineNormal = {
        default = true,
        group = "InclineFocused"
      },
      InclineNormalNC = {
        default = true,
        group = "InclineUnfocused"
      }
    }
  },
  ignore = {
    buftypes = "special",
    filetypes = {},
    floating_wins = true,
    unlisted_buffers = true,
    wintypes = "special"
  },
  window = {
    margin = {
      horizontal = 1,
      vertical = 0
    },
    options = {
      signcolumn = "no",
      wrap = true
    },
    padding = 1,
    padding_char = " ",
    placement = {
      horizontal = "right",
      vertical = "top"
    },
    width = "fit",
    winhighlight = {
      active = {
        EndOfBuffer = "None",
        Normal = "InclineNormal",
        Search = "None"
      },
      inactive = {
        EndOfBuffer = "None",
        Normal = "InclineNormalNC",
        Search = "None"
      }
    },
    zindex = 50
  },
render = function(props)

    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')


    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
    local mod = get_modified(props.buf)

    if filename == "" then
      buffer = { "No Name " }
    else

      buffer = {
          { filetype_icon }, { " │ " },
          { filename, }, {" │ "},
          { mod }
    }
    end
    return buffer
  end
}
