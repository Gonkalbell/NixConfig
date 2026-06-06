# modules/features/neovim.nix
{inputs, ...}: {
  flake.homeModules.neovim = {...}: {
    imports = [inputs.nvf.homeManagerModules.default];

    programs.nvf.enable = true;
    programs.nvf.settings.vim = {
      viAlias = true;
      vimAlias = true;

      opts.expandtab = true;

      spellcheck.enable = true;

      lsp = {
        enable = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
      };

      debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        markdown.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        blink-indent.enable = true;
        indent-blankline.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      filetree.neo-tree.enable = true;
      tabline.nvimBufferline.enable = true;
      treesitter.context.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      telescope.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
      };

      notify.nvim-notify.enable = true;

      utility = {
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
        oil-nvim.enable = true;
      };

      notes.todo-comments.enable = true;

      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            nix = "110";
            ruby = "120";
            java = "130";
            go = [
              "90"
              "130"
            ];
          };
        };
        fastaction.enable = true;
      };

      comments.comment-nvim.enable = true;
    };
  };
}
