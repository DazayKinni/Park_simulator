/// @param kawase
/// @param suface

function kawase_copy_surface(_kawase, _surface)
{
    var _oldFilter = gpu_get_tex_filter();
    gpu_set_tex_filter(true);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    
    surface_set_target(kawase_get_surface(_kawase));
    draw_surface_stretched(_surface, 0, 0, kawase_get_width(_kawase), kawase_get_height(_kawase));
    surface_reset_target();
    
    gpu_set_tex_filter(_oldFilter);
    gpu_set_blendmode(bm_normal);
}