Fix fixed-width views in Fractal and Tuba
=========================================
Both Fractal_ and Tuba_ suffer from the same modern design issue --
they force their text views to a fixed width that's only really suitable
for one specific font size.  If you use a larger font, the view does not
scale and instead it becomes too narrow.

This repository provides two trivial patches, for Fractal and Tuba
respectively, that adjust the view size to the specified width.
The default is 1000 px.

To prepare the patches::

    make WIDTH=1000

You can install them straight to ``/etc/portage/patches`` too::

    make install


.. _Fractal: https://gitlab.gnome.org/GNOME/fractal/
.. _Tuba: https://tuba.geopjr.dev/
