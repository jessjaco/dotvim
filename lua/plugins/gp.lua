return {
  {
    "robitx/gp.nvim",
    config = function()
      local conf = {
        chat_free_cursor = true,
        default_command_agent = "CodeGPT4o-mini",
        default_chat_agent = "ChatGPT4o",
        agents = {
          {
            name = "ChatGPT4o",
            chat = true,
            command = false,
            model = { model = "gpt-4o" },
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
          {
            provider = "openai",
            name = "CodeGPT4o-mini",
            chat = false,
            command = true,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o-mini", temperature = 0.7, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = "Please return ONLY code snippets.\nSTART AND END YOUR ANSWER WITH:\n\n```",
          }
        },
      }
      require("gp").setup(conf)
    end,
  }
}
