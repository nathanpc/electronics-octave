## capacitor.m
## Capacitors and capacitance functions.
##
## Author: Nathan Campos <nathanpc@dreamintech.net>

## -*- texinfo -*-
## @deftypefn {Function File} {cr} c_series (@var{cv})
## Calculates the series capacitance formed by the values in @var{cv} list.
## @end deftypefn
function [cr] = c_series(cv)
	cr = 0;

	for c = cv
		cr += 1 / c;
	end

	cr = cr ^ -1;
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} {cr} c_parallel (@var{cv})
## Calculates the parallel capacitance formed by the values in @var{cv} list.
## @end deftypefn
function [cr] = c_parallel(cv)
	cr = 0;

	for c = cv
		cr += c;
	end
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} {cx} c_impedance (@var{uc}, @var{f})
## Calculates the impedance of @var{uc} capacitor (uF) at @var{f} frequency.
## @end deftypefn
function [cx] = c_impedance(uc, f)
	c = uc * (10 ^ -6);  # Convert from uF to F.
	cx = 1 / (2 * pi * f * c);
endfunction


##
## Testing.
##
c_parallel([1, 2, 3, 4])
c_series([10, 10])
c_impedance(0.1, 1000)

