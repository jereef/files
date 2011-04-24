using Gtk;
using GLib;

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "config.h")]
namespace Config {
    //public const string GETTEXT_PACKAGE;
    public const string PIXMAP_DIR;
    public const string UI_DIR;
    public const string VERSION;
    /*public const string PACKAGE_NAME;
      public const string PACKAGE_VERSION;
      public const string VERSION;*/
}

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "marlin-global-preferences.h")]
namespace Preferences {
    public GLib.Settings settings;
    public GLib.Settings marlin_icon_view_settings;
    public string tags_colors[10];
}

public static uint action_new (GLib.Type type, string signal_name);
public void marlin_toolbar_editor_dialog_show (Marlin.View.Window mvw);

[CCode (cprefix = "EelGtk", lower_case_cprefix = "eel_gtk_window_", cheader_filename = "eel-gtk-extensions.h")]
namespace EelGtk.Window {
    public string get_geometry_string (Gtk.Window win);
    public void set_initial_geometry_from_string (Gtk.Window win, string geometry, uint w, uint h, bool ignore_position);
}

[CCode (cprefix = "Nautilus", lower_case_cprefix = "nautilus_")]
namespace Nautilus {
    [CCode (cheader_filename = "nautilus-icon-info.h")]
    public class IconInfo : GLib.Object{
        public static IconInfo lookup(GLib.Icon icon, int size);
        public Gdk.Pixbuf get_pixbuf_nodefault();
        public Gdk.Pixbuf get_pixbuf_at_size(int size);
    }
}

[CCode (cprefix = "GOF", lower_case_cprefix = "gof_")]
namespace GOF {
    [CCode (cprefix = "GOFWindow", lower_case_cprefix = "gof_window_")]
    namespace Window {
        [CCode (cheader_filename = "gof-window-slot.h")]
        public class Slot : GLib.Object {
            public Slot (GLib.File f, Marlin.View.ViewContainer ctab);
            public void make_icon_view ();
            public void make_list_view ();
            public Directory.Async directory;
            public GLib.File location;
            public Widget view_box;
            public signal void active ();
            public signal void inactive ();
        }
    }

    [CCode (cheader_filename = "gof-file.h")]
    public class File : GLib.Object {
        public File(GLib.File location, GLib.File dir);
        public GLib.File location;
        public GLib.Icon? icon;
        public GLib.FileInfo? info;
        public string name;
        public string format_size;
        public string color;
        public string formated_modified;
        public string formated_type;

        public bool is_directory;
    }

    [CCode (cprefix = "GOFDirectory", lower_case_cprefix = "gof_directory_")]
    namespace Directory {
        [CCode (cheader_filename = "gof-directory-async.h")]
        public class Async : GLib.Object {
            public GLib.File location;
            public GOF.File file;
            public bool loading;
            public bool loaded;
            //public HashTable<GLib.File,GOF.File> file_hash;
            public HashTable file_hash;
            public HashTable hidden_file_hash;

            public Async (GLib.File f);
            public Async.from_file (GOF.File f);
            public Async.from_gfile (GLib.File f);
            public bool load ();
            public void cancel ();
            public string get_uri ();
            public bool has_parent ();
            public GLib.File get_parent ();
            
            public signal void file_loaded (GOF.File file);
            public signal void file_added (GOF.File file);
            public signal void file_changed (GOF.File file);
            public signal void file_deleted (GOF.File file);
            public signal void done_loading ();
            public signal void info_available ();
        }
    }
}

namespace FM {
    [CCode (cprefix = "FMDirectory", lower_case_cprefix = "fm_directory_")]
    namespace Directory {
        [CCode (cheader_filename = "fm-directory-view.h")]
        public class View : Gtk.ScrolledWindow {
            public signal void colorize_selection (int color);
            public signal void sync_selection ();
            public void merge_menus ();
            public void unmerge_menus ();
        }
    }
}

namespace Marlin {
    [CCode (cheader_filename = "marlin-application.h")]
    public class Application : Gtk.Application {
        public Application ();
        public void create_window (string uri, Gdk.Screen screen);
        public void create_window_from_gfile (GLib.File location, Gdk.Screen screen);
        public void quit ();
    }
    [CCode (cprefix = "MarlinWindow", lower_case_cprefix = "marlin_window_")]
    namespace Window {
        [CCode (cheader_filename = "marlin-window-columns.h")]
        public class Columns : GLib.Object {
            public Columns (GLib.File f, Marlin.View.ViewContainer ctab);
            public void make_view ();
            public GOF.Window.Slot active_slot;
            /*public Directory.Async directory;
            public Widget get_view ();*/
        }
    }
    [CCode (cprefix = "MarlinPlaces", lower_case_cprefix = "marlin_places_")]
    namespace Places {
        [CCode (cheader_filename = "marlin-places-sidebar.h")]
        public class Sidebar : Gtk.ScrolledWindow {
            public Sidebar (Gtk.Widget window);
        }
    }
}

