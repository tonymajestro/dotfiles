return {
  {
    "nvim-orgmode/orgmode",
    tag = "0.3.4",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/notes/orgroam/orgfiles/**/*",
      org_default_notes_file = "~/notes/orgroam/orgfiles/refile.org",
    },
  },
  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.0",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.4",
      },
    },
    opts = {
      directory = "~/notes/orgroam/orgroam_files",
    },
  },
}
