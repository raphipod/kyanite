# File: kyanite-apps.just
# Creator & Maintainer: Raphipod <raphipod@googlemail.com>

## Standardized verbs
# configure- = configure something that is pre-installed on the image
# install-   = install something, no uninstall or configuration provided
# setup-     = install something and also provide configuration and/or uninstallation options
# toggle-    = turn something on/off, logic can be automatic or manual selection
# fix-       = apply fix/patch/workaround for something

[group('Apps')]
install-gaming-flatpaks:
    #!/usr/bin/env bash
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak --system -y install --or-update app/com.valvesoftware.Steam/x86_64/stable \
                                            app/com.heroicgameslauncher.hgl/x86_64/stable \
                                            app/net.lutris.Lutris/x86_64/stable \
                                            app/net.davidotek.pupgui2/x86_64/stable \
                                            app/com.dec05eba.gpu_screen_recorder/x86_64/stable \
                                            runtime/org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/24.08 \
                                            runtime/org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/23.08 \
                                            runtime/org.freedesktop.Platform.VulkanLayer.OBSVkCapture/x86_64/24.08 \
                                            runtime/com.obsproject.Studio.Plugin.OBSVkCapture/x86_64/stable \
                                            runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/24.08 \
                                            runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08

# List installed RPMs

[group('Apps')]
list-installed-rpms:
    #!/usr/bin/env bash
    deployment=$(rpm-ostree status --json | jq '.deployments[] | select(.booted == true) | .checksum' | sed 's/"//g')
    rpm-ostree db list $deployment