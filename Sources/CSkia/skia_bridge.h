#ifndef SKIA_BRIDGE_H
#define SKIA_BRIDGE_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct SkiaSurface SkiaSurface;
typedef struct SkiaCanvas SkiaCanvas;
typedef struct SkiaPaint SkiaPaint;

SkiaSurface* skia_surface_create(int width, int height);
void skia_surface_destroy(SkiaSurface* surface);
SkiaCanvas* skia_surface_get_canvas(SkiaSurface* surface);
const void* skia_surface_get_pixels(SkiaSurface* surface);

void skia_canvas_clear(SkiaCanvas* canvas, unsigned int color);
void skia_canvas_draw_circle(SkiaCanvas* canvas, float cx, float cy, float radius, SkiaPaint* paint);

SkiaPaint* skia_paint_create(void);
void skia_paint_destroy(SkiaPaint* paint);
void skia_paint_set_color(SkiaPaint* paint, unsigned int color);

#ifdef __cplusplus
}
#endif

#endif
