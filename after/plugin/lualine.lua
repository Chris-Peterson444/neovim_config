require("lualine").setup {
    options = {
        theme = "auto",
        sections = {
            lualine_c = {
                {
                    'filename',
                    file_status = true,
                    path = 1,
                },

            },

        },
    },
}
-- require("lualine").setup {
--     sections = {
--         lualine_c = {
--             {
--                 'filename',
--                 file_status = true,
--                 path = 1,
--             },
--
--         },
--
--     },
-- }
