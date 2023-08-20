function ColorTheme()
  color = color or "codedark"

  vim.g.codedark_transparent = 1
  vim.cmd.colorscheme(color)

  local highlights = {
    'hi link @text.diff.add DiffAdd',
    'hi link @text.diff.delete DiffDelete',
    'highlight DiffText ctermfg=15 ctermbg=64',
    -- Add any other commands you need here
  }

  for _, highlight in ipairs(highlights) do
      vim.cmd(highlight)
  end
end

ColorTheme()
