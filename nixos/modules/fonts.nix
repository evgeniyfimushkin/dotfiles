{ config, lib, pkgs, ... }:
{
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "cyr-sun16";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerdfix
      font-awesome
      font-awesome_6 # fix waybar battery icon
      roboto  # Для UI элементов
      roboto-mono  # Альтернативный моноширинный
      fira-code  # Красивый шрифт с лигатурами
      fira-code-symbols  # Символы для Fira Code
      inter  # Современный sans-serif
      noto-fonts  # Для поддержки всех языков
      noto-fonts-color-emoji
      source-han-sans  # Азиатские символы
    ];
    
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrains Mono" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Roboto" "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };
}
