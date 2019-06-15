; GIMP - The GNU Image Manipulation Program
; Copyright (C) 1995 Spencer Kimball and Peter Mattis
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.
;
;
; drop-shadow-mnh.scm   version 1.00   2019/6/15
;
; CHANGE-LOG:
; 1.00 - initial release
;
; Copyright (C) 2019 Muhammad Nur Hidayat <admin@mnh48.moe>
;
;
; This script calls the drop-shadow function with 4 different parameters.
;

(define (script-fu-drop-shadow-mnh image
                               drawable
                               shadow-transl-x
                               shadow-transl-y
                               shadow-blur
                               shadow-color
                               shadow-opacity
                               allow-resize)

  (let* (
        (shadow-blur (max shadow-blur 0))
        (shadow-opacity (min shadow-opacity 100))
        (shadow-opacity (max shadow-opacity 0))
        (type (car (gimp-drawable-type-with-alpha drawable)))
        (image-width (car (gimp-image-width image)))
        (image-height (car (gimp-image-height image)))
        (from-selection 0)
        (active-selection 0)
        (shadow-layer 0)
        )

    (script-fu-drop-shadow image drawable
                                 shadow-transl-x
                                 shadow-transl-y
                                 shadow-blur
                                 shadow-color
                                 shadow-opacity
                                 allow-resize)

    (script-fu-drop-shadow image drawable
                                 (- 0 shadow-transl-x)
                                 shadow-transl-y
                                 shadow-blur
                                 shadow-color
                                 shadow-opacity
                                 allow-resize)

    (script-fu-drop-shadow image drawable
                                 shadow-transl-x
                                 (- 0 shadow-transl-y)
                                 shadow-blur
                                 shadow-color
                                 shadow-opacity
                                 allow-resize)

    (script-fu-drop-shadow image drawable
                                 (- 0 shadow-transl-x)
                                 (- 0 shadow-transl-y)
                                 shadow-blur
                                 shadow-color
                                 shadow-opacity
                                 allow-resize)
  )
)

(script-fu-register "script-fu-drop-shadow-mnh"
  _"_Drop Shadow (MNH)..."
  _"Add MNH-style (4-side) drop shadow to the selected region (or alpha)"
  "Muhammad Nur Hidayat <admin@mnh48.moe>"
  "Muhammad Nur Hidayat"
  "Edited 2019/06/15"
  "RGB* GRAY*"
  SF-IMAGE      "Image"           0
  SF-DRAWABLE   "Drawable"        0
  SF-ADJUSTMENT _"Offset X"       '(4 0 4096 1 10 0 1)
  SF-ADJUSTMENT _"Offset Y"       '(4 0 4096 1 10 0 1)
  SF-ADJUSTMENT _"Blur radius"    '(15 0 1024 1 10 0 1)
  SF-COLOR      _"Color"          "black"
  SF-ADJUSTMENT _"Opacity"        '(60 0 100 1 10 0 0)
  SF-TOGGLE     _"Allow resizing" FALSE
)

(script-fu-menu-register "script-fu-drop-shadow-mnh"
                         "<Image>/Filters/Light and Shadow/Shadow")
