## filters.m
## Collection of filter calculation functions.
##
## Author: Nathan Campos <nathanpc@dreamintech.net>

## -*- texinfo -*-
## @deftypefn {Function File} {cutoff, points} rc_lowpass (@var{r}, @var{uc}, @var{min_freq}, @var{max_freq}, @var{step})
## Simulates a RC low-pass filter with @var{r} in ohms and @var{uc} in uf.
## @end deftypefn
function [cutoff, points] = rc_lowpass(r, uc, min_freq = 1, max_freq = 100000, step = 10)
	cutoff = 0;
	points = [];
	c = uc * (10^-6);

	for f = min_freq:step:max_freq
		rx = 1 / (2 * pi * f * c);
		db = 10 * log10(rx / (r + rx));

		points = [points db];

		if db <= -60
			return;
		endif

		if ((fix(db) == -3) && (cutoff == 0))
			cutoff = f;
		endif
	end
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} plot_rc_lowpass (@var{r}, @var{uc}, @var{min_freq}, @var{max_freq}, @var{step})
## Plots the frequency response of a RC low-pass filter with @var{r} in ohms and @var{uc} in uf.
## @end deftypefn
function plot_rc_lowpass(r, uc, min_freq = 1, max_freq = 100000, step = 10)
	[cutoff, points] = rc_lowpass(r, uc, min_freq, max_freq, step);

	semilogx(min_freq:step:max_freq, points);
	grid();
	xlabel("Frequency (Hz)");
	ylabel("Magnitude (dB)");
	# TODO: Make this work with all ranges.
	set(gca, "XTickLabel", { "1", "10", "100", "1k", "10k", "100k" })
endfunction

## -*- texinfo -*-
## @deftypefn {function file} {cutoff, points} rc_highpass (@var{r}, @var{uc}, @var{min_freq}, @var{max_freq}, @var{step})
## Simulates a RC high-pass filter with @var{r} in ohms and @var{uc} in uf.
## @end deftypefn
function [cutoff, points] = rc_highpass(r, uc, min_freq = 1, max_freq = 100000, step = 10)
	cutoff = 0;
	points = [];
	c = uc * (10^-6);

	for f = min_freq:step:max_freq
		rx = 1 / (2 * pi * f * c);
		db = 10 * log10(r / (rx + r));

		points = [points db];

		if db <= -60
			return;
		endif

		if ((floor(db) == -3) && (cutoff == 0))
			cutoff = f;
		endif
	end
endfunction

## -*- texinfo -*-
## @deftypefn {Function File} plot_rc_highpass (@var{r}, @var{uc}, @var{min_freq}, @var{max_freq}, @var{step})
## Plots the frequency response of a RC high-pass filter with @var{r} in ohms and @var{uc} in uf.
## @end deftypefn
function plot_rc_highpass(r, uc, min_freq = 1, max_freq = 100000, step = 10)
	[cutoff, points] = rc_highpass(r, uc, min_freq, max_freq, step);

	semilogx(min_freq:step:max_freq, points);
	grid();
	xlabel("Frequency (Hz)");
	ylabel("Magnitude (dB)");
	# TODO: Make this work with all ranges.
	set(gca, "XTickLabel", { "1", "10", "100", "1k", "10k", "100k" })
endfunction

##
## Testing area.
##
#graphics_toolkit("gnuplot");
plot_rc_highpass(1000, 1);

