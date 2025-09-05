-- testing here


b1 = 0
b2 = 0

function _init()
   
    b1 = new_box_collider(63,63,8,8)    
    b2 = new_box_collider(83,83,8,8)    

end

function _update()

    delta = {x = 0, y = 0}

    if btn(0) then
        delta.x = -1
    end

    if btn(1) then
        delta.x = 1
    end

    if btn(⬇️) then
        delta.y = 1
    end

    if btn(⬆️) then
        delta.y  = -1
    end

    dbox = new_box_collider(b1.x + delta.x, b1.y + delta.y, b1.w, b1.h)

    if check_box_collide(dbox, b2) == false then
        b1.x += delta.x
        b1.y += delta.y        
    end

end


function _draw()

    cls()

    rect(b1.x, b1.y, b1.x+b1.w, b1.y+b1.h, 8)
    rect(b2.x, b2.y, b2.x+b2.w, b2.y+b2.h, 9)

     


end


