-- fps = 1/fps

animation_set = {
    c_frame = 1,
    next_time = 0,
    current_animation = "",
    one_shot = false,
    animations = {
        animation = {
            fps = 0.08,
            frames = {1,2,3,4}
        },
        idle = {
            fps = 0.25,
            frames = {1,4}
        },
        attack = {
            fps = 0.25,
            frames = {5,6,7}
        }
    }
}


function play_animation(name, one_shot, ani_set)

    if name == ani_set.current_animation then
        return
    end

    if ani_set.one_shot then
        return
    end

    ani_set.c_frame = 1
    ani_set.current_animation = name 
    ani = ani_set.animations[name]
    ani_set.one_shot = one_shot
    next_time = time() + ani.fps
end


function process_animation(ani_set)
    if time() > ani_set.next_time then
        ani_set.c_frame += 1
        ani_set.next_time = time() + ani_set.animations[ani_set.current_animation].fps

        if ani_set.c_frame > #ani_set.animations[ani_set.current_animation].frames then
            ani_set.c_frame = 1
            ani_set.one_shot = false
        end
    end
end

x = 0

function _init()
    play_animation("idle", false, animation_set)
end

function _update()

    process_animation(animation_set)
    if btn(➡️) then
        play_animation("animation", false, animation_set)
        x += 1
    elseif btn(❎) then
        play_animation("attack", true, animation_set)
    else
        play_animation("idle", false, animation_set)
    end


end

function _draw()

    cls()
    print(animation_set.current_animation)
    print(animation_set.c_frame)
    print(#animation_set.animations[animation_set.current_animation].frames)

    spr(animation_set.animations[animation_set.current_animation].frames[animation_set.c_frame], x, 63)


end

