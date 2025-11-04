function g = dftfilt2(F,H,m,n)
% dftfilt2(F,H,m,n) perform Filtering in frequency domain



if isa(F,'double')==0
    F=double(F);
end

if isa(H,'double')==0
    H=double(H);
end
    
%% Filtering
img=F.*H;

%% Change to Spatial Domain

g=ifft2(img);

%imshow(img22,[])

g=g(1:m,1:n);% Remove Zeros

end

