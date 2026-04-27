{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "biome"
      "color-highlight"
      "emmet"
      "material-icon-theme"
      "nix"
      "prisma"
      "react-typescript-snippets"
      "toml"
    ];

    userSettings = {
      tab_size = 2;
      disable_ai = false;
      show_wrap_guides = true;
      hide_mouse = "on_typing_and_movement";
      cursor_shape = "bar";

      agent_ui_font_size = 16.0;
      ui_font_weight = 400.0;

      buffer_line_height = "comfortable";
      buffer_font_weight = 400.0;
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 24;

      base_keymap = "VSCode";
      format_on_save = "on";

      show_whitespaces = "selection";

      load_direnv = "shell_hook";

      icon_theme = {
        mode = "dark";
        dark = "Material Icon Theme";
        light = "Material Icon Theme";
      };

      theme = {
        mode = "dark";
        dark = "Ling Dark";
        light = "Ling Dark";
      };

      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 16;

      vim_mode = false;

      git_panel = {
        dock = "right";
      };

      indent_guides = {
        enabled = true;
      };

      project_panel = {
        indent_guides.show = "never";
        indent_size = 12;
      };

      inlay_hints = {
        enabled = true;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
        show_background = false;
        show_other_hints = true;
        show_parameter_hints = true;
        show_type_hints = true;
        show_value_hints = true;

        toggle_on_modifiers_press = {
          alt = false;
          control = false;
          function = false;
          platform = false;
          shift = false;
        };
      };

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        button = false;
        copy_on_select = true;
        cursor_shape = "bar";

        detect_venv.on = {
          activate_script = "default";
          directories = [".env" "env" ".venv" "venv"];
        };

        dock = "bottom";

        env = {
          TERM = "ghostty";
        };

        font_family = "JetBrainsMono Nerd Font";
        font_features = null;
        font_size = 16;
        line_height = "comfortable";
        option_as_meta = false;
        shell = "system";

        toolbar = {
          breadcrumbs = false;
        };

        working_directory = "current_project_directory";
      };

      languages = {
        CSS = {
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        GraphQL = {
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        JSON = {
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        JSONC = {
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        JavaScript = {
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        TypeScript = {
          inlay_hints.enabled = false;
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        TSX = {
          inlay_hints.enabled = false;
          formatter.language_server.name = "biome";
          code_actions_on_format = {
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };

        Nix = {
          format_on_save = "on";
          language_servers = ["nixd" "!nil"];
          formatter.external = {
            command = "alejandra";
            arguments = ["--quiet" "--"];
          };
        };

        Prisma = {
          formatter = "language_server";
          language_servers = ["prisma-language-server"];
        };
      };

      lsp = {
        biome.settings.require_config_file = false;

        nixd = {
          initialization_options.formatting.command = [
            "alejandra"
            "--quiet"
            "--"
          ];
          settings.diagnostic.suppress = ["sema-extra-with"];
        };

        rust-analyzer.initialization_options.inlayHints = {
          maxLength = null;
          lifetimeElisionHints = {
            enable = "skip_trivial";
            useParameterNames = true;
          };
          closureReturnTypeHints.enable = "always";
        };

        qml.binary.arguments = ["-E" "additional-args"];
      };
    };
  };

  xdg.configFile = {
    "zed/themes" = {
      source = ./themes;
      recursive = true;
    };
  };
}
