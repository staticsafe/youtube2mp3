# youtube2mp3: A very simple system to download YouTube music videos and convert them to mp3/ogg files

This is a very simple and short Bash script to provide a GUI for downloading
YouTube music videos and convert them to MP3/OGG files. I developed this for my
personal use (and to help a few friend) and then thought it would be helpful to
others, too. So here it is.

The script currently depends on zenity, youtube-dl, ffmpeg, and vorbis-tools. I have
tested it on Ubuntu GNU/Linux machines.

The usage is simple, just make sure that the script is executable and then type:

    ./youtube2mp3.sh

on the command line (or create a shortcut to it for easier access).

Here's a [screenshot](http://www.flickr.com/photos/64416865@N00/5174479975/) :

![youtube2mp3 screenshot](http://farm5.static.flickr.com/4152/5174479975_bb5e2b5ba2.jpg "youtube2mp3 screen shot")

Known issues:
(zenity:12498): Gtk-WARNING **: GTK+ module /usr/lib/gtk-2.0/modules/libcanberra-gtk-module.so cannot be loaded.
GTK+ 2.x symbols detected. Using GTK+ 2.x and GTK+ 3 in the same process is not supported.
Gtk-Message: Failed to load module "canberra-gtk-module"

- The above issue is due to both GTK2 and GTK3 being installed at the same time. This will happen if you have GNOME3 installed.
  Program still works, but obviously will not match the GTK theme you are using.
