%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: GetFeatures.m
% Date: 3/30/2014
% Author: Jared Bold
%
% Description:
%   Returns a feature vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ftv] = GetFeatures( imgPath )

if ~exist(imgPath, 'file')
    error( '%s Does not exist!', imgPath );
end

img = imread( imgPath );
if ndims(img) == 3
    img = rgb2gray( img );              % Convert the image to grayscale
end
[w, h] = size(img);
mDim= max([w,h]);
s = 128 / mDim;
img = imresize( img, s );

cellSize = 16;
hog = vl_hog( single(img), cellSize, 'numOrientations', 8 , 'variant', 'dalaltriggs','bilinearOrientations');

ftv = reshape(hog, 1, numel(hog));
clear img;
end