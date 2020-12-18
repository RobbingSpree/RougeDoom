tick++;
image_alpha = 0.8+0.3*(dcos(tick*3 + x + y));

x = xstart + dsin(tick - x*2 - y*2)*5;
y = ystart + dsin(tick*0.85 + x*1.5 - y)*5;