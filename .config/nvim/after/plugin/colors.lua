function ColorTheme()
  color = color or "codedark"

  vim.g.codedark_transparent = 1
  vim.cmd.colorscheme(color)
end

ColorTheme()
