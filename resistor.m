## resistor.m
## Resistors and resistance functions.
##
## Author: Nathan Campos <nathanpc@dreamintech.net>

## -*- texinfo -*-
## @deftypefn {Function File} {rr} r_series (@var{rv})
## Calculates the series resistance formed by the values in @var{rv} list.
## @end deftypefn
function [rr] = r_series(rv)
	rr = 0;

	for r = rv
		rr += r;
	end
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} {rr} r_parallel (@var{rv})
## Calculates the parallel resistance formed by the values in @var{rv} list.
## @end deftypefn
function [rr] = r_parallel(rv)
	rr = 0;

	for r = rv
		rr += 1 / r;
	end

	rr = rr ^ -1
endfunction


##
## Testing.
##
r_series([1, 2, 3, 4])
r_parallel([10, 10])

