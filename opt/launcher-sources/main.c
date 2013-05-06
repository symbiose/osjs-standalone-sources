#include <gtk/gtk.h>
#include <gdk/gdk.h>
#include <webkit/webkit.h>
#include <X11/Xlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef NOX11
Display *d;

void
initialize_x11()
{
  d = XOpenDisplay(NULL);
  if (d == NULL) {
    fprintf(stderr, "Cannot open display\n");
    exit(1);
  }
}
#endif

int
main (int argc, gchar *argv[])
{
#ifndef NOX11

  initialize_x11();

#endif

  char          *uri = "http://localhost:3000";

  // Initialize GTK+
  if ( !g_thread_supported() )
    g_thread_init (NULL);

  gtk_init_check (&argc, &argv);

  GdkDisplay *display = gdk_display_get_default();
  GdkScreen *screen = gdk_display_get_screen(display, 0);

  // Create WebKit view
  WebKitWebView *web_view;
  web_view = WEBKIT_WEB_VIEW (webkit_web_view_new ());

  WebKitWebSettings *settings = webkit_web_settings_new ();
  g_object_set (G_OBJECT(settings), "enable-scripts", TRUE, NULL);
  g_object_set (G_OBJECT(settings), "enable-webgl", TRUE, NULL);
  g_object_set (G_OBJECT(settings), "enable-fullscreen", TRUE, NULL);
  g_object_set (G_OBJECT(settings), "enable-webaudio", TRUE, NULL);
  g_object_set (G_OBJECT(settings), "enable-html5-database", TRUE, NULL);
  webkit_web_view_set_settings (WEBKIT_WEB_VIEW(web_view), settings);

  webkit_web_view_load_uri (web_view, uri);

  // Create Window
  GtkWidget     *window;
  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  g_signal_connect (window, "destroy", G_CALLBACK (gtk_main_quit), NULL);

  gtk_container_add (GTK_CONTAINER (window), GTK_WIDGET(web_view));

  // Fullscreen stuff
  gint swidth = gdk_screen_get_width(screen);
  gint sheight = gdk_screen_get_height(screen);

  gtk_window_set_default_size(window, swidth, sheight);
  gtk_window_move(window, 0, 0);
  gtk_window_resize(window, swidth, sheight);
  //gtk_window_resize(window, 800, 600);
  gtk_window_fullscreen (GTK_WINDOW(window));

  // Run
  gtk_widget_show_all(window);
  gtk_window_set_resizable(window, false);
  gtk_main();

#ifndef NOX11

  XCloseDisplay(d);

#endif

  return 0;
}
