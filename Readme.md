
# Linux Mint (Ubuntu) Node.js Hacker Setup

This guide is for a [Node.js](http://nodejs.org>) focused development environment for developers.

Advice, suggestions, pull requests, and comments can be filed on Github as [issues](https://github.com/niftylettuce/linux-mint-ubuntu-nodejs-hacker-setup/issues).


## Hardware

If you are on a budget (e.g. $400-500), then use the following setup for a fast environment:

* $300-500 [Lenovo Laptop](http://goo.gl/kcvL22) (e.g. $200-$300 [Lenovo B570](http://goo.gl/JXunkL) with **[i3-2330M](http://goo.gl/03qh2U)** (i3, not Celeron) processor ([please BIOS flash first](http://niftylettuce.com/posts/lenovo-b570-flash-bios-wwlan-whitelist/) in order to whitelist the Bluetooth/Wireless card below)
* $45-100 [mSATA SSD](http://goo.gl/gSUWdE) (replaces standard hard drive in the laptop) or [2.5" Solid State Drive](http://goo.gl/F0uY1H) ("SSD")
* Already included (free) to $8 [Atheros AR5B22](http://goo.gl/cquCnO) Bluetooth 4.0 and Wireless-N mini PCI-E card combo (replaces standard card in the Lenovo B570 laptop and is whitelisted via BIOS flash)
* $26 [Kinivo BTH220 Bluetooth Stereo Headphones](http://goo.gl/wN5jPz) or [RF-MAB2](http://goo.gl/1oABII) (if you can find a good deal)
* $13 [Patriot Memory Supersonic Boost XT USB 3.0 8GB Flash Drive](http://goo.gl/2eDi7P)
* $70 [Crucial 8GB Laptop Memory Kit (4GBx2)](http://goo.gl/WPB6uO)


## Software

The instructions below install a complete tech stack including, but not limited to:

* [Linux Mint 15 Cinnamon](http://www.linuxmint.com) for the OS (based on Ubuntu 13.04 Raring Ringtail)
* [Redshift](http://jonls.dk/redshift/) for screen color temperature adjustment
* Microsoft core-fonts (e.g. Arial) to support [Google Chrome](http://google.com/chrome) with standard fonts
* [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) monospaced font (set as default)
* [Clementine](http://www.clementine-player.org/) music player (listen to [Spotify](http://spotify.com) and radio streams from [DI.FM](http://di.fm) and [Sky.fm](http://sky.fm) easily)
* [vim](http://www.vim.org/), [zsh](http://www.zsh.org/), and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/) with several [plugins](https://github.com/niftylettuce/.vim) and modified Lambda theme (with ACPI [battery plugin](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/battery/battery.plugin.zsh))
* [sshuttle](https://github.com/apenwarr/sshuttle) for SSH tunneling (quick and simple VPN alternative) (also check out [Prove](https://getprove.com) for easy Two-Factor Authentication ("TFA") SSH tunneling with sshuttle)
* [JSHint](http://www.jshint.com/) NPM module for JavaScript code quality (also comes with a default ~/.jshintrc file)
* [TLP](https://github.com/linrunner/TLP) (and other tools) for laptop power management (improves battery life/power usage)
* [Git Extras](https://github.com/visionmedia/git-extras) for quick git commands ([watch screencast](https://vimeo.com/45506445)) (added by [oh-my-zsh git-extras plugin](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git-extras/git-extras.plugin.zsh))
* [Git aliases](http://tjholowaychuk.com/post/26904939933/git-extras-introduction-screencast) for quick git aliases (added by [oh-my-zsh git plugin](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh))
* [Node.JS](http://nodejs.org) for server, [MongoDB](http://www.mongodb.org/) for database, and [Redis](http://redis.io/) for sessions
* [cpulimit](https://github.com/opsengine/cpulimit) for limiting processes to only consume specific CPU percentages
* [Variety](http://peterlevi.com/variety/about-variety/) for automatic wallpaper changing
* [UFW](https://help.ubuntu.com/community/UFW) firewall enabled by default (blocks incoming, allows outgoing)
* [Google Public DNS](https://developers.google.com/speed/public-dns/docs/using) sets default DNS servers to Google's
* [Clam AntiVirus](https://help.ubuntu.com/community/ClamAV) for anti-virus protection and scanning (not scheduled by default)
* [Irssi](https://help.ubuntu.com/community/Irssi) for Internet Relay Chat ("IRC") (try joining #linux-mint, #node.js, and #javascript on Freenode) (here are `screen` [shortcuts](http://www.pixelbeat.org/lkdb/screen.html))
* [CUPS-PDF](http://www.cups-pdf.de/) printer that allows you to print directly to PDF.
* [lm-sensors](http://lm-sensors.org/) for Linux hardware monitoring (e.g. run `sensors` from command line to get temperature readings)

## Get Started

You could also run these instructions inside a [VirtualBox](https://www.virtualbox.org/wiki/Downloads) instance for evaluation.

1. Download and install [Linux Mint 15 Cinnamon 64-bit](http://www.linuxmint.com/release.php?id=20) (use the torrent and remove from seeding once finished downloading).

2. Log in, load a new terminal process (CTRL+SHIFT+T), and install the environment's setup:

    ```bash
    wget --no-check-certificate https://raw.github.com/niftylettuce/linux-mint-nodejs-hacker-setup/master/install.sh -O - | sh
    ```

3. Hit `ENTER` on prompts when needed (unfortunately add-apt-repository does not support `-y` flag and environment variable `FORCE_ADD_APT_REPOSITORY=force` doesn't work; you have to hit `ENTER` a few times).

4. Set up [Git](https://help.github.com/articles/set-up-git) and [Github](https://help.github.com/articles/generating-ssh-keys) configurations.

5. Change default shell to ZSH:

    ```bash
    chsh -s `which zsh`
    ```

6. Reboot.


### Notes

* Generate passwords easily with [DuckDuckGo's random password plugin](duckduckgo.com/?q=random+password+strong+30)
* [Optimize your Solid State Drive for running Linux](https://sites.google.com/site/easylinuxtipsproject/ssd).
* Change the latitude/longitude for `gtk-redshift` in Startup Applications to match yours.
* If running a laptop with Intel HD Graphics (e.g. Lenovo B570), then consider adding the following kernel modules to your Grub config:

    ```bash
    sudo apt-get install grub-efi-amd64
    sudo vim /etc/default/grub
    ```

    ```diff
    -GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
    +# Use semaphores for inter-ring sync: `i915.semaphores=1`
    +# Activate RC6 mode of Intel GPU: `i915.i915_enable=rc6=1`
    +# Activate PCIe Active State Power Management: `pcie_aspm=force`
    +# Use panel (LVDS/eDP) downclocking for power savings: `i915.lvds_downclock=1`
    +# Enable frame buffer compression for power savings `i915.i915_enable_fbc=1`
    +GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i915.semaphores=1 i915.i915_enable_rc6=1 pcie_aspm=force i915.lvds_downclock=1 i915.i915_enable_fbc=1"
    ```

    ```bash
    sudo update-grub
    ```

    > More info on i915 kernel module is available by using:

    ```bash
    modinfo i915
    ```

    > For example, if you have a Haswell processor, you might want to try adding `i915.preliminary_hw_support=1`.

    > If you mod everything correctly, you can get 4-5+ hours of battery life (lowering your screen brightness helps as well).

### License

[MIT License](http://niftylettuce.mit-license.org/)
