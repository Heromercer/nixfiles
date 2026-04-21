{
  mercer.fastfetch = {
    homeManager = {
      programs.fastfetch = {
        enable = true;
        settings = {
          logo = {
            type = "builtin";
            height = 15;
            width = 15;
            padding = {
              top = 3;
              left = 3;
            };
          };
          display = {
            separator = " ";
            color = {
              keys = "blue";
              title = "blue";
            };
          };
          modules = [
            "break"
            "break"
            "break"
            {
              type = "custom";
              key = "  ╭───────────╮";
            }
            {
              type = "title";
              key = "  │{#red} 󰀄 user    {#keys}│";
              format = "{user-name}";
            }
            {
              type = "title";
              key = "  │{#yellow}   host   {#keys}│";
              format = "{host-name}";
            }
            {
              type = "os";
              key = "  │{#green}   distro {#keys}│";
            }
            {
              type = "uptime";
              key = "  │{#38;2;174;141;254}   uptime {#keys}│";
            }
            {
              type = "disk";
              key = "  │{#38;2;95;97;175} 󰃫  age    {#keys}│";
              folders = "/";
              format = "{days} days";
            }
            {
              type = "shell";
              key = "  │{#magenta}   shell  {#keys}│";
            }
            {
              type = "packages";
              key = "  │{#38;2;255;152;0} 󰏖  pkgs   {#keys}│";
            }
            {
              type = "memory";
              key = "  │{#38;2;244;67;54}   memory {#keys}│";
            }
            {
              type = "custom";
              key = "  ├───────────┤";
            }
            {
              type = "colors";
              key = "  │   colors │";
              paddingLeft = 0;
              symbol = "circle";
            }
            {
              type = "custom";
              key = "  ╰───────────╯";
            }
          ];
        };
      };
    };
  };
}
