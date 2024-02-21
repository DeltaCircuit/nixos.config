{lib,config, ...}: 
with lib; let
  cfg = config.modules.wms.hyprland;
  rule = rules: attrs: attrs // {inherit rules;};
in {

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.windowRules = let
      firefoxVideo = {
        class = ["firefox"];
      };
      guildWars = {
        title = ["Guild Wars 2"];
      };
    in
      lib.concatLists [
        (map (rule ["idleinhibit fullscreen"]) [firefoxVideo])
        (map (rule ["fullscreen"]) [guildWars])
      ];
  };
}
