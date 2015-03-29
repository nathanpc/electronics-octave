## inductor.m
## Inductors and inductance functions.
##
## Author: Nathan Campos <nathanpc@dreamintech.net>

## -*- texinfo -*-
## @deftypefn {Function File} {lr} l_series (@var{lv})
## Calculates the series inductance formed by the values in @var{lv} list.
## @end deftypefn
function [lr] = l_series(lv)
	lr = 0;

	for l = lv
		lr += l;
	end
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} {lr} l_parallel (@var{lv})
## Calculates the parallel inductance formed by the values in @var{lv} list.
## @end deftypefn
function [lr] = l_parallel(lv)
	lr = 0;

	for l = lv
		lr += 1 / l;
	end

	lr = lr ^ -1
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} {lx} l_impedance (@var{ul}, @var{f})
## Calculates the impedance of @var{ul} inductor (uH) at @var{f} frequency.
## @end deftypefn
function [lx] = l_impedance(ul, f)
	l = ul * (10 ^ -6);  # Convert from uH to H.
	lx = 2 * pi * f * l;
endfunction


##
## Testing.
##
l_parallel([1, 2, 3, 4])
l_series([10, 10])
l_impedance(100, 1000)

