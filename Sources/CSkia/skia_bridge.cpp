#include "skia_bridge.h"
#include "include/core/SkSurface.h"
#include "include/core/SkCanvas.h"
#include "include/core/SkPaint.h"

extern "C" {

SkiaSurface* skia_surface_create(int width, int height) {
    SkImageInfo info = SkImageInfo::MakeN32Premul(width, height);
    return (SkiaSurface*)SkSurfaces::Raster(info).release();
}

void skia_surface_destroy(SkiaSurface* surface) {
    delete (SkSurface*)surface;
}

SkiaCanvas* skia_surface_get_canvas(SkiaSurface* surface) {
    return (SkiaCanvas*)((SkSurface*)surface)->getCanvas();
}

const void* skia_surface_get_pixels(SkiaSurface* surface) {
    SkPixmap pixmap;
    if (((SkSurface*)surface)->peekPixels(&pixmap)) {
        return pixmap.addr();
    }
    return nullptr;
}

void skia_canvas_clear(SkiaCanvas* canvas, unsigned int color) {
    ((SkCanvas*)canvas)->clear(color);
}

void skia_canvas_draw_circle(SkiaCanvas* canvas, float cx, float cy, float radius, SkiaPaint* paint) {
    ((SkCanvas*)canvas)->drawCircle(cx, cy, radius, *(SkPaint*)paint);
}

SkiaPaint* skia_paint_create(void) {
    return (SkiaPaint*)new SkPaint();
}

void skia_paint_destroy(SkiaPaint* paint) {
    delete (SkPaint*)paint;
}

void skia_paint_set_color(SkiaPaint* paint, unsigned int color) {
    ((SkPaint*)paint)->setColor(color);
}

}
