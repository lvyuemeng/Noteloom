# Unix Learning

## At Begin

I try to tackle it in minimal version, with a stable distribution `Fedora` in **hypervisor**. Previous, I only know the basic operation and basic model of unix-like OS, but I haven't learnt how to manage **everything** upon it. Thus I record it as a memorandum.

> I assume you only know how to install os(at least configure your volume and user group in GUI!) and the basic manipulation of filesystem like `cp`, `mv` or modification by vi or nano.

It would be pleasant to develope it as a learning resource, manys presumes you know everything or you know nothing, display few commands or a detailed maual. However, beginner can only questionate **nothing**, and follows the guidance step by step praying it's correct on my machine, fuzzying on those messy configuration.

If a beginner, with a common ability on search(Github), it will find that a list of distro support and a man-page support. Then everything leaves you to read. But man-page is only a dictionary and you should at least know syntax to search on it, rather learn from man-page(A worse **learning** resource!).

We skip the installation of unix-like OS, and only with minimal version.

---

## Desktop

You see a black screen with only a prompt input. It's called a `shell`, which is the interface between you and computer quite long ago. You can input the executable upon it, which is a binary that computer can execute immediately.

You don't want to be caged in this prompt so you want a `Desktop`, if you know [`ArchWiki`](https://wiki.archlinux.org/title/General_recommendations#Booting), it provides many resources to learn, but it's too **terse** for beginner. Now you see in `Graphical user interface`(GUI) section, it said that `Xorg` and `Wayland` as a older and a newer protocol, which means it establishes the connection between screen rendering and software code(I guess so as a beginner!). You also know they are many physical drivers, especially, `Intel`, `AMD`, `NVIDIA`.

Then you check the desktop environments part, you see a lot, but you also glimpse that it's a integrated level application, bundling manys, just like `Windows` do. If we start as a minimal, we would better forgive this. If you
saw those fancy video displaying its unix, it use tiling managers, which compose every windows seamlessly, and decorated with a bunch of config to make itself beauty too.

Suppose you are envy this, and want to try one, with uh...newer protocol, `wayland window manager`, or better, in [`ArchWiki`](https://wiki.archlinux.org/title/Wayland) so you search the net, and found tiling/dynamic section, still too much, how to choose one, your intuition should tell you choosing the one with fully documented and most star. But the latter condition can be lossen, and the former should be emphasized, assuming you are a beginer, skipping those you don't know and check what else you can read, then summarize it just like how you use `Windows` to install app:

- what distro does it support?
- how can I install it?
- how can I use it?

Then if you find that you know nothing about it, skip that until one day you are interested. You will eventually choose `sway` or `hyprland` I guess, but I choose `niri`, first they are all documented, you don't want to read solely man-page.

> Following, I will use `niri`, but it doesn't matter if you know how to fish rather are given the fish.

Now we open the wiki, just like man-page done. [Niri Wiki](https://github.com/YaLTeR/niri/wiki), jump to the Get-Started, you see a support(If you found that your os doesn't support the newest version, it means you need to build it, indicating a manual version management, which may not you want as a beginner, or, switch to another distro, I use fedora because it balance the extensity and installation simplicity.), suggesting a native package manager installation, you should try a few.

Then, **skip** all you don't know, into the configuration introduction, you can acquire basic syntax from it, the basic rule showing that, you can customize it in `~/.config/niri/config.kdl`, or environment variable, like `$NIRI_CONFIG`. If you jump to next section, you will learn nothing, because you have no basic knowledge.

To acquire the concept, do as follows:

- glance the core concept and omit the detail, especially those configurable variables.
- Copy and paste the essential thing into the AI, and suggest the core concept with basic operation needed.
- Is there any concrete relation between sections? If no, repeat above, else read the simplest only.
- Is there any caveat/prerequisite/QA? If you don't encounter that in experience, skip it.
- If you read whole and still find that you can configure nothing, that's correct, we should learn from others `dotfiles`.

With, roughly 20 minutes, you would check all configuration, if not, you would better skip the thing less important, or use AI!

There's only few should be extracted:

- Input: configure the process of input.
- Output: configure the process of output.
- Key: keybindings.
- Window: configure the behavoir of window.
- Workspace: configure the behavoir of workspace.
- Animations: animations.

The above are all general settings, which can be distill and apply to others.

If currently, you want to directly apply others settings given in docs if it, then, I suggests **No**, because you can't ensure what else gonna do or carry other fancy widgets you don't have therefore causing confliction.

Be patient and humble to learn, if you check the others `dotfiles` in github(searching like `dotfiles`, `<your selected compositor> config` etc.), you see that there aren't single compositor, rather using many addons, then to solve it by searching `wayland addons` or `<your selected compositor> addons`:

- [are we wayland yet](https://arewewaylandyet.com)
- [awesome wayland](https://github.com/rcalixte/awesome-wayland)

Ok, then a sad story is many repo only published on `Gentoo`, `Alpine`, `Arch`, `Nix` if you check. Especially, you don't have one. Thus we have to use the **famous** one, most star. It's ironic that you are the **minority** of minority : ).

We then follow above rules to check `dotfiles`, with the given dependencies, if it doesn't show, choose the one said, if it doesn't say, copy and paste to AI now(or ask it directly). We then conclude the necessary things:

- compositor: windows manager.
- lock/idle: lock screen, idle apps.
- launcher: launch apps.
- notifications: notify msg.
- wallpaper: as is.
- clipboard: as is.
- screenshot: as is.
- panels: option but common.
- brightness: option.