function [value] = compute_velocity(t)
    value = 2000*log(150000/(150000-2700*t))-9.81*t - 750;
    return
end