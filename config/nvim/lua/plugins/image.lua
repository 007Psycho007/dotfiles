return {
    "3rd/image.nvim",
    dependencies = { "vhyrro/luarocks.nvim" },
    config = function()
        require("image").setup({
          backend = "kitty",
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = true,
              filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
              resolve_image_path = function(document_path, image_path, fallback)
                -- document_path is the path to the file that contains the image
                -- image_path is the potentially relative path to the image. for
                -- markdown it's `![](this text)`

                -- you can call the fallback function to get the default behavior
                return fallback("~/Documents/wiki/assets/", image_path)
              end,
            },
          }
        })
    end
}
