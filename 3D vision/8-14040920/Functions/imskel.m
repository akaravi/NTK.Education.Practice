function skel  =  imskel(image,str)
%  IMSKEL(IMAGE,STR) -  Calculates the  skeleton  of  binary  image  IMAGE  using
%  structuring element  STR.   This  function uses  Lantejoul’s algorithm.
%
skel=zeros(size(image));
e=image;
while  (any(e(:))),
o=imopen(e,str);
skel=skel|(e&~o);
e=imerode(e,str);
end