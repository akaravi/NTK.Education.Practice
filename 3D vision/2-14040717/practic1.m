clc
clear
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = fft2(x, mrows, ncols)
if ismatrix(x)
    if nargin==1
        f = fftn(x);
    else
        f = fftn(x,[mrows ncols]);
    end
else
    if nargin==1
        f = fft(fft(x,[],2),[],1);
    else
        f = fft(fft(x,ncols,2),mrows,1);
    end
end   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FFTN N-dimensional discrete Fourier Transform.
%   FFTN(X) returns the N-dimensional discrete Fourier transform
%   of the N-D array X.  If X is a vector, the output will have
%   the same orientation.
%
%   FFTN(X,SIZ) pads X so that its size vector is SIZ before
%   performing the transform.  If any element of SIZ is smaller
%   than the corresponding dimension of X, then X will be cropped
%   in that dimension.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FFT Discrete Fourier transform.
%   FFT(X) is the discrete Fourier transform (DFT) of vector X.  For
%   matrices, the FFT operation is applied to each column. For N-D
%   arrays, the FFT operation operates on the first non-singleton
%   dimension.
%
%   FFT(X,N) is the N-point FFT, padded with zeros if X has less
%   than N points and truncated if it has more.
%
%   FFT(X,[],DIM) or FFT(X,N,DIM) applies the FFT operation across the
%   dimension DIM.
%   
%   For length N input vector x, the DFT is a length N vector X,
%   with elements
%                    N
%      X(k) =       sum  x(n)*exp(-j*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%                   n=1
%   The inverse DFT (computed by IFFT) is given by
%                    N
%      x(n) = (1/N) sum  X(k)*exp( j*2*pi*(k-1)*(n-1)/N), 1 <= n <= N.
%                   k=1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








img=im2double(imread('rice.png'));

% تعیین ابعاد تصویر
width = 256;  % عرض تصویر
height = 256; % ارتفاع تصویر

% ایجاد تصویر سیاه
black_image = zeros(height, width); 

% ایجاد تصویر با شدت نور 255
light_image = ones(height, width) * 255; 

gray_image =img;
%gray_image =black_image;
%gray_image =light_image;
%gray_image = rgb2gray(img);


dft = karavifft2(gray_image);
dft_shift = fftshift(dft); % جابجایی صفرها به وسط
magnitude_spectrum = log(abs(dft_shift) + 1); % محاسبه طیف دامنه


figure;
subplot(1, 2, 1);
imshow(gray_image, []);
title('Image');
subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
title('m_s');