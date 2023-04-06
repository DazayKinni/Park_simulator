/// @param kawase
/// @param width
/// @param height

function kawase_draw_dof(_kawase, _w, _h)
{
    var _y0 = 0.100;
    var _y1 = 0.300;
    var _y2 = 0.700;
    var _y3 = 0.900;
    
    draw_primitive_begin_texture(pr_trianglelist, surface_get_texture(kawase_get_surface(_kawase)));
    
    //Upper block
    draw_vertex_texture_colour( 0,      0,    0,   0,    c_white, 1.0);
    draw_vertex_texture_colour(_w,      0,    1,   0,    c_white, 1.0);
    draw_vertex_texture_colour(_w, _y0*_h,    1, _y0,    c_white, 1.0);
    
    draw_vertex_texture_colour( 0,      0,    0,   0,    c_white, 1.0);
    draw_vertex_texture_colour(_w, _y0*_h,    1, _y0,    c_white, 1.0);
    draw_vertex_texture_colour( 0, _y0*_h,    0, _y0,    c_white, 1.0);
    
    //Upper fringe
    draw_vertex_texture_colour( 0, _y0*_h,    0, _y0,    c_white, 1.0);
    draw_vertex_texture_colour(_w, _y0*_h,    1, _y0,    c_white, 1.0);
    draw_vertex_texture_colour(_w, _y1*_h,    1, _y1,    c_white, 0.0);
    
    draw_vertex_texture_colour( 0, _y0*_h,    0, _y0,    c_white, 1.0);
    draw_vertex_texture_colour(_w, _y1*_h,    1, _y1,    c_white, 0.0);
    draw_vertex_texture_colour( 0, _y1*_h,    0, _y1,    c_white, 0.0);
    
    //Lower fringe
    draw_vertex_texture_colour( 0, _y2*_h,    0, _y2,    c_white, 0.0);
    draw_vertex_texture_colour(_w, _y2*_h,    1, _y2,    c_white, 0.0);
    draw_vertex_texture_colour(_w, _y3*_h,    1, _y3,    c_white, 1.0);
    
    draw_vertex_texture_colour( 0, _y2*_h,    0, _y2,    c_white, 0.0);
    draw_vertex_texture_colour(_w, _y3*_h,    1, _y3,    c_white, 1.0);
    draw_vertex_texture_colour( 0, _y3*_h,    0, _y3,    c_white, 1.0);
    
    //Lower block
    draw_vertex_texture_colour( 0, _y3*_h,    0, _y3,    c_white, 1.0);
    draw_vertex_texture_colour(_w, _y3*_h,    1, _y3,    c_white, 1.0);
    draw_vertex_texture_colour(_w,     _h,    1,   1,    c_white, 1.0);
    
    draw_vertex_texture_colour( 0, _y3*_h,    0, _y3,    c_white, 1.0);
    draw_vertex_texture_colour(_w,     _h,    1,   1,    c_white, 1.0);
    draw_vertex_texture_colour( 0,     _h,    0,   1,    c_white, 1.0);
    
    draw_primitive_end();
}