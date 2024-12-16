function SavePNG(fig, filename, varargin)

% This function exports a matlab figure to a PNG image. The default
% resolution is 100 dots per inch.

% Required Inputs:
%     fig -> handle to figure to be saved (use gcf for current figure)
%     filename -> string; name of image file to be saved

% Optional Inputs (all strings, beginning with '-'):
%   '-rXXX' -> resolution, in dots per inch (replace XXX with a number, e.g., '-r300' means 300 DPI).  
%   '-savefig' -> in addition to the PNG image, save a the figure as a .fig file with the same name
%   '-transparent' -> save the PNG with a transparent background. All pixels matching the figure background color will be made transparent.
%   '-negative' -> invert all colors (may be useful, e.g., if the figure is to be included in a dark-theme presentation)


%% handle inputs

options = parseInputs(varargin{:});

if isstring(filename)
    filename = char(filename);
end

if strcmp(filename(end-3:end), '.png')
    filename = filename(1:end-4);
end

%% Generate RGB image from figure

set(fig, 'InvertHardcopy', 'Off');
X = print(gcf, options.resolution, '-RGBImage');

%% Make alpha channel

alpha = 255*ones(size(X(:,:,1)), 'uint8');

% make background transparent if needed
if options.transparent
    % Find figure background color
    
    bgcolor = uint8(255*fig.Color);
    
    % Set alpha channel to 0 for pixels with background color
    
    % detect background pixels
    bgpixels = (X(:,:,1) == bgcolor(1));
    bgpixels = bgpixels & (X(:,:,2) == bgcolor(2));
    bgpixels = bgpixels & (X(:,:,3) == bgcolor(3));
    
    % make transparent
    alpha(bgpixels) = 0;
end

%% Save png 

if options.negative % negate color if needed
    imwrite(255-X, [filename '.png'], 'Alpha', alpha)
else
    imwrite(X, [filename '.png'], 'Alpha', alpha)
end

%% Save figure if needed

if options.savefig
    savefig(fig, [filename '.fig'])
end

end

%% Local functions

% parse inputs into options structure
function options = parseInputs(varargin)
    options = default_options();

    for a = 1:nargin
        arg = varargin{a};
        if ischar(arg) && ~isempty(arg)
            if arg(1) == '-'
                if (arg(2) == 'r') && ~isnan(str2double(arg(3:end)))
                    options.resolution = arg;
                else
                    switch lower(arg(2:end))
                        case 'transparent'
                            options.transparent = true;
                        case 'negative'
                            options.negative = true;
                        case 'savefig'
                            options.savefig = true;
                    end
                end
            end
        end
    end
end

% default options structure
function opts = default_options()
    opts.transparent = false;
    opts.negative = false;
    opts.resolution = '-r100';
    opts.savefig = false;
end